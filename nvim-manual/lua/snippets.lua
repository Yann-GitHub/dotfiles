local ls = require("luasnip")

ls.add_snippets("lua", {
  ls.snippet("fn", {
    ls.text_node("function "),
    ls.insert_node(1, "nom"),
    ls.text_node("()"),
    ls.text_node({ "", "end" }),
  }),
})
