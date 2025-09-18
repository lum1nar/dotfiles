require("lum1na")

local orig_notify = vim.notify

vim.notify = function(msg, level, opts)
  -- 過濾掉特定訊息
  if type(msg) == "string" and msg:match("require%(.'lspconfig'%)") then
    return
  end
  -- 否則用原本的 notify
  orig_notify(msg, level, opts)
end

