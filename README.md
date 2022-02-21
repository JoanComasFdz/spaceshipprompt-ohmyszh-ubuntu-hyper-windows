# spaceshipprompt-ohmyszh-ubuntu-hyper-windows
Step by step guide to have Hyper, Ubuntu, Zsh, Oh My Zsh and Spaceship Prompt in Windows.

# What you get

![Hyper Demo](https://i.imgur.com/mpN2s1a.png)

# Features
- Very cool UI
- Multiple tabs in a single Window
- Multiple panes in a single Tab
- Text search in each pane
- Integrated git support (working both in Windows and Linux)
- Icons and version for the most usual frameworks (dotnet, node, python, java, docker, etc)
- Syntax highlighting
- Command predictions
- No need to write `cd folder`, `cd ..` . Just write `folder`, `..`


# Pre-requisites
- Windows 10 19041 or later (WSL2)
- Admin rights
- [Chocolatey](https://chocolatey.org/)
- [Visual Studio Code](https://code.visualstudio.com/) + [Remote WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) extension

# Installation
## 1. Install Ubuntu in Windows
1. Install WSL: Run in PowerShell As Admin:
```
wsl --install
```

2. Restart Windows
3. Wait until Ubuntu is automatically installed. It will ask you for credentials.
4. Update to latest:
```
sudo apt-get update
sudo apt-get upgrade
```

5. Close Ubuntu
6. Install [FiraCode font](https://github.com/tonsky/FiraCode): Run in PowerShell as Admin:
```
choco install firacode -y
```

---

## 2. Install all the tools: [Zsh](https://en.wikipedia.org/wiki/Z_shell), [Oh My Zsh](https://ohmyz.sh/), [SpaceShip Prompt](https://github.com/spaceship-prompt/spaceship-prompt) and [Zi](https://github.com/z-shell/zi) in Ubuntu
Open Ubuntu
### Install [Zsh](https://en.wikipedia.org/wiki/Z_shell) 
```
sudo apt-get install -y zsh
```

### Install [Oh My Zsh](https://ohmyz.sh/)
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install [SpaceShip Prompt](https://github.com/spaceship-prompt/spaceship-prompt):

1. Download the code:
```
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
```

2. Create symbolyc link:
```
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

3. Add SpaceShip Prompt config to ~/.zshrc
```
code ~/.zshrc
```

4. Paste the following code at the end of the `~/.zshrc` file and save.
```
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

```
> Note: Make sure to leave a blank line at the end

5. Load this new config:
```
source ~/.zshrc
```

### 3. Install [Zi](https://github.com/z-shell/zi) to add plugins to Spaceship:
```
sh -c "$(curl -fsSL https://git.io/get-zi)" --
exec zsh
zi self-update
```

7. Add the following lines at the end of the `~/.zshrc` file and save:
```
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light denysdovhan/spaceship-prompt
```

8. Load this new config (it will clone many git repos, takes some time):
```
source ~/.zshrc
```

---

## 3. Install Hyper
1. Install [Hyper](https://hyper.is/): Run in PowerShell as Admin:
```
choco install hyper -y
```

2. Open Hyper
3. Edit Settings: Press [CONTROL] [,]
4. Overwrite the settings with this ones:
```
// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.
 
 
module.exports = {
    config: {
      // choose either `'stable'` for receiving highly polished,
      // or `'canary'` for less polished but more frequent updates
      updateChannel: 'stable',
 
      // default font size in pixels for all tabs
      fontSize: 12,
 
      // font family with optional fallbacks
      fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
 
      // default font weight: 'normal' or 'bold'
      fontWeight: 'normal',
 
      // font weight for bold characters: 'normal' or 'bold'
      fontWeightBold: 'bold',
 
      // line height as a relative unit
      lineHeight: 1,
 
      // letter spacing as a relative unit
      letterSpacing: 0,
 
      // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
      cursorColor: 'rgba(248,28,229,0.8)',
 
      // terminal text color under BLOCK cursor
      cursorAccentColor: '#000',
 
      // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
      cursorShape: 'BEAM',
 
      // set to `true` (without backticks and without quotes) for blinking cursor
      cursorBlink: true,
 
      // color of the text
      foregroundColor: '#fff',
 
      // terminal background color
      // opacity is only supported on macOS
      backgroundColor: '#000',
 
      // terminal selection color
      selectionColor: 'rgba(248,28,229,0.3)',
 
      // border color (window, tabs)
      borderColor: '#333',
 
      // custom CSS to embed in the main window
      css: '',
 
      // custom CSS to embed in the terminal window
      termCSS: '',
 
      // if you're using a Linux setup which show native menus, set to false
      // default: `true` on Linux, `true` on Windows, ignored on macOS
      showHamburgerMenu: '',
 
      // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
      // additionally, set to `'left'` if you want them on the left, like in Ubuntu
      // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
      showWindowControls: '',
 
      // custom padding (CSS format, i.e.: `top right bottom left`)
      padding: '12px 14px',
 
      // the full list. if you're going to provide the full color palette,
      // including the 6 x 6 color cubes and the grayscale map, just provide
      // an array here instead of a color map object
      colors: {
        black: '#000000',
        red: '#C51E14',
        green: '#1DC121',
        yellow: '#C7C329',
        blue: '#0A2FC4',
        magenta: '#C839C5',
        cyan: '#20C5C6',
        white: '#C7C7C7',
        lightBlack: '#686868',
        lightRed: '#FD6F6B',
        lightGreen: '#67F86F',
        lightYellow: '#FFFA72',
        lightBlue: '#6A76FB',
        lightMagenta: '#FD7CFC',
        lightCyan: '#68FDFE',
        lightWhite: '#FFFFFF',
      },
 
      // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
      // if left empty, your system's login shell will be used by default
      //
      // Windows
      // - Make sure to use a full path if the binary name doesn't work
      // - Remove `--login` in shellArgs
      //
      // Bash on Windows
      // - Example: `C:\\Windows\\System32\\bash.exe`
      //
      // PowerShell on Windows
      // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
      shell: 'C:\\Windows\\System32\\wsl.exe',
 
      // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
      // by default `['--login']` will be used
      //shellArgs: ['--login'],
      shellArgs: [],
 
      // for environment variables
      env: {},
 
      // set to `false` for no bell
      bell: 'SOUND',
 
      // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
      copyOnSelect: false,
 
      // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
      defaultSSHApp: true,
 
      // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
      // selection is present (`true` by default on Windows and disables the context menu feature)
      quickEdit: false,
 
      // choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
      // or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
      // (inside tmux or vim with mouse mode enabled for example).
      macOptionSelectionMode: 'vertical',
 
      // URL to custom bell
      // bellSoundURL: 'http://example.com/bell.mp3',
 
      // Whether to use the WebGL renderer. Set it to false to use canvas-based
      // rendering (slower, but supports transparent backgrounds)
      webGLRenderer: true,
 
      // for advanced config flags please refer to https://hyper.is/#cfg
 
      paneNavigation: {
        debug: true,
        hotkeys: {
          navigation: {
            up: 'control+shift+up',
            down: 'control+shift+down',
            left: 'control+shift+left',
            right: 'control+shift+right'
          },
          jump_prefix: 'control+shift', // completed with 1-9 digits
          permutation_modifier: 'shift', // Added to jump and navigation hotkeys for pane permutation
          maximize: 'meta+enter'
        },
        showIndicators: true, // Show pane number
        indicatorPrefix: '⌥', // Will be completed with pane number
        indicatorStyle: { // Added to indicator <div>
          position: 'absolute',
          top: 0,
          left: 0,
          fontSize: '10px'
        },
        focusOnMouseHover: false,
        inactivePaneOpacity: 0.6 // Set to 1 to disable inactive panes dimming
      },
 
      activeTab: '🚀',
 
      hyperline: {
        plugins: [
            "hostname",
            "cpu",
            "memory",
        ]
      },
 
      hyperBorder: {
        borderWidth: '1px',
        animate: true,
      },
 
      hyperTabs: {
        trafficButtons: false,
        border: false,
        tabIconsColored: true,
        activityColor: 'salmon',
       },
 
    },
 
    // a list of plugins to fetch and install from npm
    // format: [@org/]project[#version]
    // examples:
    //   `hyperpower`
    //   `@company/project`
    //   `project#1.0.1`
    plugins: [
      'hyper-search',
      'hyper-opacity',
      'hyperlinks',
      'hyperborder',
      'hyper-dracula',
      'hyper-pane', // https://github.com/chabou/hyper-pane/issues/69
      'hyperline',
      'hyper-tab-icons',
    ],

    // in development, you can create a directory under
    // `~/.hyper_plugins/local/` and include it here
    // to load it and avoid it being `npm install`ed
    localPlugins: [],
 
    keymaps: {
      // Example
      // 'window:devtools': 'cmd+alt+o',
    },
 
  };
```
5. Save and Close.
6. Several pop ups will appear. Wait until all plugins are loaded, this can take some time.
7. Close and open it again.

---

# Git configuration
Since Windows and Linux use different default line endings, Git may report a large number of modified files that have no differences aside from their line endings. To prevent this from happening, you can disable line ending conversion on the Windows side.

[More info](https://code.visualstudio.com/docs/remote/troubleshooting#_resolving-git-line-ending-issues-in-containers-resulting-in-many-modified-files)

## Avoid checking line endinges:
1. Run in PowerShell as Admin:
```
git config --global core.autocrlf false
```

## Share git credentials between Windows and WSL
[More info](https://code.visualstudio.com/docs/remote/troubleshooting#_sharing-git-credentials-between-windows-and-wsl)
1. Run in PowerShell as Admin:
```
 git config --global credential.helper wincred
```

2. Run in Hyper
```
 git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-wincred.exe"
```

---

# Shortcuts

## Copy Paste
* Copy: `[CONTROL]` + `[SHIFT]` + `[C]`
* Paste: `[CONTROL]` + `[SHIFT]` + `[V]`

## Search
* Search: `[CONTROL]` + `[SHIFT]` + `[F]`

## Panes
* New vertical pane on the right: `[CONTROL]` + `[SHIFT]` + `[D]`
* New horizontal pane below: `[CONTROL]` + `[SHIFT]` + `[E]`
* Close current pane: `[CONTROL]` + `[SHIFT]` + `[W]`
* Go to pane above: `[SHIFT]` + `[↑]`
* Go to pane below: `[SHIFT]` + `[↓]`
* Go to pane on the rifht: `[SHIFT]` + `[→]`
* Go to pane on the left: `[SHIFT]` + `[←]`

## Tabs
* New tab: `[CONTROL]` + `[SHIFT]` + `[T]`
* Cycle tabs: `[CONTROL]` + `[TAB]`
* Go to tab number: `[CONTROL]` + `[{number}]`

## Window
* Quit: `[CONTROL]` + `[SHIFT]` + `[Q]` 
* New window: `[CONTROL]` + `[SHIFT]` + `[M]`

---

# Get used to the command line
Learn more about how to get most out of the CLI reading this awesome list of commands:

[Github | You Don't Need GUI](https://github.com/you-dont-need/You-Dont-Need-GUI)