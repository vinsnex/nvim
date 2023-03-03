local nvim_lsp = require('lspconfig')
local nlspsettings = require('nlspsettings')

local opts = {
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        require("keybindings").mapLSP(buf_set_keymap)

        require('nlspsettings').update_settings(client.name)
    end,
    -- on_init = function(client)
    --     client.config.settings.systemverilog = {
    --         includeIndexing     = { "**/*.{v,vh,sv,svh}", "*.{v,vh,sv,svh}" },
    --         excludeIndexing     = { "build/**" },
    --         defines             = {},
    --         --launchConfiguration = "verilator -sv -Wall --lint-only",
    --         launchConfiguration = "iverilog -t null",
    --         formatCommand       = "verible-verilog-format \
    --                                     --indentation_spaces 4 \
    --                                     --column_limit 200 \
    --                                     --line_break_penalty=800 \
    --                                     --assignment_statement_alignment=preserve \
    --                                     --case_items_alignment=preserve \
    --                                     --class_member_variable_alignment=preserve \
    --                                     --compact_indexing_and_selections=false \
    --                                     --distribution_items_alignment=preserve \
    --                                     --enum_assignment_statement_alignment=preserve \
    --                                     --expand_coverpoints=false \
    --                                     --formal_parameters_alignment=preserve \
    --                                     --formal_parameters_indentation=wrap \
    --                                     --module_net_variable_alignment=preserve \
    --                                     --named_parameter_alignment=preserve \
    --                                     --named_parameter_indentation=wrap \
    --                                     --named_port_alignment=preserve \
    --                                     --named_port_indentation=wrap \
    --                                     --port_declarations_alignment=preserve \
    --                                     --port_declarations_indentation=wrap \
    --                                     --port_declarations_right_align_packed_dimensions=false \
    --                                     --port_declarations_right_align_unpacked_dimensions=false \
    --                                     --struct_union_members_alignment=preserve \
    --                                     --try_wrap_long_lines=false \
    --                                     --show_equally_optimal_wrappings=false \
    --                                ",
    --         linter              = "icarus"
    --     }
    --
    --     client.notify("workspace/didChangeConfiguration")
    --     return true
    -- end
}


return {
    on_setup = function(server)
        server.setup(opts)
        nlspsettings.setup {}
    end,
}
