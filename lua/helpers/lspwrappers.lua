local supported_ft = {
    cpp = {
        func_definition_node = 'function_definition',
        get_name_func_node = function(parent)
            return parent:field('declarator')[1]:field('declarator')[1]
        end
    },
    python = {
        func_definition_node = 'function_definition',
        get_name_func_node = function(parent)
            return parent:field('name')[1]
        end
    },
}

local function get_parent_node(parent_node_type)
    local parent = vim.treesitter.get_node()
    while parent and parent:type() ~= parent_node_type do
        parent = parent:parent()
    end
    return parent
end

local function supported(ft)
    local lang = supported_ft[ft]
    if lang == nil then
        vim.notify('Not implemented for ft: ' .. ft)
        return false
    end
    return true
end

return {
    func_name_under_cursor = function()
        if not supported(vim.bo.filetype) then
            return ''
        end
        local ft = supported_ft[vim.bo.filetype]
        local parent = get_parent_node(ft.func_definition_node)
        local bufnr = vim.api.nvim_get_current_buf()
        if parent then
            local node = ft.get_name_func_node(parent)
            return vim.treesitter.get_node_text(node, bufnr)
        else
            return ''
        end
    end,
    func_under_cursor = function()
        if not supported(vim.bo.filetype) then
            return ''
        end
        local ft = supported_ft[vim.bo.filetype]
        local parent = get_parent_node(ft.func_definition_node)
        local bufnr = vim.api.nvim_get_current_buf()
        if parent then
            return vim.treesitter.get_node_text(parent, bufnr)
        else
            return ''
        end
    end,
}
