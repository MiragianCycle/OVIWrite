[![asciicast](https://asciinema.org/a/QJpgvqzIG3ltZI2posl0z36ek.svg)](https://asciinema.org/a/QJpgvqzIG3ltZI2posl0z36ek)                                           

**A Vim/NeoVim Configuration for Writing and Writers**

## FAQ

#### WHAT THE HECK IS 'OVIWrite'?

OVIWrite (as in *Oh-Vi-Write*) is an attempt to make (Neo)Vim writer friendly out of the box?


#### WHY?

I am a writer, not a tech person. 

Coming across Vim for the first time last year was revelatory, but I'd be lying if I said the adoption process was easy. Indeed, it took me over two months to get Vim ready for my writing workflow. The result is that most writers would abandon Vim as too complex a beast. This repo is an attempt to address that potential loss of a user-group who stand to gain much from Vim.


#### APPROACH

The assumption here is that you, a writer, have already downloaded and installed Vim/GVim/NeoVim on your system. I have also assumed that you are on the verge of configuring your .vimrc file to be writer friendly. 

If both of the above cases are true, then all you need to do is to download the vimrc in this repo and paste it into the appropriate file in the appropriate location based on your system. Default destinations for .vimrcs:

**MacOS and Unix**:        $HOME/.vimrc or $HOME/.vim/vimrc
**MS-Windows**  $HOME/_vimrc, $HOME/vimfiles/vimrc or $VIM/_vimrc


#### A NOTE ON PACKAGE MANAGERS

I primarily use Vim-Plug to manage Plugins within Vim. Mostly because I've found it to be the easiest. The conventions used here will be for Vim-Plug but they can be adapted for your package manager of choice. 

I will probably adapt this to Packer at some point in the future as I move to NeoVim, and a Lua-based config file, instead of the standard .vimrc. 


#### PLUGINS FOR WRITING AND WRITERS 

As this .vimrc aims to be plug and play for writers interested in using Vim for their writing, I have chosen a fairly opinionated approach to what plugins (see section on Plugins for more details), what defaults (line-wrapping, relative numbers, etc.,), are necessary to begin writing on Vim immediately. This doesn't mean that this .vimrc can't be changed based on user preference; indeed Vim truly shines when you take the time to mould it for your **exact** specifications.  The .vimrc has extensive comments to enable the final user to add, remove, and modify to their heart's content. 

Most of these plugins are written in VimL, as opposed to NeoVim plugins written in Lua. The general rule of thumb that I follow is: **Most plugins written for Vim work on NeoVim, but plugins written in Lua for NeoVim **will not work** on Vim.

All plugins curated in this vimrc will be Vim-first i.e they should run perfectly fine on any any Vim install on any system as long as Vim 8.0 or greater is installed. 


#### TESTING 

This .vimrc has served me well on Linux, MacOS and Android (via Termux). I've tested it on the following systems:

**Linux**
1. Ubuntu 20.04
2. Debian 11
3. Arch

**MacOS High Sierra** (I have a 10 year old Mac so this is the best I can do for the time being)

#### KEY-BINDINGS

The key-bindings I've used here are built around my (admittedly) wonky typing and keyboard recall. The SPACEBAR is the Leaderkey because it is the most ergonomically sound for me. If you feel otherwise, you are free to change. 

## Demo

Insert gif or link to demo


## Authors

- [@MiragianCycle](https://www.github.com/MiragianCycle), Theena Kumaragurunathan


## License

[MIT](https://choosealicense.com/licenses/mit/)


