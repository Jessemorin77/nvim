local typing_test = {}

function typing_test.start_test()
  -- Test content
  local test_content = "The quick brown fox jumps over the lazy dog"
  local buffer = vim.api.nvim_create_buf(false, true)               -- create a new buffer
  vim.api.nvim_set_current_buf(buffer)                              -- set current buffer to the new buffer
  vim.api.nvim_buf_set_lines(buffer, 0, -1, false, { test_content }) -- set lines in the buffer

  -- Variables to track test state
  local start_time = vim.loop.now()
  local total_chars = test_content:len()
  local typed_chars = 0

  -- Set up autocommand to capture typing
  vim.api.nvim_create_autocmd("TextChangedI", {
    buffer = buffer,
    callback = function()
      -- Check typed content against test_content
      local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)
      local typed_content = table.concat(lines, "\n")
      typed_chars = math.min(total_chars, typed_content:len()) -- Update typed characters, preventing overflow

      -- Calculate accuracy
      local correct_chars = 0
      for i = 1, typed_chars do
        if typed_content:sub(i, i) == test_content:sub(i, i) then
          correct_chars = correct_chars + 1
        end
      end
      local accuracy = (correct_chars / total_chars) * 100

      -- Calculate typing speed (words per minute)
      local elapsed_minutes = (vim.loop.now() - start_time) / 60000
      local wpm = (typed_chars / 5) / elapsed_minutes

      -- Update status line with typing stats
      vim.api.nvim_set_option_value(
        "statusline",
        string.format("Accuracy: %.2f%% WPM: %.2f", accuracy, wpm),
        { scope = "local" }
      )
    end,
  })

  -- Instructions for the user
  print("Typing test started! Type the text as accurately and quickly as you can.")
end

-- Register the command with Neovim
vim.api.nvim_create_user_command("TypingTest", typing_test.start_test, { desc = "Start a typing test" })


