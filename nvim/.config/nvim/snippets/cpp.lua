local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("cfmt", {
    t({"// clang-format off", ""}),
    i(1),  -- Insert node where the cursor will be placed
    t({"", "// clang-format on"}),
  })
}
