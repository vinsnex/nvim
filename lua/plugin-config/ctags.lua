vim.api.nvim_command('autocmd BufWritePost,FileReadPost *.v,*.sv call system("ctags --exclude=build* --exclude=.* --exclude=tsmc* --languages=Verilog,SystemVerilog -R &")')
