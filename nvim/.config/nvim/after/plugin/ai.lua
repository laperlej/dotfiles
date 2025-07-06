vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

require('amazonq').setup({
  ssoStartUrl = "https://amzn.awsapps.com/start",
})

require("avante").setup({
  -- export BEDROCK_KEYS=aws_access_key_id,aws_secret_access_key,aws_region[,aws_session_token]
  provider = "bedrock",
  providers = {
    bedrock = {
      model = "us.anthropic.claude-3-7-sonnet-20250219-v1:0",
      aws_region = "us-west-2",
      aws_profile = "rabbit-dev",
    },
  }
})
