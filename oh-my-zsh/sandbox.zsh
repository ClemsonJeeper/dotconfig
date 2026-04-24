_expand_sandbox_path() {
  local cwd=$PWD

  # Check if we're in a sandbox (/b/workspace/*)
  if [[ ! $cwd =~ ^/b/workspace/[^/]+/ ]]; then
    return
  fi

  local input

  local stty_settings=$(stty -g < /dev/tty)
  stty icanon echo < /dev/tty

  # Print colored prompt with blue background
  print -Pn ' %K{cyan}%F{black} Enter TARGET_OS (eg: ub24/amd64):%k%f ' > /dev/tty
  read -r input < /dev/tty

  stty $stty_settings < /dev/tty

  local expanded=${cwd//\/src\//\/obj\/${input}\/}

  LBUFFER="${LBUFFER}${expanded}"
  zle redisplay
}

zle -N _expand_sandbox_path
bindkey '^P' _expand_sandbox_path
