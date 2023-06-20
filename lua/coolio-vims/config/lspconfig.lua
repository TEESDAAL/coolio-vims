local coq = require("coq")
local lspconfig = require("lspconfig")

local servers = {
	"rust_analyzer",
	"pyright",
	"jdtls",
	"clangd",
	"bashls",
	"tsserver",
	"sqlls",
	"cssls",
	"lua_ls",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup(coq.lsp_ensure_capabilities())
end
