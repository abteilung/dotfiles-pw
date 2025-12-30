local commit_prompt = [[
Write a concise commit message for these changes using gitmoji format:

<emoji> <short description>

Use these gitmoji based on the change type:
🎨 Improve structure / format of the code
⚡️ Improve performance
🔥 Remove code or files
🐛 Fix a bug
🚑️ Critical hotfix
✨ Introduce new features
📝 Add or update documentation
🚀 Deploy stuff
💄 Add or update the UI and style files
🎉 Begin a project
✅ Add, update, or pass tests
🔒️ Fix security or privacy issues
🚨 Fix compiler / linter warnings
🚧 Work in progress
💚 Fix CI Build
⬇️ Downgrade dependencies
⬆️ Upgrade dependencies
👷 Add or update CI build system
♻️ Refactor code
➕ Add a dependency
➖ Remove a dependency
🔧 Add or update configuration files
🌐 Internationalization and localization
✏️ Fix typos
💩 Write bad code that needs to be improved
⏪️ Revert changes
🔀 Merge branches
📦️ Add or update compiled files or packages
👽️ Update code due to external API changes
🚚 Move or rename resources (files, paths, routes)
💥 Introduce breaking changes
🍱 Add or update assets
♿️ Improve accessibility
💡 Add or update comments in source code
🗃️ Perform database related changes
🔊 Add or update logs
🔇 Remove logs
🚸 Improve user experience / usability
🏗️ Make architectural changes
📱 Work on responsive design
🙈 Add or update a .gitignore file
🔍️ Improve SEO
🏷️ Add or update types
🥅 Catch errors
🗑️ Deprecate code that needs to be cleaned up
🛂 Work on authorization, roles and permissions
🩹 Simple fix for a non-critical issue
⚰️ Remove dead code
🧪 Add a failing test
👔 Add or update business logic
🧱 Infrastructure related changes
🧑‍💻 Improve developer experience
🦺 Add or update code related to validation

Rules:
- Keep the description under 50 characters
- Use imperative mood ("add" not "added")
- Lowercase after emoji
- No period at the end
- Return ONLY the commit message, no explanation

Example: ✨ add user authentication flow
Example: 🐛 fix null pointer in user service
Example: ⚡️ optimize database queries
]]

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    keys = {
      { "<leader>gc", "<cmd>CopilotChatToggle<cr>", desc = "Copilot Chat" },
      { "<leader>ge", "<cmd>CopilotChatExplain<cr>", desc = "Explain Code", mode = { "n", "v" } },
      { "<leader>gr", "<cmd>CopilotChatReview<cr>", desc = "Review Code", mode = { "n", "v" } },
      { "<leader>gx", "<cmd>CopilotChatFix<cr>", desc = "Fix Code", mode = { "n", "v" } },
      {
        "<leader>gm",
        function()
          local diff = vim.fn.system("git diff --staged")
          if diff == "" then
            vim.notify("No staged changes", vim.log.levels.WARN)
            return
          end
          require("CopilotChat").ask(commit_prompt, {
            selection = function() return diff end,
          })
        end,
        desc = "AI Commit Message",
      },
    },
    config = function()
      require("CopilotChat").setup({
        window = {
          width = 0.4,
        },
      })
    end,
  },
}
