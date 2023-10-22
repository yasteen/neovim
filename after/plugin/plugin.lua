
-- Autoformat and re-analyse .c and .h files

--vim.api.nvim_create_autocmd({"BufWritePre"}, {
--    pattern = {"*.c", "*.h"},
--    callback = function()
--        vim.cmd("ClangFormat")
--        vim.cmd("YcmForceCompileAndDiagnostics")
--    end
--})
--
--vim.api.nvim_create_autocmd({"FileType"}, {
--    pattern = {"c", "h"},
--    callback = function()
--        vim.cmd("nnoremap <buffer> gd :YcmCompleter GoTo<CR>")
--    end
--})
