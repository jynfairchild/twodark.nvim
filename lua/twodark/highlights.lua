local c = require('twodark.colors')
local cfg = vim.g.twodark_config
local util = require("twodark.util")

local M = {}
local hl = {langs = {}, plugins = {}}

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s", group_name,
            group_settings.fg or "none",
            group_settings.bg or "none",
            group_settings.sp or "none",
            group_settings.fmt or "none"))
    end
end

local colors = {
    -- testing
    LOREM = {fg = c.lorem},
    IPSM = {fg = c.ipsm},
    TR = {fg = c.test_red},
    TO = {fg = c.test_orange},
    TY = {fg = c.test_yellow},
    TG = {fg = c.test_green},
    TT = {fg = c.test_teal},
    TB = {fg = c.test_blue},
    TP = {fg = c.test_purple},
    TW = {fg = c.test_white},
    -- old colors
    Fg = {fg = c.fg},
    LightGrey = {fg = c.light_grey},
    Grey = {fg = c.grey},
    Red = {fg = c.red},
    Cyan = {fg = c.cyan},
    Yellow = {fg = c.yellow},
    Orange = {fg = c.orange},
    Green = {fg = c.green},
    Blue = {fg = c.blue},
    Purple = {fg = c.purple}
}

hl.common = {
    Normal = {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
    Terminal = {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
    EndOfBuffer = {fg = cfg.ending_tildes and c.bg2 or c.bg0, bg = cfg.transparent and c.none or c.bg0},
    FoldColumn = {fg = c.fg, bg = cfg.transparent and c.none or c.bg1},
    Folded = {fg = c.fg, bg = cfg.transparent and c.none or c.bg1},
    SignColumn = {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
    ToolbarLine = {fg = c.fg, bg = cfg.transparent and c.none or c.b0},
    Cursor = {fmt = "reverse"},
    vCursor = {fmt = "reverse"},
    iCursor = {fmt = "reverse"},
    lCursor = {fmt = "reverse"},
    CursorIM = {fmt = "reverse"},
    CursorColumn = {bg = c.bg1},
    CursorLine = {bg = c.bg1},
    ColorColumn = {bg = c.bg1},
    CursorLineNr = {fg = c.fg},
    LineNr = {fg = c.grey},
    Conceal = {fg = c.grey, bg = c.bg1},
    DiffAdd = {fg = c.none, bg = c.diff_add},
    DiffChange = {fg = c.none, bg = c.diff_change},
    DiffDelete = {fg = c.none, bg = c.diff_delete},
    DiffText = {fg = c.none, bg= c.diff_text},
    DiffAdded = colors.Green,
    DiffRemoved = colors.Red,
    DiffFile = colors.Cyan,
    DiffIndexLine = colors.Grey,
    Directory = {fg = c.blue},
    ErrorMsg = {fg = c.red, fmt = "bold"},
    WarningMsg = {fg = c.yellow, fmt = "bold"},
    MoreMsg = {fg = c.blue, fmt = "bold"},
    CurSearch = {fg = c.bg0, bg = c.orange},
    IncSearch = {fg = c.bg0, bg = c.orange},
    Search = {fg = c.bg0, bg = c.bg_yellow},
    Substitute = {fg = c.bg0, bg = c.green},
    MatchParen = {fg = c.none, bg = c.grey},
    NonText = {fg = c.grey},
    Whitespace = {fg = c.grey},
    SpecialKey = {fg = c.grey},
    Pmenu = {fg = c.fg, bg = c.bg1},
    PmenuSbar = {fg = c.none, bg = c.bg1},
    PmenuSel = {fg = c.bg0, bg = c.bg_blue},
    WildMenu = {fg = c.bg0, bg = c.blue},
    PmenuThumb = {fg = c.none, bg = c.grey},
    Question = {fg = c.yellow},
    SpellBad = {fg = c.none, fmt = "undercurl", sp = c.red},
    SpellCap = {fg = c.none, fmt = "undercurl", sp = c.yellow},
    SpellLocal = {fg = c.none, fmt = "undercurl", sp = c.blue},
    SpellRare = {fg = c.none, fmt = "undercurl", sp = c.purple},
    StatusLine = {fg = c.fg, bg = c.bg2},
    StatusLineTerm = {fg = c.fg, bg = c.bg2},
    StatusLineNC = {fg = c.grey, bg = c.bg1},
    StatusLineTermNC = {fg = c.grey, bg = c.bg1},
    TabLine = {fg = c.fg, bg = c.bg1},
    TabLineFill = {fg = c.grey, bg = c.bg1},
    TabLineSel =  {fg = c.bg0, bg = c.fg},
    WinSeparator = {fg = c.bg3},
    Visual = {bg = c.bg3},
    VisualNOS = {fg = c.none, bg = c.bg2, fmt = "underline"},
    QuickFixLine = {fg = c.blue, fmt = "underline"},
    Debug = {fg = c.yellow},
    debugPC = {fg = c.bg0, bg = c.green},
    debugBreakpoint = {fg = c.bg0, bg = c.red},
    ToolbarButton = {fg = c.bg0, bg = c.bg_blue},
    FloatBorder = {fg = c.grey, bg = c.bg1},
    NormalFloat = {fg = c.fg, bg = c.bg1},
}

hl.syntax = {
    String = {fg = c.lua_string, fmt = cfg.code_style.strings},  -- "string"
    Character = {fg = c.lua_numbers},
    Number = {fg = c.lua_numbers},  -- "nums"
    Float = {fg = c.lua_numbers},
    Boolean = {fg = c.lua_boolean},
    Type = {fg = c.lua_boolean},
    Structure = {fg = c.lua_brackets},  -- lua "{ }, 300"
    StorageClass = {fg = c.lua_boolean},
    Identifier = {fg = c.lorem, fmt = cfg.code_style.variables},
    Constant = {fg = c.lua_boolean}, -- lua "true, false"
    PreProc = colors.LOREM,
    PreCondit = colors.LOREM,
    Include = colors.LOREM,
    Keyword = {fg = c.test_purple, fmt = cfg.code_style.keywords},
    Define = colors.LOREM,
    Typedef = colors.LOREM,
    Exception = colors.LOREM,
    Conditional = {fg = c.lua_boolean, fmt = cfg.code_style.keywords},
    Repeat = {fg = c.lua_boolean, fmt = cfg.code_style.keywords},
    Statement = {fg = c.lua_statement},  -- lua "return"
    Macro = {fg = c.grey},
    Error = {fg = c.grey},
    Label = {fg = c.grey},
    Special = {fg = c.grey},
    SpecialChar = {fg = c.grey},
    Function = {fg = c.blue, fmt = cfg.code_style.functions},
    Operator = {fg = c.lua_operators},
    Title = colors.TR,
    Tag = colors.TP,
    Delimiter = colors.TT,
    Comment = {fg = c.grey, fmt = cfg.code_style.comments},
    SpecialComment = {fg = c.grey, fmt = cfg.code_style.comments},
    Todo = {fg = c.grey, fmt = cfg.code_style.comments}
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
    hl.treesitter = {
        -- nvim-treesitter@0.9.2 and after
        ["@annotation"] = {fg = c.annotation},
        ["@attribute"] = {fg = c.attribute},  -- @staticmethod
        ["@attribute.typescript"] = {fg = c.attribute},

        -- True False Statements
        ["@boolean"] = {fg = c.boolean},  -- True False

        -- Base Text
        ["@character"] = {fg = c.character},
        ["@comment"] = {fg = c.comment, fmt = cfg.code_style.comments},  -- #comment
        ["@comment.todo"] = {fg = c.comment, fmt = cfg.code_style.comments},
        ["@comment.todo.unchecked"] = {fg = c.comment, fmt = cfg.code_style.comments},
        ["@comment.todo.checked"] = {fg = c.comment, fmt = cfg.code_style.comments},

        -- Constants
        ["@constant"] = {fg = c.constant, fmt = cfg.code_style.constants},  -- None
        ["@constant.builtin"] = {fg = c.constant, fmt = cfg.code_style.constants},
        ["@constant.macro"] = {fg = c.constant, fmt = cfg.code_style.constants},

        -- Constructor
        ["@constructor"] = {fg = c.constructor, fmt = "bold"},  -- __init__, class calls User()
        ["@diff.add"] = {fg = c.diff_add},
        ["@diff.delete"] = {fg = c.diff_delete},
        ["@error"] = {fg = c.error},

        -- Functions
        ["@function"] = {fg = c.func, fmt = cfg.code_style.functions},  -- Function():
        ["@function.builtin"] = {fg = c.func, fmt = cfg.code_style.functions},
        ["@function.macro"] = {fg = c.func, fmt = cfg.code_style.functions},
        ["@function.method"] = {fg = c.func, fmt = cfg.code_style.functions},

        -- Keywords
        ["@keyword"] = {fg = c.keyword, fmt = cfg.code_style.keywords},
        ["@keyword.conditional"] = {fg = c.keyword, fmt = cfg.code_style.keywords},
        ["@keyword.directive"] = colors.keyword,
        ["@keyword.exception"] = colors.keyword,
        ["@keyword.function"] = {fg = c.keyword, fmt = cfg.code_style.functions},
        ["@keyword.import"] = colors.keyword,
        ["@keyword.operator"] =  {fg = c.keyword, fmt = cfg.code_style.keywords},
        ["@keyword.repeat"] = {fg = c.keyword, fmt = cfg.code_style.keywords},

        -- Label
        ["@label"] = {fg = c.label},
        ["@markup.emphasis"] = {fg = c.markup, fmt = 'italic'},
        ["@markup.environment"] = {fg = c.markup},
        ["@markup.environment.name"] = {fg = c.markup},
        ["@markup.heading"] = {fg = c.markup, fmt = 'bold'},
        ["@markup.link"] = colors.markup,
        ["@markup.link.url"] = {fg = c.markup, fmt = 'underline'},
        ["@markup.list"] = colors.markup,
        ["@markup.math"] = colors.markup,
        ["@markup.raw"] = colors.markup,
        ["@markup.strike"] = {fg = c.markup, fmt = 'strikethrough'},
        ["@markup.strong"] = {fg = c.markup, fmt = 'bold'},
        ["@markup.underline"] = {fg = c.markup, fmt = 'underline'},

        -- Module
        ["@module"] = {fg = c.module},
        ["@none"] = {fg = c.none},
        ["@number"] = {fg = c.number},
        ["@number.float"] = {fg = c.number_float},
        ["@operator"] = {fg = c.operator},  -- = > < |
        ["@parameter.reference"] = colors.TR,
        ["@property"] = {fg = c.ts_property},

        -- punctuation
        ["@punctuation.delimiter"] = {fg = c.delimiters},  -- , . ; :
        ["@punctuation.bracket"] = {fg = c.brackets},  -- ([{}])

        -- strings
        ["@string"] = {fg = c.string, fmt = cfg.code_style.strings},  -- ''
        ["@string.regexp"] = {fg = c.string_regex, fmt = cfg.code_style.strings},
        ["@string.escape"] = {fg = c.string_escape, fmt = cfg.code_style.strings},
        ["@string.special.symbol"] = {fg = c.string_special_symbol},

        -- tag
        ["@tag"] = {fg = c.tag},
        ["@tag.attribute"] = {fg = c.tag},
        ["@tag.delimiter"] = {fg = c.tag},
        ["@text"] = {fg = c.text},
        ["@note"] = {fg = c.note},
        ["@warning"] = {fg = c.warning},
        ["@danger"] = {fg = c.danger},

        -- Type
        ["@type"] = {fg = c.type},  -- Path, class names
        ["@type.builtin"] = {fg = c.type_builtin},  -- KeyError, type(str, bool)

        -- Variable
        ["@variable"] = {fg = c.variable, fmt = cfg.code_style.variables},  -- params
        ["@variable.builtin"] = {fg = c.variable_builtin, fmt = cfg.code_style.variables},  -- self.
        ["@variable.member"] = {fg = c.variable},
        ["@variable.parameter"] = {fg = c.variable_parameter},  -- builtin params (self,)

        -- Markup
        ["@markup.heading.1.markdown"] = {fg = c.markup, fmt = "bold"},
        ["@markup.heading.2.markdown"] = {fg = c.markup, fmt = "bold"},
        ["@markup.heading.3.markdown"] = {fg = c.markup, fmt = "bold"},
        ["@markup.heading.4.markdown"] = {fg = c.markup, fmt = "bold"},
        ["@markup.heading.5.markdown"] = {fg = c.markup, fmt = "bold"},
        ["@markup.heading.6.markdown"] = {fg = c.markup, fmt = "bold"},
        ["@markup.heading.1.marker.markdown"] = {fg = c.markup, fmt = "bold"},
        ["@markup.heading.2.marker.markdown"] = {fg = c.markup, fmt = "bold"},
        ["@markup.heading.3.marker.markdown"] = {fg = c.markup, fmt = "bold"},
        ["@markup.heading.4.marker.markdown"] = {fg = c.markup, fmt = "bold"},
        ["@markup.heading.5.marker.markdown"] = {fg = c.markup, fmt = "bold"},
        ["@markup.heading.6.marker.markdown"] = {fg = c.markup, fmt = "bold"},

        -- Old configuration for nvim-treesiter@0.9.1 and below
        ["@conditional"] = {fg = c.conditional, fmt = cfg.code_style.keywords},
        ["@exception"] = {fg = c.exception},
        ["@field"] = {fg = c.field},
        ["@float"] = {fg = c.float},
        ["@include"] = {fg = c.include},
        ["@method"] = {fg = c.method, fmt = cfg.code_style.functions},
        ["@namespace"] = {fg = c.text},
        ["@parameter"] = {fg = c.text},
        ["@preproc"] = {fg = c.text},
        ["@punctuation.special"] = {fg = c.brackets_in_strings},
        ["@repeat"] = {fg = c.text, fmt = cfg.code_style.keywords},
        ["@string.regex"] = {fg = c.string_regex, fmt = cfg.code_style.strings},
        ["@text.strong"] = {fg = c.text, fmt = 'bold'},
        ["@text.emphasis"] = {fg = c.text, fmt = 'italic'},
        ["@text.underline"] = {fg = c.text, fmt = 'underline'},
        ["@text.strike"] = {fg = c.text, fmt = 'strikethrough'},
        ["@text.title"] = {fg = c.text, fmt = 'bold'},
        ["@text.literal"] = {fg = c.text},
        ["@text.uri"] = {fg = c.text, fmt = 'underline'},
        ["@text.todo"] = {fg = c.text, fmt = cfg.code_style.comments},
        ["@text.todo.unchecked"] = {fg = c.text, fmt = cfg.code_style.comments},
        ["@text.todo.checked"] = {fg = c.text, fmt = cfg.code_style.comments},
        ["@text.math"] = {fg = c.text},
        ["@text.reference"] = {fg = c.text},
        ["@text.environment"] = {fg = c.text},
        ["@text.environment.name"] = {fg = c.text},
        ["@text.diff.add"] = {fg = c.text},
        ["@text.diff.delete"] = {fg = c.text},
    }
    if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
        hl.lsp = {
            ["@lsp.type.comment"] = hl.treesitter[ "@comment"],
            ["@lsp.type.enum"] = hl.treesitter["@type"],
            ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
            ["@lsp.type.interface"] = hl.treesitter["@type"],
            ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
            ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
            ["@lsp.type.namespace"] = hl.treesitter["@module"],
            ["@lsp.type.parameter"] = hl.treesitter["@variable.parameter"],
            ["@lsp.type.property"] = hl.treesitter["@property"],
            ["@lsp.type.variable"] = hl.treesitter["@variable"],
            ["@lsp.type.macro"] = hl.treesitter["@function.macro"],
            ["@lsp.type.method"] = hl.treesitter["@function.method"],
            ["@lsp.type.number"] = hl.treesitter["@number"],
            ["@lsp.type.generic"] = hl.treesitter["@text"],
            ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
            ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
            ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
            ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
            ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
            ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
            ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
            ["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],
        }
    end
else
    hl.treesitter = {
        TSAnnotation = {fg = c.annotation},
        TSAttribute = {fg = c.attribute},
        TSBoolean = {fg = c.boolean},
        TSCharacter = {fg = c.character},
        TSComment = {fg = c.comment, fmt = cfg.code_style.comments},
        TSConditional = {fg = c.conditional, fmt = cfg.code_style.keywords},
        TSConstant = {fg = c.constant},
        TSConstBuiltin = {fg = c.constant},
        TSConstMacro = {fg = c.constant},
        TSConstructor = {fg = c.constructor, fmt = "bold"},
        TSError = {fg = c.error},
        TSException = {fg = c.exception},
        TSField = {fg = c.field},
        TSFloat = {fg = c.number_float},
        TSFunction = {fg = c.func, fmt = cfg.code_style.functions},
        TSFuncBuiltin = {fg = c.func, fmt = cfg.code_style.functions},
        TSFuncMacro = {fg = c.func, fmt = cfg.code_style.functions},
        TSInclude = {fg = c.include},
        TSKeyword = {fg = c.keyword, fmt = cfg.code_style.keywords},
        TSKeywordFunction = {fg = c.keyword, fmt = cfg.code_style.functions},
        TSKeywordOperator =  {fg = c.keyword, fmt = cfg.code_style.keywords},
        TSLabel = {fg = c.label},
        TSMethod = {fg = c.mentod, fmt = cfg.code_style.functions},
        TSNamespace = {fg = c.namespace},
        TSNone = {fg = c.none},
        TSNumber = {fg = c.number},
        TSOperator = {fg = c.operator},
        TSParameter = {fg = c.placeholder},
        TSParameterReference = {fg = c.placeholder},
        TSProperty = {fg = c.property},
        TSPunctDelimiter = {fg = c.delimiters},
        TSPunctBracket = {fg = c.brackets},
        TSPunctSpecial = {fg = c.brackets_in_strings},
        TSRepeat = {fg = c.placeholder, fmt = cfg.code_style.keywords},
        TSString = {fg = c.string, fmt = cfg.code_style.strings},
        TSStringRegex = {fg = c.string_regex, fmt = cfg.code_style.strings},
        TSStringEscape = {fg = c.string_escape, fmt = cfg.code_style.strings},
        TSSymbol = {fg = c.operator},
        TSTag = {fg = c.tag},
        TSTagDelimiter = {fg = c.delimiters},
        TSText = {fg = c.text},
        TSStrong = {fg = c.text, fmt = 'bold'},
        TSEmphasis = {fg = c.text, fmt = 'italic'},
        TSUnderline = {fg = c.none, fmt = 'underline'},
        TSStrike = {fg = c.text, fmt = 'strikethrough'},
        TSTitle = {fg = c.text, fmt = 'bold'},
        TSLiteral = {fg = c.text},
        TSURI = {fg = c.boolean, fmt = 'underline'},
        TSMath = {fg = c.number},
        TSTextReference = {fg = c.number},
        TSEnvironment = {fg = c.boolean},
        TSEnvironmentName = {fg = c.placeholder},
        TSNote = {fg = c.note},
        TSWarning = {fg = c.warning},
        TSDanger = {fg = c.danger},
        TSType = {fg = c.type},
        TSTypeBuiltin = {fg = c.type_builtin},
        TSVariable = {fg = c.variable, fmt = cfg.code_style.variables},
        TSVariableBuiltin = {fg = c.variable_builtin, fmt = cfg.code_style.variables},
    }
end

local diagnostics_error_color = cfg.diagnostics.darker and c.dark_red or c.red
local diagnostics_hint_color = cfg.diagnostics.darker and c.dark_purple or c.purple
local diagnostics_warn_color = cfg.diagnostics.darker and c.dark_yellow or c.yellow
local diagnostics_info_color = cfg.diagnostics.darker and c.dark_cyan or c.cyan
hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = colors.Orange,
    LspCxxHlGroupMemberVariable = colors.Orange,
    LspCxxHlGroupNamespace = colors.Blue,
    LspCxxHlSkippedRegion = colors.Grey,
    LspCxxHlSkippedRegionBeginEnd = colors.Red,

    DiagnosticError = {fg = c.red},
    DiagnosticHint = {fg = c.purple},
    DiagnosticInfo = {fg = c.cyan},
    DiagnosticWarn = {fg = c.yellow},

    DiagnosticVirtualTextError = { bg = cfg.diagnostics.background and util.darken(diagnostics_error_color, 0.1, c.bg0) or c.none,
                                   fg = diagnostics_error_color },
    DiagnosticVirtualTextWarn = { bg = cfg.diagnostics.background and util.darken(diagnostics_warn_color, 0.1, c.bg0) or c.none,
                                  fg = diagnostics_warn_color },
    DiagnosticVirtualTextInfo = { bg = cfg.diagnostics.background and util.darken(diagnostics_info_color, 0.1, c.bg0) or c.none,
                                  fg = diagnostics_info_color },
    DiagnosticVirtualTextHint = { bg = cfg.diagnostics.background and util.darken(diagnostics_hint_color, 0.1, c.bg0) or c.none,
                                  fg = diagnostics_hint_color },

    DiagnosticUnderlineError = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red},
    DiagnosticUnderlineHint = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.purple},
    DiagnosticUnderlineInfo = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.blue},
    DiagnosticUnderlineWarn = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow},

    LspReferenceText = { bg = c.bg2 },
    LspReferenceWrite = { bg = c.bg2 },
    LspReferenceRead = { bg = c.bg2 },

    LspCodeLens = { fg = c.grey, fmt = cfg.code_style.comments },
    LspCodeLensSeparator = { fg = c.grey },
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.ale = {
    ALEErrorSign = hl.plugins.lsp.DiagnosticError,
    ALEInfoSign = hl.plugins.lsp.DiagnosticInfo,
    ALEWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.barbar = {
    BufferCurrent = { fmt = "bold" },
    BufferCurrentMod = { fg = c.orange, fmt = "bold,italic" },
    BufferCurrentSign = { fg = c.purple },
    BufferInactiveMod = { fg = c.light_grey, bg = c.none, fmt = "italic" },
    BufferVisible = { fg = c.light_grey, bg = c.TO },
    BufferVisibleMod = { fg = c.yellow, bg = c.TY, fmt = "italic" },
    BufferVisibleIndex = { fg = c.light_grey, bg = c.TG },
    BufferVisibleSign = { fg = c.light_grey, bg = c.light_grey },
    BufferVisibleTarget = { fg = c.light_grey, bg = c.TT },
}

hl.plugins.cmp = {
    CmpItemAbbr = colors.Fg,
    CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
    CmpItemAbbrMatch = colors.Cyan,
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
    CmpItemMenu = colors.LightGrey,
    CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.coc = {
    CocErrorSign = hl.plugins.lsp.DiagnosticError,
    CocHintSign = hl.plugins.lsp.DiagnosticHint,
    CocInfoSign = hl.plugins.lsp.DiagnosticInfo,
    CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
    WhichKey = colors.Red,
    WhichKeyDesc = colors.Blue,
    WhichKeyGroup = colors.Orange,
    WhichKeySeparator = colors.Green
}

hl.plugins.gitgutter = {
    GitGutterAdd = {fg = c.green},
    GitGutterChange = {fg = c.blue},
    GitGutterDelete = {fg = c.red},
}

hl.plugins.hop = {
    HopNextKey = {fg = c.red, fmt = "bold"},
    HopNextKey1 = {fg = c.cyan, fmt = "bold"},
    HopNextKey2 = {fg = util.darken(c.blue, 0.7)},
    HopUnmatched = colors.Grey,
}

-- comment
hl.plugins.diffview = {
    DiffviewFilePanelTitle = {fg = c.blue, fmt = "bold"},
    DiffviewFilePanelCounter = {fg = c.purple, fmt = "bold"},
    DiffviewFilePanelFileName = colors.Fg,
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath = colors.Grey,
    DiffviewFilePanelPath = colors.Grey,
    DiffviewFilePanelInsertions = colors.Green,
    DiffviewFilePanelDeletions = colors.Red,
    DiffviewStatusAdded = colors.Green,
    DiffviewStatusUntracked = colors.Blue,
    DiffviewStatusModified = colors.Blue,
    DiffviewStatusRenamed = colors.Blue,
    DiffviewStatusCopied = colors.Blue,
    DiffviewStatusTypeChange = colors.Blue,
    DiffviewStatusUnmerged = colors.Blue,
    DiffviewStatusUnknown = colors.Red,
    DiffviewStatusDeleted = colors.Red,
    DiffviewStatusBroken = colors.Red
}

hl.plugins.gitsigns = {
    GitSignsAdd = colors.Green,
    GitSignsAddLn = colors.Green,
    GitSignsAddNr = colors.Green,
    GitSignsChange = colors.Blue,
    GitSignsChangeLn = colors.Blue,
    GitSignsChangeNr = colors.Blue,
    GitSignsDelete = colors.Red,
    GitSignsDeleteLn = colors.Red,
    GitSignsDeleteNr = colors.Red
}

hl.plugins.neo_tree = {
    NeoTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeNormalNC = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeVertSplit = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
    NeoTreeWinSeparator = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
    NeoTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeRootName = { fg = c.orange, fmt = "bold" },
    NeoTreeGitAdded = colors.Green,
    NeoTreeGitDeleted = colors.Red,
    NeoTreeGitModified = colors.Yellow,
    NeoTreeGitConflict = { fg = c.red, fmt = "bold,italic" },
    NeoTreeGitUntracked = { fg = c.red, fmt = "italic" },
    NeoTreeIndentMarker = colors.Grey,
    NeoTreeSymbolicLinkTarget = colors.Purple,
}

hl.plugins.neotest = {
    NeotestAdapterName = { fg = c.purple, fmt = "bold" },
    NeotestDir = colors.Cyan,
    NeotestExpandMarker = colors.Grey,
    NeotestFailed = colors.Red,
    NeotestFile = colors.Cyan,
    NeotestFocused = { fmt = "bold,italic" },
    NeotestIndent = colors.Grey,
    NeotestMarked = { fg = c.orange, fmt = "bold" },
    NeotestNamespace = colors.Blue,
    NeotestPassed = colors.Green,
    NeotestRunning = colors.Yellow,
    NeotestWinSelect = { fg = c.cyan, fmt = "bold" },
    NeotestSkipped = colors.LightGrey,
    NeotestTarget = colors.Purple,
    NeotestTest = colors.Fg,
    NeotestUnknown = colors.LightGrey,
}

hl.plugins.nvim_tree = {
    NvimTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeVertSplit = { fg = c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
    NvimTreeGitDirty = colors.Yellow,
    NvimTreeGitNew = colors.Green,
    NvimTreeGitDeleted = colors.Red,
    NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
    NvimTreeIndentMarker = colors.Fg,
    NvimTreeImageFile = { fg = c.dark_purple },
    NvimTreeSymlink = colors.Purple,
    NvimTreeFolderName = colors.Blue,
}
hl.plugins.telescope = {
    TelescopeBorder = colors.Red,
    TelescopePromptBorder = colors.Cyan,
    TelescopeResultsBorder = colors.Cyan,
    TelescopePreviewBorder = colors.Cyan,
    TelescopeMatching = { fg = c.orange, fmt = "bold" },
    TelescopePromptPrefix = colors.Green,
    TelescopeSelection =  { bg =c.bg2 },
    TelescopeSelectionCaret = colors.Yellow
}

hl.plugins.dashboard = {
    DashboardShortCut = colors.Blue,
    DashboardHeader = colors.Yellow,
    DashboardCenter = colors.Cyan,
    DashboardFooter = { fg = c.dark_red, fmt = "italic"}
}

hl.plugins.outline = {
    FocusedSymbol = { fg = c.purple, bg = c.bg2, fmt = "bold" },
    AerialLine = { fg = c.purple, bg = c.bg2, fmt = "bold" },
}

hl.plugins.navic = {
    NavicText = { fg = c.fg },
    NavicSeparator = { fg = c.light_grey },
}

hl.plugins.ts_rainbow = {
    rainbowcol1 = colors.LightGrey,
    rainbowcol2 = colors.Yellow,
    rainbowcol3 = colors.Blue,
    rainbowcol4 = colors.Orange,
    rainbowcol5 = colors.Purple,
    rainbowcol6 = colors.Green,
    rainbowcol7 = colors.Red
}

hl.plugins.ts_rainbow2 = {
    TSRainbowRed = colors.Red,
    TSRainbowYellow = colors.Yellow,
    TSRainbowBlue = colors.Blue,
    TSRainbowOrange = colors.Orange,
    TSRainbowGreen = colors.Green,
    TSRainbowViolet = colors.Purple,
    TSRainbowCyan = colors.Cyan,
}

hl.plugins.rainbow_delimiters = {
    RainbowDelimiterRed = colors.Red,
    RainbowDelimiterYellow = colors.Yellow,
    RainbowDelimiterBlue = colors.Blue,
    RainbowDelimiterOrange = colors.Orange,
    RainbowDelimiterGreen = colors.Green,
    RainbowDelimiterViolet = colors.Purple,
    RainbowDelimiterCyan = colors.Cyan,
}

hl.plugins.indent_blankline = {
    IndentBlanklineIndent1 = colors.Blue,
    IndentBlanklineIndent2 = colors.Green,
    IndentBlanklineIndent3 = colors.Cyan,
    IndentBlanklineIndent4 = colors.LightGrey,
    IndentBlanklineIndent5 = colors.Purple,
    IndentBlanklineIndent6 = colors.Red,
    IndentBlanklineChar = { fg = c.light_grey, fmt = "nocombine" },
    IndentBlanklineContextChar = { fg = c.light_grey, fmt = "nocombine" },
    IndentBlanklineContextStart = { sp = c.light_grey, fmt = "underline" },
    IndentBlanklineContextSpaceChar = { fmt = "nocombine" },

    -- Ibl v3
    IblIndent = { fg = c.bg1, fmt = "nocombine" },
    IblWhitespace = { fg = c.grey, fmt = "nocombine" },
    IblScope = { fg = c.grey, fmt = "nocombine" },
}

hl.plugins.mini = {
    MiniCompletionActiveParameter = { fmt = "underline" },

    MiniCursorword = { fmt = "underline" },
    MiniCursorwordCurrent = { fmt = "underline" },

    MiniIndentscopeSymbol = { fg = c.grey },
    MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible

    MiniJump = { fg = c.purple, fmt = "underline", sp = c.purple },

    MiniJump2dSpot = { fg = c.red, fmt = "bold,nocombine" },

    MiniStarterCurrent = { fmt = "nocombine" },
    MiniStarterFooter = { fg = c.dark_red, fmt = "italic" },
    MiniStarterHeader = colors.Yellow,
    MiniStarterInactive = { fg = c.grey, fmt = cfg.code_style.comments },
    MiniStarterItem = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
    MiniStarterItemBullet = { fg = c.grey },
    MiniStarterItemPrefix = { fg = c.yellow },
    MiniStarterSection = colors.LightGrey,
    MiniStarterQuery = { fg = c.cyan },

    MiniStatuslineDevinfo = { fg = c.fg, bg = c.bg2 },
    MiniStatuslineFileinfo = { fg = c.fg, bg = c.bg2 },
    MiniStatuslineFilename = { fg = c.grey, bg = c.bg1 },
    MiniStatuslineInactive = { fg = c.grey, bg = c.bg0 },
    MiniStatuslineModeCommand = { fg = c.bg0, bg = c.yellow, fmt = "bold" },
    MiniStatuslineModeInsert = { fg = c.bg0, bg = c.blue, fmt = "bold" },
    MiniStatuslineModeNormal = { fg = c.bg0, bg = c.green, fmt = "bold" },
    MiniStatuslineModeOther = { fg = c.bg0, bg = c.cyan, fmt = "bold" },
    MiniStatuslineModeReplace = { fg = c.bg0, bg = c.red, fmt = "bold" },
    MiniStatuslineModeVisual = { fg = c.bg0, bg = c.purple, fmt = "bold" },

    MiniSurround = { fg = c.bg0, bg = c.orange },

    MiniTablineCurrent = { fmt = "bold" },
    MiniTablineFill = { fg = c.grey, bg = c.bg1 },
    MiniTablineHidden = { fg = c.fg, bg = c.bg1 },
    MiniTablineModifiedCurrent = { fg = c.orange, fmt = "bold,italic" },
    MiniTablineModifiedHidden = { fg = c.light_grey, bg = c.bg1, fmt = "italic" },
    MiniTablineModifiedVisible = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
    MiniTablineTabpagesection = { fg = c.bg0, bg = c.bg_yellow },
    MiniTablineVisible = { fg = c.light_grey, bg = c.bg0 },

    MiniTestEmphasis = { fmt = "bold" },
    MiniTestFail = { fg = c.red, fmt = "bold" },
    MiniTestPass = { fg = c.green, fmt = "bold" },

    MiniTrailspace = { bg = c.red },
}

hl.langs.c = {
    cInclude = colors.Blue,
    cStorageClass = colors.Purple,
    cTypedef = colors.Purple,
    cDefine = colors.Cyan,
    cTSInclude = colors.Blue,
    cTSConstant = colors.Cyan,
    cTSConstMacro = colors.Purple,
    cTSOperator = colors.Purple,
}

hl.langs.cpp = {
    cppStatement = { fg = c.purple, fmt = "bold" },
    cppTSInclude = colors.Blue,
    cppTSConstant = colors.Cyan,
    cppTSConstMacro = colors.Purple,
    cppTSOperator = colors.Purple,
}

hl.langs.markdown = {
    markdownBlockquote = colors.Grey,
    markdownBold = {fg = c.none, fmt = "bold"},
    markdownBoldDelimiter = colors.Grey,
    markdownCode = colors.Green,
    markdownCodeBlock = colors.Green,
    markdownCodeDelimiter = colors.Yellow,
    markdownH1 = {fg = c.red, fmt = "bold"},
    markdownH2 = {fg = c.purple, fmt = "bold"},
    markdownH3 = {fg = c.orange, fmt = "bold"},
    markdownH4 = {fg = c.red, fmt = "bold"},
    markdownH5 = {fg = c.purple, fmt = "bold"},
    markdownH6 = {fg = c.orange, fmt = "bold"},
    markdownHeadingDelimiter = colors.Grey,
    markdownHeadingRule = colors.Grey,
    markdownId = colors.Yellow,
    markdownIdDeclaration = colors.Red,
    markdownItalic = {fg = c.none, fmt = "italic"},
    markdownItalicDelimiter = {fg = c.grey, fmt = "italic"},
    markdownLinkDelimiter = colors.Grey,
    markdownLinkText = colors.Red,
    markdownLinkTextDelimiter = colors.Grey,
    markdownListMarker = colors.Red,
    markdownOrderedListMarker = colors.Red,
    markdownRule = colors.Purple,
    markdownUrl = {fg = c.blue, fmt = "underline"},
    markdownUrlDelimiter = colors.Grey,
    markdownUrlTitleDelimiter = colors.Green
}

hl.langs.php = {
    phpFunctions = {fg = c.fg, fmt = cfg.code_style.functions},
    phpMethods = colors.Cyan,
    phpStructure = colors.Purple,
    phpOperator = colors.Purple,
    phpMemberSelector = colors.Fg,
    phpVarSelector = {fg = c.orange, fmt = cfg.code_style.variables},
    phpIdentifier = {fg = c.orange, fmt = cfg.code_style.variables},
    phpBoolean = colors.Cyan,
    phpNumber = colors.Orange,
    phpHereDoc = colors.Green,
    phpNowDoc = colors.Green,
    phpSCKeyword = {fg = c.purple, fmt = cfg.code_style.keywords},
    phpFCKeyword = {fg = c.purple, fmt = cfg.code_style.keywords},
    phpRegion = colors.Blue
}

hl.langs.scala = {
    scalaNameDefinition = colors.Fg,
    scalaInterpolationBoundary = colors.Purple,
    scalaInterpolation = colors.Purple,
    scalaTypeOperator = colors.Red,
    scalaOperator = colors.Red,
    scalaKeywordModifier = {fg = c.red, fmt = cfg.code_style.keywords},
}

hl.langs.tex = {
    latexTSInclude = colors.Blue,
    latexTSFuncMacro = {fg = c.fg, fmt = cfg.code_style.functions},
    latexTSEnvironment = { fg = c.cyan, fmt = "bold" },
    latexTSEnvironmentName = colors.Yellow,
    texCmdEnv = colors.Cyan,
    texEnvArgName = colors.Yellow,
    latexTSTitle = colors.Green,
    latexTSType = colors.Blue,
    latexTSMath   = colors.Orange,
    texMathZoneX  = colors.Orange,
    texMathZoneXX = colors.Orange,
    texMathDelimZone = colors.LightGrey,
    texMathDelim = colors.Purple,
    texMathOper = colors.Red,
    texCmd = colors.Purple,
    texCmdPart = colors.Blue,
    texCmdPackage = colors.Blue,
    texPgfType = colors.Yellow,
}

hl.langs.vim = {
    vimOption = colors.Red,
    vimSetEqual = colors.Yellow,
    vimMap = colors.Purple,
    vimMapModKey = colors.Orange,
    vimNotation = colors.Red,
    vimMapLhs = colors.Red,
    vimMapRhs = colors.Blue,
    vimVar = {fg = c.fg, fmt = cfg.code_style.variables},
    vimCommentTitle = {fg = c.light_grey, fmt = cfg.code_style.comments},
}

local lsp_kind_icons_color = {
    Default = c.purple,
    Array = c.yellow,
    Boolean = c.orange,
    Class = c.yellow,
    Color = c.green,
    Constant = c.orange,
    Constructor = c.blue,
    Enum = c.purple,
    EnumMember = c.yellow,
    Event = c.yellow,
    Field = c.purple,
    File = c.blue,
    Folder = c.orange,
    Function = c.blue,
    Interface = c.green,
    Key = c.cyan,
    Keyword = c.cyan,
    Method = c.blue,
    Module = c.orange,
    Namespace = c.red,
    Null = c.grey,
    Number = c.orange,
    Object = c.red,
    Operator = c.red,
    Package = c.yellow,
    Property = c.cyan,
    Reference = c.orange,
    Snippet = c.red,
    String = c.green,
    Struct = c.purple,
    Text = c.light_grey,
    TypeParameter = c.red,
    Unit = c.green,
    Value = c.orange,
    Variable = c.purple,
}

function M.setup()
    -- define cmp and aerial kind highlights with lsp_kind_icons_color
    for kind, color in pairs(lsp_kind_icons_color) do
        hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
        hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
        hl.plugins.navic["NavicIcons" .. kind] = { fg = color }
    end

    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    if hl.lsp then
        vim_highlights(hl.lsp)
    end
    for _, group in pairs(hl.langs) do vim_highlights(group) end
    for _, group in pairs(hl.plugins) do vim_highlights(group) end

    -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
    local function replace_color(prefix, color_name)
        if not color_name then return "" end
        if color_name:sub(1, 1) == '$' then
            local name = color_name:sub(2, -1)
            color_name = c[name]
            if not color_name then
                vim.schedule(function()
                    vim.notify('twodark.nvim: unknown color "' .. name .. '"', vim.log.levels.ERROR, { title = "twodark.nvim" })
                end)
                return ""
            end
        end
        return prefix .. "=" .. color_name
    end

    for group_name, group_settings in pairs(vim.g.twodark_config.highlights) do
        vim.api.nvim_command(string.format("highlight %s %s %s %s %s", group_name,
            replace_color("guifg", group_settings.fg),
            replace_color("guibg", group_settings.bg),
            replace_color("guisp", group_settings.sp),
            replace_color("gui", group_settings.fmt)))
    end
end

return M
