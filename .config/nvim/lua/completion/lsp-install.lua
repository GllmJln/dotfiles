
-- Configure lua language server for neovim development
 local lua_settings = {
   Lua = {
     runtime = {
       -- LuaJIT in the case of Neovim
       version = "LuaJIT",
       path = vim.split(package.path, ";"),
     },
     diagnostics = {
       -- Get the language server to recognize the `vim` global
       globals = { "vim" , "use"},
     },
     workspace = {
       -- Make the server aware of Neovim runtime files
       library = {
         [vim.fn.expand("$VIMRUNTIME/lua")] = true,
         [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
       },
     },
   },
 }


-- local tex_settings = {
--     cmd = { "texlab" },
--     filetypes = { 'tex', 'bib' },
--     root_dir = ".",
--     settings = {
--       texlab = {
--         auxDirectory = ".",
--         bibtexFormatter = "texlab",
--         build = {
--           args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
--           executable = "latexmk",
--           forwardSearchAfter = false,
--           onSave = true
--         },
--         chktex = {
--           onEdit = true,
--           onOpenAndSave = true
--         },
--         diagnosticsDelay = 300,
--         formatterLineLength = 80,
--         forwardSearch = {
--           executable = "zathura",
--           args = { "--synctex-forward", "%l:1:%f", "%p" }
--         },
--         latexFormatter = "latexindent",
--         latexindent = {
--           modifyLineBreaks = false
--         }
--       }
--     }




-- }

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    -- on_attach = on_attach,
  }
end

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    local config = make_config()
    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
    end
    if server == "texlab" then
      config.settings = tex_settings
    end
    require'lspconfig'[server].setup(config)
  end
end



setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- Lsp files
-- require'lspinstall'.install_server("latex")
-- require'lspinstall'.install_server("lua")
-- require'lspconfig'.pyright.setup{}

