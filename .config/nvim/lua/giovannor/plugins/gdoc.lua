return {
  "aadv1k/gdoc.vim",
  run = "./install.py",
  config = function()
    -- Uncomment and modify the lines below if you want to use custom paths
    -- vim.g.path_to_creds = vim.fn.expand('/some-path/some-credentials-file.json')
    -- vim.g.gdoc_file_path = vim.fn.expand('/some-directory')
    -- vim.g.token_directory = vim.fn.expand('/some-directory')
  end
}
