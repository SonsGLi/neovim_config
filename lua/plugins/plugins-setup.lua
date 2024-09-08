--自动安装
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end
  
  local packer_bootstrap = ensure_packer()
  
--自动更新和安装:PackerSync
  vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
  ]])


--插件：  
  return require('packer').startup(function(use)
    
    use 'wbthomason/packer.nvim'
    
    use {                                             --状态栏
       'nvim-lualine/lualine.nvim',
       requires = { 'kyazdani42/nvim-web-devicons',opt = true}
    }     
    
    use {
        'nvim-tree/nvim-tree.lua',                    --文件树
         requires = {
             'nvim-tree/nvim-web-devicons',           --文件树图标
         }
    }

    use("christoomey/vim-tmux-navigator")         --ctrl+hjkl定位窗口
   
    use {'nvim-treesitter/nvim-treesitter',}      --高亮

    use "p00f/nvim-ts-rainbow"                    -- 配合treesitter，不同括号颜色区分

                                          --mason，统一管理LSP
    use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
     } 

                                          --补全 
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"
    use "hrsh7th/cmp-path" -- 文件路径

    use {
       'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件检索
       requires = { {'nvim-lua/plenary.nvim'} }
     }




    if packer_bootstrap then
      require('packer').sync()
    end
  end)
