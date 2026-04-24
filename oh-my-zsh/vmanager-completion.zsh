# vmanager.py zsh completion
# Source this file from ~/.zshrc:
#   source /path/to/vmanager-completion.zsh

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

# Complete host arguments from ~/.vmanager/hosts.csv (friendly names only,
# annotated with their fqdn).
_vmanager_hosts() {
  local csv="$HOME/.vmanager/hosts.csv"
  [[ -r "$csv" ]] || return 0

  local -a items
  local name fqdn skip_header=1
  while IFS=',' read -r name fqdn; do
    if (( skip_header )); then
      skip_header=0
      continue
    fi
    # Strip whitespace (handles CRLF line endings too)
    name="${name//[[:space:]]/}"
    fqdn="${fqdn//[[:space:]]/}"
    [[ -z "$name" ]] && continue
    items+=( "${name}:${fqdn}" )
  done < "$csv"

  (( ${#items} )) && _describe -t hosts 'host' items
}

# Complete config names from ~/.vmanager/vmm-config/*.conf (stem only).
# Descriptions are loaded from ~/.vmanager/vmm-config/configs.csv when present.
_vmanager_configs() {
  local dir="$HOME/.vmanager/vmm-config"
  [[ -d "$dir" ]] || return 0

  # Load descriptions from configs.csv if available.
  local -A _cfg_desc
  local csv="$HOME/.vmanager/vmm-config/configs.csv"
  if [[ -r "$csv" ]]; then
    local _filename _description _image_required _skip_header=1
    while IFS=',' read -r _filename _description _image_required; do
      if (( _skip_header )); then
        _skip_header=0
        continue
      fi
      _filename="${_filename//[[:space:]]/}"
      _filename="${_filename%.conf}"
      # Trim leading/trailing spaces from description
      _description="${_description#"${_description%%[! ]*}"}"
      _description="${_description%"${_description##*[! ]}"}"
      [[ -n "$_filename" ]] && _cfg_desc[$_filename]="$_description"
    done < "$csv"
  fi

  local -a items
  local f stem
  for f in "$dir"/*.conf(N); do
    stem="${f:t:r}"   # basename without .conf extension
    if [[ -n "${_cfg_desc[$stem]}" ]]; then
      items+=( "${stem}:${_cfg_desc[$stem]}" )
    else
      items+=( "$stem" )
    fi
  done

  (( ${#items} )) && _describe -t configs 'config' items
}

# ---------------------------------------------------------------------------
# Main completion function
# ---------------------------------------------------------------------------

_vmanager() {
  local -a commands=(
    'list:list host status, or show live vmm output for one host'
    'list-config:list available topology configuration names'
    'start:start a new topology on a host'
    'stop:stop and destroy the topology on a host'
    'ping:ping the VMs in the topology on a host'
    'serial:show a snapshot of the serial console on a host'
    'update:sync the local DB with live vmm state on all hosts'
  )

  # Find the subcommand word and its index in $words (1-based).
  local subcmd="" subcmd_idx=0
  local -i i
  for (( i = 2; i <= ${#words}; i++ )); do
    case "${words[$i]}" in
      list|list-config|start|stop|ping|serial|update)
        subcmd="${words[$i]}"
        subcmd_idx=$i
        break
        ;;
    esac
  done

  # No subcommand typed yet.
  if [[ -z "$subcmd" ]]; then
    # If -h was already typed (vmanager -h <tab>), complete command names only.
    local has_h=0
    for (( i = 2; i < CURRENT; i++ )); do
      [[ "${words[$i]}" == "-h" ]] && has_h=1 && break
    done

    if (( has_h )); then
      _describe -t commands 'command' commands
    else
      # vmanager <tab>: offer commands and -h
      local -a opts=('-h:show help; use -h <command> for command-specific help')
      _describe -t options 'option' opts
      _describe -t commands 'command' commands
    fi
    return
  fi

  # Position of the cursor word relative to the subcommand:
  #   1 = first argument after the subcommand, 2 = second, …
  local -i pos=$(( CURRENT - subcmd_idx ))

  case "$subcmd" in
    list)
      # list [HOST]
      case $pos in
        1) _vmanager_hosts ;;
      esac
      ;;
    list-config|update)
      # No arguments
      ;;
    start)
      # start CONFIG [IMAGE] [--host HOST]
      # Count non-option positional args after subcommand.
      local -i positional_count=0
      local skip_next=0
      for (( i = subcmd_idx + 1; i < CURRENT; i++ )); do
        local word="${words[$i]}"
        if (( skip_next )); then
          skip_next=0
          continue
        fi
        if [[ "$word" == "--host" ]]; then
          skip_next=1
          continue
        fi
        [[ "$word" == --* ]] && continue
        (( positional_count++ ))
      done

      case $positional_count in
        0) _vmanager_configs ;;
        1)
          # After CONFIG: offer file completion and --host
          local -a host_opt=('--host[target host (default: first free)]:host:_vmanager_hosts')
          _arguments "${host_opt[@]}"
          _files
          ;;
        *)
          _arguments '--host[target host (default: first free)]:host:_vmanager_hosts'
          ;;
      esac
      ;;
    stop|ping)
      # <subcommand> HOST
      case $pos in
        1) _vmanager_hosts ;;
      esac
      ;;
    serial)
      # serial HOST [-t VM]
      case $pos in
        1) _vmanager_hosts ;;
        *) _arguments '-t[virtual machine for interactive console]:vm:' ;;
      esac
      ;;
  esac
}

compdef _vmanager vmanager.py vmanager
