return {
	"nyoom-engineering/oxocarbon.nvim",
	config = function()
		vim.cmd.colorscheme("oxocarbon")
    --sets to transparent
--		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
	-- Add in any other configuration;
	--   event = foo,
	--   config = bar
	--   end,
}
