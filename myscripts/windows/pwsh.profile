# ========================================
# ZSH-LIKE POWERSHELL PROFILE (STARSHIP)
# ========================================

# --- Load PSReadLine ---
Import-Module PSReadLine -ErrorAction SilentlyContinue

# ========================================
# AUTOSUGGESTIONS (like zsh)
# ========================================
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle InlineView

# ========================================
# HISTORY SEARCH (↑ ↓ like zsh)
# ========================================
Set-PSReadLineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# ========================================
# TAB COMPLETION (zsh menu)
# ========================================
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# ========================================
# CORE MOVEMENT (zsh/emacs)
# ========================================
Set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
Set-PSReadLineKeyHandler -Key Ctrl+b -Function BackwardChar
Set-PSReadLineKeyHandler -Key Ctrl+f -Function ForwardChar

# ========================================
# FIXED Ctrl+E (expand + go to end)
# ========================================
Set-PSReadLineKeyHandler -Key Ctrl+e -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion()
    $line = ''
    $cursor = 0
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($line.Length)
}

# ========================================
# EDITING (zsh-like)
# ========================================
Set-PSReadLineKeyHandler -Key Ctrl+u -Function BackwardKillLine
Set-PSReadLineKeyHandler -Key Ctrl+k -Function KillLine
Set-PSReadLineKeyHandler -Key Ctrl+w -Function BackwardKillWord
Set-PSReadLineKeyHandler -Key Ctrl+y -Function Yank

# ========================================
# WORD MOVEMENT (Alt keys like zsh)
# ========================================
Set-PSReadLineKeyHandler -Key Alt+b -Function BackwardWord
Set-PSReadLineKeyHandler -Key Alt+f -Function ForwardWord
Set-PSReadLineKeyHandler -Key Alt+d -Function KillWord

# ========================================

# SUGGESTION CONTROL
# ========================================
Set-PSReadLineKeyHandler -Key RightArrow -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Key Alt+RightArrow -Function AcceptNextSuggestionWord

# ========================================
# HISTORY SEARCH (Ctrl+R)
# ========================================
Set-PSReadLineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory

# ========================================
# CLEAR SCREEN
# ========================================
Set-PSReadLineKeyHandler -Key Ctrl+l -Function ClearScreen

# ========================================
# HISTORY SETTINGS
# ========================================
Set-PSReadLineOption -MaximumHistoryCount 10000
Set-PSReadLineOption -HistoryNoDuplicates

# ========================================
# OPTIONAL MODULES (auto load if installed)
# ========================================
if (Get-Module -ListAvailable -Name posh-git) {
    Import-Module posh-git
}

if (Get-Module -ListAvailable -Name Terminal-Icons) {
    Import-Module Terminal-Icons
}

if (Get-Module -ListAvailable -Name PSFzf) {
    Import-Module PSFzf
    Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
}

# ========================================
# STARSHIP PROMPT (replaces oh-my-posh)
# ========================================
Invoke-Expression (&starship init powershell)

# ========================================
# ZSH-LIKE ALIASES
# ========================================
Set-Alias ll Get-ChildItem
Set-Alias la "Get-ChildItem -Force"
Set-Alias grep Select-String
Set-Alias which Get-Command

function ..  { Set-Location .. }
function ... { Set-Location ../.. }

# ========================================
# END
# ========================================
