local M = {}

-- Template definitions
local templates = {
    latex = {
        name = "LaTeX Document",
        content = [[
\documentclass{article}
\begin{document}
\title{Your Title Here}
\author{Theena Kumaragurunathan}
\maketitle

\section{Introduction}
Your content here.

\end{document}
]]
    },
    markdown = {
        name = "Markdown Document",
        content = [[
# Title

## Introduction

Your content here.
]]
    },
    org = {
        name = "Org-mode Document",
        content = [[
#+TITLE: Your Title Here
#+AUTHOR: Theena Kumaragurunatha

* Introduction
Your content here.
]]
    }
}

-- Function to insert template content
--
--
-- Function to insert template content
local function insert_template(template)
    local lines = vim.split(template.content, "\n")
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.api.nvim_buf_is_valid(bufnr) then
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
    else
        print("Error: Invalid buffer")
    end
end





-- Function to display template selection menu

function M.select_template()
    local items = {}
    for _, template in pairs(templates) do
        table.insert(items, template.name)
    end

    vim.ui.select(items, {
        prompt = "Select a template:",
    }, function(choice)
        if choice then
            for key, template in pairs(templates) do
                if template.name == choice then
                    -- Create a new buffer
                    vim.cmd('enew')
                    insert_template(template)
                    vim.bo.filetype = key
                    break
                end
            end
        end
    end)
end




-- Create a command to invoke the template selection
vim.api.nvim_create_user_command("NewWriterFile", M.select_template, {})

return M
