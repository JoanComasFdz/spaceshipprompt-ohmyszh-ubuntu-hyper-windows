Write-Host "Wait until Ubuntu installation is finised."
Write-Host "Press any key to continue"
Read-Host

Write-Host "========================================="
Write-Host "Installing FiraCode..."
Write-Host "========================================="
choco install firacode -y

Write-Host "========================================="
Write-Host "Updating Ubuntu..."
Write-Host "========================================="
cmd /c "wsl sudo apt-get update; sudo apt-get upgrade"

Write-Host "========================================="
Write-Host "Installing Zsh in Ubuntu..."
Write-Host "========================================="
wsl sudo apt-get install -y zsh

Write-Host "========================================="
Write-Host "Installing Oh My Zsh in Ubuntu..."
Write-Host "========================================="
cmd /c 'wsl sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'

$ubuntuUserName = wsl whoami
$ubuntuHomePath = '\\wsl$\Ubuntu\home\' + $ubuntuUserName
$zshrcFilePath = $ubuntuHomePath + '\.zshrc'

Write-Host "========================================="
Write-Host "Installing SpaceShip Prompt in Ubuntu..."
Write-Host "========================================="
cmd /c 'wsl git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1'
cmd /c 'wsl ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"'

# Add empty new line at the end to make sure there are no syntax issues
Add-Content -Path $zshrcFilePath -Value ""

# Add SpaceShip config at the end of the ~/.zshrc file
$spaceshipZshConfig = @'
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
 user # Username section
 dir # Current directory section
 host # Hostname section
 git # Git section (git_branch + git_status)
 hg # Mercurial section (hg_branch + hg_status)
 package # Package version
 node # Node.js section
 docker # Docker section
 kubectl # Kubectl context section
 terraform # Terraform workspace section
 aws # Aws section
 dotnet # .NET section
 exec_time # Execution time
 line_sep # Line break
 vi_mode # Vi-mode indicator
 jobs # Background jobs indicator
 exit_code # Exit code section
 char # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
'@
Add-Content -Path $zshrcFilePath -Value $spaceshipZshConfig

# Load config into the shell
cmd /c 'wsl source ~/.zshrc'

Write-Host "========================================="
Write-Host "Installing Zi in Ubuntu..."
Write-Host "========================================="
cmd /c 'sh -c "$(curl -fsSL https://git.io/get-zi)" --'
cmd /c 'exec zsh'
cmd /c 'zi self-update'

# Add empty new line at the end to make sure there are no syntax issues
Add-Content -Path $zshrcFilePath -Value ""

# Add plugins at the end of the ~/.zshrc file
$ziPlugins = @'
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light denysdovhan/spaceship-prompt
'@
Add-Content -Path $zshrcFilePath -Value $ziPlugins

# Add empty new line at the end to make sure there are no syntax issues
Add-Content -Path $zshrcFilePath -Value ""

# Load config into the shell
cmd /c 'wsl source ~/.zshrc'

Write-Host "========================================="
Write-Host "Configuring git in Windows..."
Write-Host "========================================="
git config --global core.autocrlf false
git config --global credential.helper wincred

Write-Host "========================================="
Write-Host "Configuring git in Ubuntu..."
Write-Host "========================================="
cmd /c 'wsl git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-wincred.exe"'

Write-Host "========================================="
Write-Host " 🎉 DONE 🎉 "
Write-Host "========================================="