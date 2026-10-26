# shellcheck shell=bash
# Sourced by the tools that read or write the theme itself, to find it.
#
# The theme is its own repository, parker-brown-family/omarchy-terminal-delight-theme,
# because a theme carries no code. The tools that touch it work on a checkout of
# it: the one TD_THEME_DIR names, or else the one cloned beside this repository.
tools_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
THEME_ROOT="${TD_THEME_DIR:-$(dirname "$tools_root")/omarchy-terminal-delight-theme}"
if [[ ! -f $THEME_ROOT/colors.toml ]]; then
  echo "no Terminal Delight theme checkout at $THEME_ROOT" >&2
  echo "  git clone https://github.com/parker-brown-family/omarchy-terminal-delight-theme $(dirname "$tools_root")/omarchy-terminal-delight-theme" >&2
  echo "  or point TD_THEME_DIR at one" >&2
  exit 1
fi
THEME_ROOT="$(cd "$THEME_ROOT" && pwd)"
