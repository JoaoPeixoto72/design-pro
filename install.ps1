# install.ps1 — install or junction design-pro into Claude Code, Antigravity, and Codex CLI on Windows.
param(
  [string]$Project = "",
  [string]$Tool = ""
)

$ErrorActionPreference = "Stop"
$RepoRoot = $PSScriptRoot

if (-not (Test-Path (Join-Path $RepoRoot "SKILL.md"))) {
  Write-Error "SKILL.md not found in $RepoRoot. Run install.ps1 from the repository root."
}

$HomeDir = [Environment]::GetFolderPath("UserProfile")

$Targets = @{
  "claude"      = if ($Project) { Join-Path $Project ".claude\skills\design-pro" } else { Join-Path $HomeDir ".claude\skills\design-pro" }
  "antigravity" = if ($Project) { Join-Path $Project ".agents\skills\design-pro" } else { Join-Path $HomeDir ".gemini\config\skills\design-pro" }
  "codex"       = if ($Project) { Join-Path $Project ".codex\skills\design-pro" } else { Join-Path $HomeDir ".codex\skills\design-pro" }
}

function Install-Skill {
  param([string]$ToolName, [string]$Dest)

  $Parent = Split-Path $Dest -Parent
  if (-not (Test-Path $Parent)) {
    New-Item -ItemType Directory -Path $Parent -Force | Out-Null
  }

  if (Test-Path $Dest) {
    # Check if junction or directory
    $item = Get-Item $Dest
    if ($item.Attributes -match "ReparsePoint") {
      [System.IO.Directory]::Delete($Dest)
    } else {
      Remove-Item -Path $Dest -Recurse -Force
    }
  }

  try {
    New-Item -ItemType Junction -Path $Dest -Target $RepoRoot | Out-Null
    Write-Host "[$ToolName] junction created at $Dest"
  } catch {
    # Fallback to copy if junction fails without elevation
    Copy-Item -Path $RepoRoot -Destination $Dest -Recurse -Force -Exclude ".git"
    Write-Host "[$ToolName] copied files into $Dest (junction fallback)"
  }
}

$ToolsToRun = if ($Tool) { @($Tool.ToLower()) } else { @("claude", "antigravity", "codex") }

foreach ($t in $ToolsToRun) {
  if ($Targets.ContainsKey($t)) {
    Install-Skill -ToolName $t -Dest $Targets[$t]
  } else {
    Write-Warning "Unknown tool: $t"
  }
}

Write-Host "Done. design-pro is ready to use."
