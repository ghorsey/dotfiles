local M = {
  init_options = { hostInfo = 'neovim' },
  cmd = { 'wc-language-server', '--stdio' },
  filetypes = {
    'html',
    'javascriptreact',
    'typescriptreact',
    'astro',
    'svelte',
    'vue',
    'markdown',
    'mdx',
    'javascript',
    'typescript',
    'css',
    'scss',
    'less',
  },
  root_markers = {
    'wc.config.js',
    'wc.config.ts',
    'wc.config.mjs',
    'wc.config.cjs',
    'custom-elements.json',
    'package.json',
    '.git',
  },
}

return M
