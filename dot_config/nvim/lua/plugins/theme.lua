local themes = {
  code_dark = function(use)
    use {
      'tomasiser/vim-code-dark',
      config = function()
        local cmd = vim.cmd
        cmd 'colorscheme codedark'
        cmd 'hi Normal ctermbg=NONE'
        cmd 'hi NonText ctermbg=NONE'
        cmd 'hi EndOfBuffer ctermbg=NONE'
        cmd 'hi LineNr ctermbg=NONE'
        cmd 'hi CursorLineNr ctermbg=NONE'
        cmd 'hi SignColumn ctermbg=NONE'
        cmd 'hi Folded ctermbg=NONE'
        cmd 'hi VertSplit ctermbg=NONE'
        vim.o.t_Co = 256
        if not require 'utils'.is_256_colors() then
          vim.o.t_Co = 8
          vim.o.t_ut = nil
          cmd 'hi Visual cterm=reverse'
          cmd 'hi HighlightedyankRegion cterm=reverse'
          cmd 'hi Search cterm=reverse'
        end
      end,
    }
  end,

  kanagawa = function(use)
    use {
      'rebelot/kanagawa.nvim',
      config = function()
        print('loaded')
        local cmd = vim.cmd
        require 'kanagawa'.setup {
          transparent = true,
        }
        cmd 'colorscheme kanagawa'
      end,
    }
  end,

  base16 = function(theme)
    return function(use)
      use {
        'RRethy/nvim-base16',
        config = string.format([[
          vim.cmd('colorscheme base16-%s')
        ]], theme),
      }
    end
  end,

  github = function(use)
    use {
      'projekt0n/github-nvim-theme',
      config = function()
        require('github-theme').setup {
          transparent = true,
        }
      end,
    }
  end,
}

return {
  -- init = themes.github
  init = themes.code_dark
  -- init = themes.kanagawa
  -- init = themes.base16 'tomorrow-night'
}
