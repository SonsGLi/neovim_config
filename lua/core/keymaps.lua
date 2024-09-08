vim.g.mapleader = " "    --主键

local keymap = vim.keymap

--正常模式


--窗口
keymap.set("n","<leader>sv","<C-w>v") --水平新增
keymap.set("n","<leader>sh","<C-w>s")  --垂直新增

--插件
--nvim-tree
keymap.set("n","<leader>e",":NvimTreeToggle<CR>")








