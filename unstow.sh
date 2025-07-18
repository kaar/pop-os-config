#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

stow -t "$HOME" -D .
