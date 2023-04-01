vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('RemoveTrailingSpace', { clear = true }),
    pattern = '*',
    command = '%s/\\s\\+$//e',
})

vim.api.nvim_create_autocmd('VimEnter', {
    group = vim.api.nvim_create_augroup('BrowseFile', { clear = true }),
    callback = function(data)
        if not data.file == "" and vim.bo[data.buf].buftype == "" then
            return
        end

        if vim.fn.isdirectory(data.file) ~= 0 then
            vim.api.nvim_set_current_dir(data.file)
        else
            return
        end

        vim.cmd('Telescope file_browser')
    end
})
