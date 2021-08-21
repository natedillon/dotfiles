# dotfiles

Nate Dillon’s dotfiles for macOS.

## Installation

### Prerequisites

#### Xcode Command Line Tools Installation

For a fresh installation of macOS, run the following commands (if you already have Git installed you can skip this step).

```
sudo softwareupdate -i -a
xcode-select --install
```

**Note:** You can also download the command line tools directly from the [Apple developer website](https://developer.apple.com/download/more/?=command%20line%20tools), which requires an Apple account.

#### Apple Account

You will need to sign in to your Apple account before running the installer to prevent the App Store software installation from failing.

### dotfiles Installation

Clone this repository to the directory of your choice (I like to keep it in `~/Projects/natedillon/dotfiles`, with `~/dotfiles` as a symlink), then run the `install.sh` script.

```
git clone git://github.com/natedillon/dotfiles.git
cd dotfiles
./install.sh
```

## Usage

### Homebrew Bundle

> Bundler for non-Ruby dependencies from Homebrew, Homebrew Cask, Mac App Store and Whalebrew.

Bundle is used to install much of the software in the dotfiles. Currently installed software is dumped into the `Brewfile.dump` file:

```
brew bundle dump -f --file brewfiles/Brewfile.dump
```

More information can be found in the [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) GitHub repo.

### youtube-dl

> youtube-dl is a command-line program to download videos from YouTube.com and a few more sites.

Basic usage:

```
youtube-dl [URL]
```

If default command doesn’t work for 1080p, make sure [ffmpeg](https://ffmpeg.org/) is installed and run this command:

```
youtube-dl -f 'bestvideo+bestaudio/best' [URL]
```

Get an mp4 container and AAC audio with this command:

```
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' [URL]
```

For 4K video, you need to add `--prefer-avconv`:

```
youtube-dl [URL] --prefer-avconv
```


More information can be found on the [youtube-dl](https://ytdl-org.github.io/youtube-dl/) website.
