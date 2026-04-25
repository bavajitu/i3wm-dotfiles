local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {

  -- full latex document
  s("doc", {
    t({
      "\\documentclass{article}",
      "",
      "\\usepackage{amsmath}",
      "\\usepackage{amssymb}",
      "\\usepackage{graphicx}",
      "\\usepackage{hyperref}",
      "",
      "\\title{",
    }),
    i(1, "Title"),
    t({ "}", "\\author{" }),
    i(2, "Author"),
    t({ "}", "\\date{\\today}", "", "\\begin{document}", "", "\\maketitle", "" }),
    i(3),
    t({
      "",
      "",
      "\\end{document}",
    }),
  }),

  -- section
  s("sec", {
    t("\\section{"),
    i(1),
    t("}"),
  }),

  -- subsection
  s("ssec", {
    t("\\subsection{"),
    i(1),
    t("}"),
  }),

  -- environment
  s("env", {
    t("\\begin{"),
    i(1),
    t({ "}", "    " }),
    i(2),
    t({ "", "\\end{" }),
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t("}"),
  }),

  -- equation
  s("eq", {
    t({ "\\begin{equation}", "    " }),
    i(1),
    t({ "", "\\end{equation}" }),
  }),

  -- align
  s("ali", {
    t({ "\\begin{align}", "    " }),
    i(1),
    t({ "", "\\end{align}" }),
  }),

  -- inline math
  s("mm", {
    t("$"),
    i(1),
    t("$"),
  }),

  -- display math
  s("dm", {
    t({ "\\[", "    " }),
    i(1),
    t({ "", "\\]" }),
  }),

  -- fraction
  s("ff", {
    t("\\frac{"),
    i(1),
    t("}{"),
    i(2),
    t("}"),
  }),

  -- sqrt
  s("sq", {
    t("\\sqrt{"),
    i(1),
    t("}"),
  }),

  -- sum
  s("sum", {
    t("\\sum_{"),
    i(1, "i=1"),
    t("}^{"),
    i(2, "n"),
    t("}"),
  }),

  -- integral
  s("int", {
    t("\\int_{"),
    i(1, "a"),
    t("}^{"),
    i(2, "b"),
    t("} "),
    i(3),
    t("\\, d"),
    i(4, "x"),
  }),

  -- matrix
  s("mat", {
    t({ "\\begin{bmatrix}", "" }),
    i(1, "a & b \\\\ c & d"),
    t({ "", "\\end{bmatrix}" }),
  }),

  -- figure
  s("fig", {
    t({
      "\\begin{figure}[h]",
      "    \\centering",
      "    \\includegraphics[width=",
    }),
    i(1, "0.8"),
    t({ "\\textwidth]{" }),
    i(2, "image.png"),
    t({ "}", "    \\caption{" }),
    i(3),
    t({ "}", "    \\label{fig:" }),
    i(4),
    t({ "}", "\\end{figure}" }),
  }),

  -- table
  s("tab", {
    t({
      "\\begin{table}[h]",
      "\\centering",
      "\\begin{tabular}{",
    }),
    i(1, "c c c"),
    t({ "}" }),
    i(2, "a & b & c \\\\"),
    t({
      "",
      "\\end{tabular}",
      "\\caption{",
    }),
    i(3),
    t({ "}", "\\label{tab:" }),
    i(4),
    t({ "}", "\\end{table}" }),
  }),

  -- itemize
  s("item", {
    t({
      "\\begin{itemize}",
      "    \\item ",
    }),
    i(1),
    t({
      "",
      "\\end{itemize}",
    }),
  }),

  -- enumerate
  s("enum", {
    t({
      "\\begin{enumerate}",
      "    \\item ",
    }),
    i(1),
    t({
      "",
      "\\end{enumerate}",
    }),
  }),

  -- bold math
  s("bm", {
    t("\\mathbf{"),
    i(1),
    t("}"),
  }),

  -- textbf
  s("bf", {
    t("\\textbf{"),
    i(1),
    t("}"),
  }),

  -- label
  s("lab", {
    t("\\label{"),
    i(1),
    t("}"),
  }),

  -- reference
  s("ref", {
    t("\\ref{"),
    i(1),
    t("}"),
  }),

  -- cite
  s("cite", {
    t("\\cite{"),
    i(1),
    t("}"),
  }),
}

-- doc     full latex document
-- sec     section
-- ssec    subsection
-- env     generic environment
-- eq      equation
-- ali     align
-- mm      inline math
-- dm      display math
-- ff      fraction
-- sq      sqrt
-- sum     summation
-- int     integral
-- mat     matrix
-- fig     figure
-- tab     table
-- item    itemize
-- enum    enumerate
-- bf      bold text
-- bm      bold math
-- ref     reference
-- cite    citation
