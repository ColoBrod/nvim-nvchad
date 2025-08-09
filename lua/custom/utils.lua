local M = {}

M.toggle_word_wrap = function()
  print("Toggle Word Wrap");
  vim.wo.wrap = not vim.wo.wrap
end

M.toggle_relative_number = function()
	vim.wo.relativenumber = not vim.wo.relativenumber
end

M.move_line_up = function()
  -- Old implementation
  -- vim.cmd("move -2")
end

M.move_line_down = function()
  -- Old implementation
  -- vim.cmd("move +1")
end

M.resize_view_increase = function()
  vim.cmd("resize +5");
end

M.resize_view_decrease = function()
  vim.cmd("resize -5");
end

M.vresize_view_increase = function()
  vim.cmd("vertical resize +5")
end

M.vresize_view_decrease = function()
  vim.cmd("vertical resize -5")
end

M.buffer_close = function()
  require("nvchad.tabufline").close_buffer()
end

M.diagnostic_text_toggle = function()
  local config = vim.diagnostic.config
	local vt = config().virtual_text
  config({ virtual_text = not vt })
end

M.telescope_resume = function()
  -- Configuration
  -- :h telescope.defaults.cache_picker
  local telescope = require('telescope.builtin');
  telescope.resume();
end

M.telescope_lsp_references = function()
  -- Configuration
  -- :h telescope.defaults.cache_picker
  -- local telescope = require('telescope.builtin');
  -- telescope.resume();
  vim.cmd([[Telescope lsp_references]])
end

M.telescope_args = function()
 require('telescope').extensions.live_grep_args.live_grep_args()
end

M.feedkeys = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

M.quickfix_next = function()
  vim.cmd([[cnext]])
  print("quickfix_next")
end

M.quickfix_prev = function()
  vim.cmd([[cprev]])
  print("quickfix_prev")
end

M.quickfix_open = function()
  vim.cmd([[copen]])
  print("quickfix_open")
end

M.quickfix_close = function()
  vim.cmd([[cclose]])
  print("quickfix_close")
end
-- M.px_to_rem = function()
--   -- Get the current visual selection
--   local start_pos = vim.fn.getpos("'<") -- start of selection
--   local end_pos = vim.fn.getpos("'>") -- end of selection
--   local start_line = start_pos[2]
--   local start_col = start_pos[3]
--   local end_line = end_pos[2]
--   local end_col = end_pos[3]
--
--   print('Pixels to rems impossible')
--   -- Get the selected lines
--   local lines = vim.fn.getline(start_line, end_line)
--
--   -- Process each line within the selection
--   for i, line in ipairs(lines) do
--     local s_col = (i == 1) and start_col or 1
--     local e_col = (i == #lines) and end_col or #line
--
--     -- Extract the text between start and end column
--     local text_to_convert = line:sub(s_col, e_col)
--
--     -- Replace px with rem
--     local updated_text = text_to_convert:gsub("(%d+)(px)", function(px_value)
--       local rem_value = tonumber(px_value) / 16
--       return string.format("%.2frem", rem_value)
--     end)
--
--     -- Replace the line with updated text
--     lines[i] = line:sub(1, s_col - 1) .. updated_text .. line:sub(e_col + 1)
--   end
--
--   -- Set the modified lines back into the buffer
--   vim.fn.setline(start_line, lines)
-- end

-- M.px_to_rem = function()
--   local wordUnderCursor = vim.fn.expand("<cword>")
--   local currentLine = vim.fn.getline(".")
--   print(currentLine)
-- end


return M
