return {
  on_setup = function(server)
    server.setup({
      --capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocal.make_client_capabilities()),
      on_attach = function(client,bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
          -- @diagnostic disable-next-line: missing-parameter
          vim.api.nvim_buf_set_keymap(bufnr,...)
        end
        require("keybindings").mapLSP(buf_set_keymap)
      end,
    })
  end,
}
