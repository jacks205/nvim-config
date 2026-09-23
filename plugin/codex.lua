if vim.g.vscode then
  return
end

local function project_root()
  local file = vim.api.nvim_buf_get_name(0)
  local start = vim.uv.cwd()

  if vim.bo.buftype == "" and file ~= "" then
    start = vim.fs.dirname(file)
  end

  return vim.fs.root(start, ".git") or vim.uv.cwd()
end

local function open_codex()
  local root = project_root()

  if vim.env.TMUX and vim.env.TMUX ~= "" then
    local result = vim.system({
      "tmux",
      "split-window",
      "-h",
      "-c",
      root,
      "codex",
    }, { text = true }):wait()

    if result.code ~= 0 then
      vim.notify(result.stderr or "Could not start Codex", vim.log.levels.ERROR)
    end

    return
  end

  vim.cmd("botright 18new")

  local job = vim.fn.jobstart({
    "codex",
    "--no-alt-screen",
    "-C",
    root,
  }, {
    term = true,
    cwd = root,
  })

  if job <= 0 then
    vim.notify("Could not start Codex", vim.log.levels.ERROR)
    return
  end

  vim.cmd.startinsert()
end

vim.api.nvim_create_user_command("Codex", open_codex, {
  desc = "Open Codex at the current project root",
})
vim.keymap.set("n", "<leader>cc", open_codex, {
  desc = "[C]odex [C]LI",
})
