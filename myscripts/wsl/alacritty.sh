pwsh.exe -Command '
New-Item -ItemType Directory -Force -Path "$env:APPDATA\alacritty";
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\alacritty\alacritty.toml" -Target "\\wsl$\archlinux\root\.config\alacritty\alacritty.toml"
'
