function pyenv_prompt() {
    local version
    version=$(pyenv version-name)
    if [[ "$version" != "system" ]]; then
        echo "($version) "
    fi
}

export PROMPT='%F{blue}%n@%m %F{green}$(pyenv_prompt)%F{reset}%~ %# '
