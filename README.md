# **A Writer's NeoVim**
 
![Loading Screen](assets/LoadingScreen.png)
![Loading Screen](assets/FindFiles.png)
![Loading Screen](assets/FindWord.png)






- 🔥 Transform your Neovim into a full-fledged IWE: Write, Edit and World-build at the speed of thought 
- 💤 Easily customize and extend your config with [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🚀 Stupid fast
- 🧹 Sane default settings and options for writers
- 😻 Eye candy in the form of beautiful color schemes, in dark and light modes, including flavours of Catppuccin, Gruvbox, Nord, NightFox
- 📦 Comes with a wealth of plugins for longform writing, interconnected note-taking (wikis, etc.), and screenwriting. All pre-configured and ready to use



## 🔎 OVI-WHAT-NOW? 

OVIWrite is a [NeoVim](https://neovim.io/) powered Integrated Writing Environment (IWE) built using [LazyVim](https://lazyvim.github.io/) and [💤 lazy.nvim](https://github.com/folke/lazy.nvim). 

The goal is to make it as easy as possible for writers to start using NeoVim out of the box. 

This begs the question: what *kind* of writer would gravitate towards OVIWrite in the first place? Good question. I spend some time discussing it below.

At first Vim, and now NeoVim, have formed the basis of my dream writing environment. Who even dreams of their writing tools? I have no answers except to say that I do venture outside regularly to touch grass and talk to people - don't worry.

I wanted a writing tool that ticked these boxes:

 - Fast AF
 - Switches seamlessly between three specific kinds of writing
   - Long form prose (i.e. novels, academic writing, reports, essays)
   - Research and note-taking
   - Screenwriting
 - Supported a wide range of plain text standards including Markdown and LaTeX. 
 - Adaptable to any platform, Unix style OSs (MacOS, Linux) or otherwise (Windows), desktop or mobile, Android or iOS
 - Offered the features of traditional word processors (Spell and Grammar checking for instance)
 - Offered opinionated quality of life improvements such as Version Control through Git
 
This is a tall order to ask for word processors. It is why conventional word processing software such as MS Word fails, at least for me. 

Granted I wrote my first novel on MS Word, I came to find that it wasn't extensible enough to scale with my needs, nor was it nimble and fast. 

An ideal writing tool should adapt to a writer's needs at a moment's notice.

- Get back to working on the novel? Sure, here's a beautiful LaTeX template for me to work on my novel.
- Write a screenplay? Why not?
- Build an inter-connected network of notes like Obsidian or Notion? Done. 

Here are two demos I presented at the [NeoVimConf](https://neovimconf.live/) where I presented two early versions of OVIWrite.

- [Writing, Editing and World-Building at the Speed of Thought](https://www.youtube.com/watch?app=desktop&v=2ORWaIqyj7k) (version 0.1) (Nov 2021)
- [Vimkipedia: Or How I Built my Second Brain Using Vim](https://www.youtube.com/watch?v=q80hXvorl0o) (version 0.2) (Dec 2022)

Essentially, these two talks served as early demos of OVIWrite versions 0.1 and 0.2. However, the eagle-eyed among you will notice I used a combination of Vim and NeoVim during these talks. This was because I couldn't get some Vim-specific plugins to work with NeoVim, a problem that has since been solved. 

This version of OVIWrite is built entirely in Lua, and follows the modular structure of LazyVim. 

This is version 0.4 (Dec 11th 2023)


## ⌨️  IWE

I needed an Integrated Writing Environment, a toolkit that was fast, yet extensible enough to scale with a writer's changing requirements. 

I spent a lot of time writing on diverse IDEs to get a sense of what I wanted out of my IWE;
in fact, my inspirations for OVIWrite were [VSCode](https://code.visualstudio.com/), [PyCharm](https://www.jetbrains.com/pycharm-edu/) and indeed the many Vim/NeoVim inspired *distros* like [NVChad](https://nvchad.com/), [LunarVim](https://www.lunarvim.org/), and [Doom Emacs](https://github.com/doomemacs/doomemacs). 

I currently run this version of OVIWrite on my Mac (MacOS Sonoma 14.1.2), Linux (popOS 22.04 on my desktop, and Ubuntu Server 22.04 on my server), and Android 12 (OxygenOS 12.1 on a OnePlus 7T). I don't have a Windows machine to test at the moment. iPad testing is ongoing. I am fairly confident that OVIWrite will work pretty great on a semi-recent Android tablet (I don't have an Android tablet to test), as long as Termux is installed. 



## 🎹 FEATURES

I use OVIWrite for the following use-cases: 

- LaTex documents for my novels and academic writing
- Fountain files for writing scripts and screenplays
- Markdown and Org Mode files for writing simpler reports and blogs
- Vim-wiki for my personal Zettelkasten 

See screenshots below. 

OVIWrite is built to be as frictionless as possible for a reasonably experienced Vim/NeoVim user (or indeed reasonably tech savvy) to install and get to writing.

**Windows users**: As mentioned earlier, I don't have a Windows machine to test on at the moment. I would love for Windows users to run OVIWrite on their local machines - your feedback and contributions are most welcome! 

The documentation here, much like the source code, is a fork of Lazy Vim. And like the source code, I've discarded large sections in the documentation that aren't relevant for writers. 

This is a good opportunity though to thank the good folk there who have done an incredible job making this NeoVim distribution frictionless for us non-tech folk.  

## 🔌 PLUGINS 

| Plugins               | Type                                                                                |
|-----------------------|-------------------------------------------------------------------------------------|
| LanguageTool.lua      | Spelling and Grammar                                                                |
| alpha.lua             | Splash Screen                                                                       |
| autopairs.lua         | Automatically close brackets and quotation marks                                    |
| catppuccin.lua        | Color Scheme                                                                        |
| comment.lua           | Commenting of text                                                                  |
| fountain.lua          | Screenwriting                                                                       |
| fzf-vim.lua           | Fast search for files and words                                                     |
| goyo.lua              | Distraction Free Writing                                                            |
| gruvbox.lua           | Color Scheme                                                                        |
| img-clip.lua          | Paste images into Markdown and LaTeX buffers                                        |
| lazygit.lua           | Version control for GitHub                                                          |
| limelight.lua         | Distraction free writing                                                            |
| markdown-preview.lua  | Preview Markdown files                                                              |
| mason-lspconfig.lua   | LSP                                                                                 |
| mason.lua             | LSP                                                                                 |
| nightfox.lua          | Color scheme                                                                        |
| noice.lua             | System notifications                                                                |
| nvim-tree.lua         | File explorer                                                                       |
| nvim-treesitter.lua   | Treesitter integration                                                              |
| nvim-web-devicons.lua | Pretty icons                                                                        |
| nvimorgmode.lua       | Org-mode                                                                            |
| obsidianNvim.lua      | Support for editing Obsidian files                                                  |
| pomo.lua              | Pomodoro timer                                                                      |
| telescope.lua         | Telescope, for fast search across buffers, directories, help documentation, etc.,                                                                      |
| translate.lua         | Translate to and from English, Tamil, Sinhala and French                                                                                                 |
| twilight.lua          | Yet another distraction free writing aid                                                                                                                                             |
| vim-grammarous.lua    | Grammar checker                                                                                                                                                                                                               |
| vim-latex-preview.lua | Preview LaTeX documents                                                                                                                                                                                                                                                                             |
| vim-pencil.lua        | line wrapping for prose                                                                                                                                                                                                                                                                                                                                             |
| vim-wiki.lua          | Personal knowledge management tool                                                                                                                                                                                                                                                                                                                                                                                              |
| vim-zettel.lua        | Zettelkasten function                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| vimorg.lua            | additional Org-Mode support within NeoVim                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| vimtex.lua            | LaTeX support                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| whichkey.lua          | Keyboard binding lookup                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| zen-mode.lua          | Distraction Free writing                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |

## KEYBOARD SHORTCUTS

**OVIWrite** uses [which-key.nvim](https://github.com/folke/which-key.nvim) to help you remember your
keymaps. Just press any key like `<space>` and you'll see a popup with all
possible keymaps starting with `<space>`.


- default `<leader>` is `<space>`

<!-- keymaps:start -->

### Startup 

| Key | Mode   | Description          |
|-----|--------|----------------------|
| f   | Normal | Find files           |
| n   | Normal | New                  |
| r   | Normal | Recent files         |
| g   | Normal | Grep (find word)     |
| l   | Normal | Lazy Package Manager |
| q   | Normal | Quit OVIWrite        |



## ⚡️ REQUIREMENTS

- Neovim >= **0.8.0** and its associated dependencies (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional but highly recommended)_**
- LaTeX compiler
- [Pandoc](https://pandoc.org/)

## 📺 SCREENSHOTS

Note: The screenshots below show a variety of color schemes at play: Nightfox, DawnFox and NordFox. Also included in the config: Gruvbox and flavours of Catppuccin. I've included my favourite color schemes; users are, of course, free to add whatever color scheme that is available in the NeoVim ecosystem.  

### Long-form Writing

- Longform Writing; LaTeX

![Loading Screen](assets/LaTeX.png)

![Loading Screen](assets/Essay.png)


- Longform Writing; Org-Mode
 
 
![Loading Screen](assets/Org.png)
 
 
- Longform Writing; Markdown

![Loading Screen](assets/Markdown.png)




### Screenwriting 

- Screenwriting in Fountain format

![Loading Screen](assets/Fountain.png)

### Note-taking and Research

- Zettelkasten 

![Loading Screen](assets/Zettle.png)


## 👨💻 AUDIENCE 

I hear you: Who is this for? 

Personally, I think of Vim/NeoVim as analogous to a musical instrument, say a piano. The first interaction with a piano is often messy, confusing and overwhelming; stick with it, and there is a little bit of magic waiting to be experienced.

This mindset has helped immensely in scaling the steep learning curve that comes with Vim's modal editing philosophy.

But unlike me, writers like you don't have to invest the additional time in learning how to wrangle Vim to be a tool for writing. All you need is a couple of weeks practicing Vim motions and understanding its different modes. 

Once you overcome that hurdle, install OVIWrite and get writing! 

### I am a writer, not a tech person. I don't know programming or how to read code. This looks overwhelming. Is this for me?

Only you can answer that. I don't consider myself to be a tech person - tech savvy, yes but I can barely read code myself. 

So no lies here: (Neo)Vim motions and modal editing requires a rewiring of our writer brains. But the good news is that it shouldn't take more than two weeks of 10-15 minutes a day. [Vimtutor](https://www.youtube.com/watch?v=WAvKDsjqZ70), built into Vim, is the best place to practice.

There is also some steep knowledge acquisition required to understand NeoVim's internal nuts and bolts. This is only required if you want Vim to work *exactly* as you want it to. I did, which is why I set off on this journey three years ago. 

You don't.  

OVIWrite offers a higher floor from which to start your own explorations. 

You *don't* need to know how to program or read Lua code, to use OVIWrite. All that work has been done for you. Nothing is stopping you from peaking behind the curtains at the source code. Add or modify the code as you see fit if you are feeling extra adventurous 

More good news: Vim is almost 40 years old. The community has been around for decades, and have extensively documented tips, tricks and hacks. Chances are the error message you are seeing has been seen countless times before by countless people, and in all those occasions there was an experienced Vim user helping out a new-comer. I can speak from experience on this last fact.

Once again, thinking of OVIWrite as akin to a musical instrument might be the best way to overcome its apparent complexity; instead of music, OVIWrite is purpose-built for efficient (and damn near magical) textual recall, creation and manipulation. 

TL;DR: Being tech savvy won't hurt but **it is not** a requirement. Being patient is. Heavy Googling is (as any programmer will tell you). 

### Rewarding Long-Term Benefits:

I can only offer personal anecdotes here in lieu of a more scientific approach. 

I have steadily become very productive in the three years since my first encounter with Vim. 

The procrastination associated with writing has disappeared, and I believe part of that is because I don't have to struggle through the bloated mess that is MSWord. 

Editing, too, has become a joy because editing is Vim's superpower. Combined with the curated plugins included in OVIWrite, you should be writing, editing and world-building at the speed of thought!

# INSTALLATION

## First Steps (Linux, Mac and Windows)


1. Install NeoVim. Ensure that it is close to the latest version i.e. > 0.8, but preferably 0.9
2. Install Pandoc
3. Install Git
4. Install a Terminal emulator like Kitty/Alacritty/Konsole/iTerm
5. Install a minimalist PDF reader like Zathura or Skim

## Linux and MacOS

1. Install brew from [here](https://brew.sh/) using the following command: ```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"```

2. Run the following commands

```
brew update brew doctor brew upgrade
brew install node
brew install python
brew install fzf
brew install ripgrep
brew install pandoc
brew install pandoc-plot
brew install npm
brew install wget
sudo pip3 install neovim-remote
pip3 install --user pynvim
brew install --cask mactex```


```

3. Reboot your machine. Open NeoVim and type ':' to go into command mode. Type 'checkhealth'

## Windows

I am unsure of package managers for Windows and how they work. Testing will be done soon and documentation will be expanded after that. 


## Installing OVIWrite

### Unix Systems (Linux and MacOS)

```
bash
# Clone the repository
git clone https://github.com/MiragianCycle/OVIWrite.git

# Move the 'nvim' folder to the NeoVim configuration directory
mv OVIWrite/nvim ~/.config/nvim

```

### Windows

```
cmd
:: Clone the repository
git clone https://github.com/MiragianCycle/OVIWrite.git

:: Move the 'nvim' folder to the NeoVim configuration directory (example: %APPDATA%\Local\nvim)
move OVIWrite\nvim %APPDATA%\Local\nvim

```


### 🚗 ROADMAP

	    - [ ] Public demo on YouTube
	    - [X] LSP 
	    - [X] Autocomplete
	    - [ ] Testing out on non Unix systems i.e. Windows
	    - [ ] Documentation
		    - [X] Website on GitHub maybe?
			    - [ ] Blog: The case for writing in plain text
	    - [ ] In-depth Help Documentation
	    - [ ] Installation streamlining
	    - [ ] Features planned for version 0.5
		  - [ ] Snippets
		  - [ ] Thesaurus 
		  - [ ] BibTex and Zotero integrations



## 🤝 CAN I CONTRIBUTE?

Please, and thank you. 

Contributions are encouraged. Feel free to make a pull request with modifications. If you want to contribute at a deeper level - maybe even forking NeoVim for writing outright - do reach out to me. I will be happy to collaborate and learn from the community. 

## ䷑ Authors

- [@MiragianCycle](https://www.github.com/MiragianCycle), Theena Kumaragurunathan
- [@mhegreberg](https://github.com/mhegreberg), Mark Hegreberg


## 🎁 ACKNOWLEDGEMENTS 

None of this would be possible without the contributions of the entire Vim and NeoVim eco-systems. Please contribute in anyway, financial or otherwise, to these incredible projects and the tireless people who maintain them. 


## License

[GNU GPLv3](https://choosealicense.com/licenses/gpl-3.0/)



