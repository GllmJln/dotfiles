vim.cmd([[
    augroup PACKER_COMPILE_ONCHANGE
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup END
]])


local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end
return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- LSP and COMPLETION
    use "neovim/nvim-lspconfig"
    -- Autocompletion
        use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer",
            {'quangnguyen30192/cmp-nvim-ultisnips', after = "nvim-cmp"}, 'hrsh7th/cmp-nvim-lua',
            'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
            'f3fora/cmp-spell', 'hrsh7th/cmp-emoji','kdheepak/cmp-latex-symbols'
        }
    }

  -- use 'kabouzeid/nvim-lspinstall'
  use {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init()
    end,
  }

-- LANGUAGES

--LaTeX
	use 'lervag/vimtex'

-- Markdown
	use 'plasticboy/vim-markdown'
  use {
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn['mkdp#util#install']() end,
      ft = {'markdown'}
  }
-- Start Screen
	use 'mhinz/vim-startify'
-- Snippets
	use 'SirVer/ultisnips'

-- Nicer experience
	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'
	use 'tpope/vim-commentary'
  use 'jiangmiao/auto-pairs'
  use 'norcalli/nvim-colorizer.lua'

-- Navigation
	use 'unblevable/quick-scope'
	use 'easymotion/vim-easymotion'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end
  }
-- Themes
	use 'morhetz/gruvbox'
  use 'joshdick/onedark.vim'

-- Bar and esthetics
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
  use 'ryanoasis/vim-devicons'


-- binding helper
  use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- config
    }
  end
}
	if fn.len(fn.globpath(PACKER_PATH, "*", 0, 1)) == 1 then
		vim.cmd([[PackerSync]])
	end
end)
