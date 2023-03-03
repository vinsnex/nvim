require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "build/*", "tags" }
    },
    pickers = {
        find_files = {
            theme = "ivy",
        },
        git_files = {
            theme = "ivy",
        },
        grep_string = {
            theme = "ivy",
        },
        live_grep = {
            theme = "ivy",
        }
    },
}
