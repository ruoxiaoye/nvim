-- 管理自身部分
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git','clone','--depth','1','https://github.com/wbthomason/packer.nvim',install_path})
    vim.cmd[[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()
-- 插件自动安装部分
local packer = require("packer")
local mirror = "https://ghproxy.com/https://github.com"
packer.startup({
  function(use)
    -- packer 可以管理自己本身
    use ("wbthomason/packer.nvim")
    ------------------- colorschemes ---------------------
    -- tokyonight
    use ("folke/tokyonight.nvim")
    -- OceanicNext
    --use("mhartington/oceanic-next")
    -- gruvbox
    --use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
    -- zephyr 暂时不推荐，详见上边解释
    -- use("glepnir/zephyr-nvim")
    -- nord
    --use("shaunsingh/nord.nvim")
    -- onedark
    --use("ful1e5/onedark.nvim")
    -- nightfox
    --use("EdenEast/nightfox.nvim")
    ------------------------------------------------------
    -- 侧边栏文件浏览器
    use({"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"})
    -- bufferline 顶部文件标签页
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine 底部状态栏
    use({"nvim-lualine/lualine.nvim", requires = {"Kyazdani42/nvim-web-devicons"} })
    use("arkav/lualine-lsp-progress")
    -- telescope 文件模糊搜索
    use{"nvim-telescope/telescope.nvim",requires = {"nvim-lua/plenary.nvim"} }
    -- telescope extensions 
    use("LinArcX/telescope-env.nvim")
    -- dashboard-nvim 启动页面插件
    -- use({
    --   "glepnir/dashboard-nvim", 
    --   event = 'VimEnter',
    --   config = function()
    --     require('dashboard').setup {
    --       -- config
    --     }
    --   end,
    --   requires = {'nvim-tree/nvim-web-devicons'}
    -- })
    -- 代码高亮，nvim-treesitter
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate",})
    use("p00f/nvim-ts-rainbow")
    ------------------------------LSP--------------------------------------------
    use({"williamboman/mason.nvim"})
    use({"williamboman/mason-lspconfig.nvim"})
    -- lsp config 配置lsp工具
    use({"neovim/nvim-lspconfig"})
    ------------------------------LSP--------------------------------------------

    if packer_bootstrap then
      packer.sync()
    end
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
      default_url_format = 'git@github.com:%s'
    },
    -- 以浮动窗口打开安装列表
    display = {
      open_fn = function()
        return require("packer.util").float({border = "single"})
      end,
    },
  },
})

-- 每次保存plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    autroup end
  ]]
)

