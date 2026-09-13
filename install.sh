#!/usr/bin/env bash
# install.sh — install or symlink design-pro into Claude Code, Antigravity, and Codex CLI.
# Usage:
#   ./install.sh                     # global install for all three IDEs
#   ./install.sh --project <path>    # install into a specific project
#   ./install.sh --tool claude       # restrict to one of: claude | antigravity | codex
#
# Idempotent. Re-running updates existing links.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -f "$REPO_ROOT/SKILL.md" ]]; then
  echo "ERROR: SKILL.md not found in $REPO_ROOT. Run install.sh from the repository root." >&2
  exit 1
fi

PROJECT=""
TOOL_FILTER=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) PROJECT="$2"; shift 2 ;;
    --tool)    TOOL_FILTER="$2"; shift 2 ;;
    -h|--help)
      sed -n '2,9p' "$0"
      exit 0 ;;
    *) echo "Unknown flag: $1" >&2; exit 2 ;;
  esac
done

# On Windows or WSL2 targeting Windows drives, delegate to install.ps1
if command -v powershell.exe >/dev/null 2>&1 && { [[ -n "${WSL_DISTRO_NAME:-}" ]] || [[ "$(uname -s)" =~ (MINGW|MSYS|CYGWIN) ]]; }; then
  PS_ARGS=()
  [[ -n "$PROJECT" ]] && PS_ARGS+=("-Project" "$(wslpath -w "$PROJECT" 2>/dev/null || echo "$PROJECT")")
  [[ -n "$TOOL_FILTER" ]] && PS_ARGS+=("-Tool" "$TOOL_FILTER")
  powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$REPO_ROOT/install.ps1" "${PS_ARGS[@]}"
  exit 0
fi

declare -A TARGETS
if [[ -n "$PROJECT" ]]; then
  PROJECT="$(cd "$PROJECT" && pwd)"
  TARGETS[claude]="$PROJECT/.claude/skills/design-pro"
  TARGETS[antigravity]="$PROJECT/.agents/skills/design-pro"
  TARGETS[codex]="$PROJECT/.codex/skills/design-pro"
else
  TARGETS[claude]="$HOME/.claude/skills/design-pro"
  TARGETS[antigravity]="$HOME/.gemini/config/skills/design-pro"
  TARGETS[codex]="$HOME/.codex/skills/design-pro"
fi

install_into() {
  local tool="$1"
  local dest="$2"
  local parent_dir
  parent_dir="$(dirname "$dest")"
  mkdir -p "$parent_dir"
  
  if [[ -L "$dest" || -e "$dest" ]]; then
    rm -rf "$dest"
  fi
  
  ln -sfn "$REPO_ROOT" "$dest"
  echo "[$tool] linked design-pro into $dest"
}

for tool in claude antigravity codex; do
  if [[ -n "$TOOL_FILTER" && "$TOOL_FILTER" != "$tool" ]]; then continue; fi
  install_into "$tool" "${TARGETS[$tool]}"
done

echo "Done. design-pro is ready to use."
