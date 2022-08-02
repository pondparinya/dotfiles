local M = {}

 function M.setup()
   local status_ok, theme = pcall(require, "onedark")
  if not status_ok then
    return
  end
   theme.setup {
     style = 'dark'
   }
   theme.load()
 end

 return M

