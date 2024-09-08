--基础配置
require("core.options")
require("core.keymaps")

--插件配置
require("plugins.plugins-setup")

--插件：

require("plugins.lualine")     --状态栏
require("plugins/nvim-tree")   --文件树
require("plugins/treesitter")  --高亮
require("plugins/lsp")         --LSP
require("plugins/cmp")         --补全
require("plugins.telescope")   --搜索
