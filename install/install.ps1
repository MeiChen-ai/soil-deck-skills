$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$Skills = @("soil-teaching-deck", "soil-html-deck", "soil-image-deck")

$Targets = @(
  @{ Name = "Google Antigravity"; Path = "$HOME\.gemini\config\skills" },
  @{ Name = "OpenCode (.config)"; Path = "$HOME\.config\opencode\skills" },
  @{ Name = "OpenCode (.agents)"; Path = "$HOME\.agents\skills" },
  @{ Name = "Claude Code / Cowork"; Path = "$HOME\.claude\skills" },
  @{ Name = "Codex"; Path = "$HOME\.codex\skills" }
)

foreach ($Target in $Targets) {
  $DestRoot = $Target.Path
  if (-not (Test-Path $DestRoot)) {
    New-Item -ItemType Directory -Force -Path $DestRoot | Out-Null
  }
  foreach ($Skill in $Skills) {
    $Src = Join-Path $RepoRoot "skills\$Skill"
    $Dest = Join-Path $DestRoot $Skill
    if (Test-Path $Dest) {
      Remove-Item -Recurse -Force $Dest
    }
    Copy-Item -Path $Src -Destination $Dest -Recurse -Force
  }
  Write-Host "[OK] Installed ($($Skills -join ', ')) to $($Target.Name): $DestRoot" -ForegroundColor Green
}

Write-Host "`n🎉 All 3 SOIL Deck Skills (soil-teaching-deck, soil-html-deck, soil-image-deck) are installed!" -ForegroundColor Cyan
Write-Host "👉 Open a new chat in Antigravity, OpenCode, Claude Code, or Codex to start building teaching decks." -ForegroundColor Cyan
