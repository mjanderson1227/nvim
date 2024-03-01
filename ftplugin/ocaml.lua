local filepath = vim.fn.system({ "opam", "var", "share" })
table.insert(vim.opt.rtp, filepath .. "/merlin/vim")
