local line = vim.fn.line
local input = vim.api.nvim_input

local scroll = function()
    local c = vim.v.count1

    local dist = line('$') - line('.')
    if c > dist then
        if dist > 0 then
            input(dist .. '<Down>')
        end
        input((c - dist) .. '<C-e>')
    elseif dist > 0 then
        input(c .. '<Down>')
    else
        input(c .. '<C-e>')
    end
end

--vim.keymap.set('n', 'j', scroll, { noremap = true, silent = true })
