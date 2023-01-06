local packer = require("packer")
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
