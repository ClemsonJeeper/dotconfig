#!/bin/bash
sed -i '/\[External Email\. Be cautious of content\]/{N;d;}' "$1"
exec nvim "$1"
