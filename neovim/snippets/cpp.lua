local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

return {

  -- main template
  s("main", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "int main() {",
      "    ios::sync_with_stdio(false);",
      "    cin.tie(nullptr);",
      "",
      "    ",
    }),
    i(1),
    t({
      "",
      "",
      "    return 0;",
      "}",
    }),
  }),

  -- competitive template
  s("cp", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "#define ll long long",
      "#define all(x) (x).begin(), (x).end()",
      "",
      "int main() {",
      "    ios::sync_with_stdio(false);",
      "    cin.tie(nullptr);",
      "",
      "    int t;",
      "    cin >> t;",
      "    while (t--) {",
      "        ",
    }),
    i(1),
    t({
      "",
      "    }",
      "}",
    }),
  }),

  -- for loop
  s("fori", {
    t("for (int "),
    i(1, "i"),
    t(" = 0; "),
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t(" < "),
    i(2, "n"),
    t("; "),
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t("++) {"),
    t({ "", "    " }),
    i(3),
    t({ "", "}" }),
  }),

  -- reverse for
  s("forr", {
    t("for (int "),
    i(1, "i"),
    t(" = "),
    i(2, "n-1"),
    t("; "),
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t(" >= 0; "),
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t("--) {"),
    t({ "", "    " }),
    i(3),
    t({ "", "}" }),
  }),

  -- vector
  s("vec", {
    t("vector<"),
    i(1, "int"),
    t("> "),
    i(2, "v"),
    t("("),
    i(3),
    t(");"),
  }),

  -- debug print
  s("dbg", {
    t('cerr << "'),
    i(1, "var"),
    t(': " << '),
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t(" << endl;"),
  }),

  -- fast input vector
  s("vin", {
    t("for (auto &x : "),
    i(1, "v"),
    t(") cin >> x;"),
  }),

  -- sort
  s("srt", {
    t("sort("),
    i(1, "v.begin()"),
    t(", "),
    i(2, "v.end()"),
    t(");"),
  }),

  -- lambda
  s("lam", {
    t("auto "),
    i(1, "fn"),
    t(" = [&]("),
    i(2),
    t(") {"),
    t({ "", "    " }),
    i(3),
    t({ "", "};" }),
  }),

  -- class skeleton
  s("class", {
    t("class "),
    i(1, "ClassName"),
    t({ " {", "public:", "    " }),
    i(2),
    t({ "", "};" }),
  }),

  -- struct skeleton
  s("struct", {
    t("struct "),
    i(1, "Node"),
    t({ " {", "    " }),
    i(2),
    t({ "", "};" }),
  }),
}

-- main   → full C++ program
-- cp     → competitive programming template
-- fori   → forward loop
-- forr   → reverse loop
-- vec    → vector declaration
-- vin    → vector input
-- srt    → sort
-- dbg    → debug print
-- lam    → lambda
-- class  → class template
-- struct → struct template
