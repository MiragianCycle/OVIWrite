return {
  "HakonHarnes/img-clip.nvim",
  cmd = "PasteImage",
  opts = {


  dir_path = "assets", -- directory path to save images to, can be relative (cwd or current file) or absolute
  file_name = "%Y-%m-%d-%H-%M-%S", -- file name format (see lua.org/pil/22.1.html)
  url_encode_path = false, -- encode spaces and special characters in file path
  use_absolute_path = false, -- expands dir_path to an absolute path
  prompt_for_file_name = true, -- ask user for file name before saving, leave empty to use default
  show_dir_path_in_prompt = false, -- show dir_path in prompt when prompting for file name
  use_cursor_in_template = true, -- jump to cursor position in template after pasting
  insert_mode_after_paste = true, -- enter insert mode after pasting the markup code
  relative_to_current_file = false, -- make dir_path relative to current file rather than the cwd

  template = "$FILE_PATH", -- default template

  -- file-type specific options
  -- any options that are passed here will override the global config
  -- for instance, setting use_absolute_path = true for markdown will
  -- only enable that for this particular file type
  -- the key (e.g. "markdown") is the filetype (output of "set filetype?")

  markdown = {
    url_encode_path = true,
    template = "![$CURSOR]($FILE_PATH)",
  },

  html = {
    template = '<img src="$FILE_PATH" alt="$CURSOR">',
  },

  tex = {
    template = [[
\begin{figure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{$FILE_PATH}
  \caption{$CURSOR}
  \label{fig:$LABEL}
\end{figure}
    ]],
  },

  typst = {
    template = [[
#figure(
  image("$FILE_PATH", width: 80%),
  caption: [$CURSOR],
) <fig-$LABEL>
    ]],
  },

  rst = {
    template = [[
.. image:: $FILE_PATH
   :alt: $CURSOR
   :width: 80%
    ]],
  },

  asciidoc = {
    template = 'image::$FILE_PATH[width=80%, alt="$CURSOR"]',
  },

  org = {
    template = [=[
#+BEGIN_FIGURE
[[file:$FILE_PATH]]
#+CAPTION: $CURSOR
#+NAME: fig:$LABEL
#+END_FIGURE
    ]=],
  },

wiki = {
template = '{{local="$FILE_PATH}"}',
},


















      },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
  },
}
