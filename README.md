# **OVIWrite: A WRITER'S NEOVIM**
 
![Loading Screen](assets/LoadingScreen.png)
![Loading Screen](assets/FindFiles.png)
![Loading Screen](assets/FindWord.png)




- 🔥 Transform your Neovim into a full-fledged IWE
- 💤 Easily customize and extend your config with [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🚀 Stupid fast
- 🧹 Sane default settings for options for writers
- 📦 Comes with a wealth of plugins for longform writing, interconnected note-taking (wikis, etc.), and screenwriting. All pre-configured and ready to use

## OVI-WHAT NOW? 

OVIWrite is a [NeoVim](https://neovim.io/) Integrated Writing Environment (IWE) powered by [LazyVim](https://lazyvim.github.io/) and [💤 lazy.nvim](https://github.com/folke/lazy.nvim)
to make it easy for writers to start using NeoVim out of the box. 

This begs the question: what *kind* of writer would gravitate towards OVIWrite? It is a fair question and it is covered in detail below.

Vim, at first, and now NeoVim have formed the basis of my dream writing environment. Who even dreams of their writing tools? Good question, I have no answers except to say that I do venture outside regularly to touch grass - don't worry.

I wanted a writing tool that ticked these boxes:

 - Fast AF
 - Adaptable to any platform, desktop or mobile, Android or IOS
 - Had the features of traditional word processors (Spell and Grammar checking for instance)
 - Had quality of life improvements such as Version Control through Git
 - Supported a wide range of plain text standards such as Markdown and LaTeX
 - Switched seamlessly between three specific kinds of writing
   - Long form prose (i.e. novels)
   - Research and note-taking
   - Screenwriting

This is a tall order for any word processor. 

It is why conventional word processing software such as MS Word fails, at least for me. Granted I wrote my first novel on MS Word, I found that it was neither extensible enough to scale with my needs, nor was it nimble and fast. 

An ideal writing tool for me should adapt to my needs at a moment's notice:

- Focus on the novel? Sure, here's a beautiful LaTeX template for me to work on my novel.
- Write a screenplay? Why not?
- Build an inter-connected network of notes like Obsidian or Notion? Done. 

Here are two demos I presented at the [NeoVimConf](https://neovimconf.live/) where I presented two early versions of OVIWrite.

- [Writing, Editing and World-Building at the Speed of Thought](https://www.youtube.com/watch?app=desktop&v=2ORWaIqyj7k) (ver 0.1)
- [Vimkipedia: Or How I Built my Second Brain Using Vim](https://www.youtube.com/watch?v=q80hXvorl0o) (version 0.2)

Essentially, these two talks served as early demos of OVIWrite, versions 0.1 and 0.2. I used a combination of Vim and NeoVim during these talks. This was primarily because I couldn't get the vimwiki plugin to work with NeoVim, a problem that I have since solved. 

The config is now entirely built with Lua, following the modular structure of LazyVim.

I consider this version 0.4 (Dec 11th 2023)

## IWE

The solution to my problem with my writing tools was simple: I needed an Integrated Writing Environment, a toolkit that was nimble and fast, yet extensible to meet all my *text* needs. I spent time writing on diverse IDEs;
in fact, my inspirations for OVIWrite were [VSCode](https://code.visualstudio.com/), [PyCharm](https://www.jetbrains.com/pycharm-edu/) and indeed the many Vim/NeoVim inspired *distros* like [NVChad](https://nvchad.com/), [LunarVim](https://www.lunarvim.org/), and [Doom Emacs](https://github.com/doomemacs/doomemacs). 


## FEATURES

I use this setup for the following use-cases:

- LaTex documents for my novels
- Fountain files for writing scripts and screenplays
- Markdown and Org Mode files for writing essays
- Vim-wiki for my personal Zettlekasten 
- A choice of dark and light colour schemes. 

OVIWrite allows users to write in Markdown, LaTeX, Fountain (For Screenwriting) while, at the same time, having allowing the user to build a Personal Knowledge Base system (such as a Zettlekasten). See screenshots below. 

This setup is built to be as frictionless as possible for a reasonably experienced Vim/NeoVim user to install and get to writing.
OVIWrite has been tested on Linux, MacOS and Android (through Termux available on the F-Droid store [not Google Play Store]) environments.

Windows users: I would love feedback on your experiences as well as contributions.

The documentation here, much like the source code, is a fork of Lazy Vim. Thanks to the good folk there who have done an incredible job making this NeoVim distribution frictionless for us non-tech folk. 

## ⚡️ REQUIREMENTS

- Neovim >= **0.8.0** and its associated dependencies (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional but highly recommended)_**
- LaTeX compiler

## SCREENSHOTS

The screenshots below show a variety of color schemes at play: Nightfox, DawnFox and NordFox. Also included in the config: Gruvbox and flavours of Catppuccin. 

### Long-form Writing

- Longform Writing; LaTeX

![Loading Screen](assets/LaTeX.png)

![Loading Screen](assets/Essay.png)



- Longform Writing; Markdown

- Longform Writing; Org-Mode

### Screenwriting 

- Screenwriting in Fountain format

### Note-taking and Research

- Zettlekasten 

![Loading Screen](assets/Zettle.png)

### ROADMAP

	    - [ ] Public demo on YouTube
	    - [ ] Testing out on non Unix systems i.e. Windows
	    - [ ] Documentation
		    - [ ] Website on GitHub maybe?
			    - [ ] Blog: The case for writing in plain text
	    - [ ] Installation streamlining



## CAN I CONTRIBUTE?

Please, and thank you. 

Contributions are encouraged. Feel free to make a pull request with modifications. If you want to contribute at a deeper level - maybe even forking NeoVim for writing outright - do reach out to me. I will be happy to collaborate and learn from the community. 

## Authors

- [@MiragianCycle](https://www.github.com/MiragianCycle), Theena Kumaragurunathan
- [@mhegreberg](https://github.com/mhegreberg), Mark Hegreberg


## ACKNOWLEDGEMENTS 

None of this would be possible without the contributions of the entire Vim and NeoVim eco-systems. Please contribute in anyway, financial or otherwise, to these incredible projects and the tireless people who maintain them. 


## License

[GNU GPLv3](https://choosealicense.com/licenses/gpl-3.0/)



