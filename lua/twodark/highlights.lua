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
    -- old colors
    placeholder = {fg = c.fg},
    LightGrey = {fg = c.grey_1},
    Grey = {fg = c.grey},
    Red = {fg = c.red},
    Cyan = {fg = c.cyan},
    Yellow = {fg = c.yellow},
    Orange = {fg = c.orange},
    Green = {fg = c.green},
    Blue = {fg = c.blue},
}

hl.common = {

    -- primary text & backgrounds
    Normal = {fg = c.text_secondary, bg = cfg.transparent and c.none or c.none},
    Terminal = {fg = c.terminal_text, bg = cfg.transparent and c.none or c.terminal_background},
    EndOfBuffer = {fg = cfg.ending_tildes and c.bg2 or c.none, bg = cfg.transparent and c.none or c.bg0},
    FoldColumn = {fg = c.placeholder, bg = cfg.transparent and c.none or c.bg1},
    Folded = {fg = c.test_yellow, bg = cfg.transparent and c.none or c.bg1},
    SignColumn = {fg = c.test_white, bg = cfg.transparent and c.none or c.bg0},
    ToolbarLine = {fg = c.line_separator, bg = cfg.transparent and c.none or c.b0},  -- more line separator in the toolbar

    -- cursor text colors (reverse of bg)
    Cursor = {fmt = "reverse"},
    vCursor = {fmt = "reverse"},
    iCursor = {fmt = "reverse"},
    lCursor = {fmt = "reverse"},
    CursorIM = {fmt = "reverse"},

    -- more cursor colors
    CursorColumn = {bg = c.placeholder},
    CursorLine = {fg = c.complete_menu_predict, bg = c.nvimtree_selected_bg},  -- nvim-tree selected background
    ColorColumn = {bg = c.placeholder},
    CursorLineNr = {fg = c.placeholder},

    -- lines numbers
    LineNr = {fg = c.line_numbers},  -- nvim line numbers 

    -- Diff
    Conceal = {fg = c.grey_3, bg = c.grey_3},
    DiffAdd = {fg = c.none, bg = c.placeholder},
    DiffChange = {fg = c.none, bg = c.test_yellow},
    DiffDelete = {fg = c.none, bg = c.placeholder},
    DiffText = {fg = c.none, bg= c.test_teal},
    DiffAdded = colors.TR,
    DiffRemoved = colors.TO,
    DiffFile = colors.TY,
    DiffIndexLine = {fg = c.test_yellow},

    -- Dir + errors
    Directory = {fg = c.keyword},  -- currently open folder in nvimtree
    ErrorMsg = {fg = c.text_secondary, fmt = "none"},
    WarningMsg = {fg = c.text_secondary, fmt = "none"},
    MoreMsg = {fg = c.text_secondary, bg = c.placeholder, fmt = "none"},

    -- search match sub
    CurSearch = {fg = c.placeholder, bg = c.orange},
    IncSearch = {fg = c.placeholder, bg = c.orange},
    Search = {fg = c.search_text, bg = c.search_background},
    Substitute = {fg = c.complete_menu_predict, bg = c.complete_menu_selection_background},  -- <leader>h multi-replace
    MatchParen = {fg = c.character, bg = c.func},  -- cursor blocks when on {}s

    -- text modify
    NonText = {fg = c.line_separator},  -- line between tabs
    Whitespace = {fg = c.test_white},  -- cursor highlight color in lua
    SpecialKey = {fg = c.test_white},

    -- complete menus
    Pmenu = {fg = c.none, bg = c.complete_menu_background},  -- bg = complete menu bg
    PmenuThumb = {fg = c.none, bg = c.text_tertiary},  -- compplete menu top scroll bar
    PmenuSbar = {fg = c.none, bg = c.text_primary},  -- complete menu bot scroll bar
    PmenuSel = {fg = c.text_primary, bg = c.complete_menu_selection_background},  -- complete menu tab through options
    WildMenu = {fg = c.test_purple, bg = c.blue},

    -- no idea
    Question = {fg = c.tildes},  -- Checkmarks on PackerSync
    SpellBad = {fg = c.none, fmt = "undercurl", sp = c.danger},
    SpellCap = {fg = c.none, fmt = "undercurl", sp = c.test_orange},
    SpellLocal = {fg = c.none, fmt = "undercurl", sp = c.blue},
    SpellRare = {fg = c.none, fmt = "undercurl", sp = c.placeholder},

    -- toolbar colors
    StatusLine = {fg = c.test_yellow, bg = cfg.transparent and c.none or c.status_line_background},  -- toolbar background behind TabLine
    StatusLineTerm = {fg = c.grey_3, bg = c.grey_3},
    StatusLineNC = {fg = c.placeholder, bg = cfg.transparent and c.none or c.status_line_background},  -- unsaved changes (something over writes this)
    StatusLineTermNC = {fg = c.test_purple, bg = c.test_yellow},

    -- Tab backgrounds, this defaults to StatusLine if set to transparent
    TabLine = {fg = c.text_tertiary, bg = cfg.transparent and c.none or c.toolbar_background},  -- background of non-selected toolbar buffers
    TabLineFill = {fg = c.none, bg = cfg.transparent and c.none or c.toolbar_background},  -- toolbar_background for empty space
    TabLineSel =  {fg = c.none, bg = c.placeholder},  -- unknown

    -- line separator and cursor background
    WinSeparator = {fg = c.line_separator},  -- line_separator between buffers
    Visual = {fg = c.none, bg = c.grey_3},  -- cursor selected background and foreground text
    VisualNOS = {fg = c.placeholder, bg = c.test_purple, fmt = "underline"},
    QuickFixLine = {fg = c.test_teal, fmt = "none"},

    -- debug
    Debug = {fg = c.test_white},
    debugPC = {fg = c.complete_menu_predict, bg = c.complete_menu_selection_background},
    debugBreakpoint = {fg = c.placeholder, bg = c.danger},

    -- toolbar and bg
    ToolbarButton = {fg = c.test_white, bg = c.transparent},
    FloatBorder = {fg = c.placeholder, bg = c.transparent},
    NormalFloat = {fg = c.text_primary, bg = c.whichkey_background},  -- <leader> background
}

hl.syntax = {
    String = {fg = c.string, fmt = cfg.code_style.strings},  -- "string"
    Character = {fg = c.text_tertiary},  -- lua
    Number = {fg = c.number},  -- "nums"
    Float = {fg = c.number_float},
    Boolean = {fg = c.boolean},
    Type = {fg = c.type},
    Structure = {fg = c.brackets},  -- lua "{ }, 300"
    StorageClass = {fg = c.boolean},
    Identifier = {fg = c.lorem, fmt = cfg.code_style.variables},
    Constant = {fg = c.text_tertiary}, -- lua "true, false"
    PreProc = {fg = c.nvimtree_git_star},  -- git * symbol in nvim tree
    PreCondit = {fg = c.test_yellow},
    Include = {fg = c.test_yellow},
    Keyword = {fg = c.keyword, fmt = cfg.code_style.keywords},
    Define = {fg = c.keyword_func},
    Typedef = {fg = c.type},
    Exception = {fg = c.exception},
    Conditional = {fg = c.lua_conditional, fmt = cfg.code_style.keywords},  -- lua if then
    Repeat = {fg = c.lua_repeat, fmt = cfg.code_style.keywords},  -- lua for in
    Statement = {fg = c.lua_statement},  -- lua "return"
    Macro = {fg = c.placeholder},
    Error = {fg = c.placeholder},
    Label = {fg = c.placeholder},
    Special = {fg = c.string_special_symbol},
    SpecialChar = {fg = c.placeholder},
    Function = {fg = c.keyword_func, fmt = cfg.code_style.functions},
    Operator = {fg = c.operator},  -- this effects lua = < > |
    Title = {fg = c.text_primary},
    Tag = {fg = c.tag},
    Delimiter = {fg = c.delimiters},
    Comment = {fg = c.comment, fmt = cfg.code_style.comments},
    SpecialComment = {fg = c.string_special_symbol, fmt = cfg.code_style.comments},
    Todo = {fg = c.comment, fmt = cfg.code_style.comments}
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
        ["@diff.add"] = {fg = c.grey_4},
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
        ["@keyword.directive"] = {fg = c.keyword},
        ["@keyword.exception"] = {fg = c.keyword},
        ["@keyword.function"] = {fg = c.keyword_func, fmt = cfg.code_style.functions},
        ["@keyword.import"] = {fg = c.keyword_import},
        ["@keyword.operator"] =  {fg = c.keyword, fmt = cfg.code_style.keywords},
        ["@keyword.repeat"] = {fg = c.keyword, fmt = cfg.code_style.keywords},

        -- Label
        ["@label"] = {fg = c.label},
        ["@markup.emphasis"] = {fg = c.markup, fmt = 'italic'},
        ["@markup.environment"] = {fg = c.markup},
        ["@markup.environment.name"] = {fg = c.markup},
        ["@markup.heading"] = {fg = c.markup, fmt = 'bold'},
        ["@markup.link"] = {fg = c.markup},
        ["@markup.link.url"] = {fg = c.markup, fmt = 'underline'},
        ["@markup.list"] = {fg = c.markup},
        ["@markup.math"] = {fg = c.markup},
        ["@markup.raw"] = {fg = c.markup},
        ["@markup.strike"] = {fg = c.markup, fmt = 'strikethrough'},
        ["@markup.strong"] = {fg = c.markup, fmt = 'bold'},
        ["@markup.underline"] = {fg = c.markup, fmt = 'underline'},

        -- Module
        ["@module"] = {fg = c.module},
        ["@none"] = {fg = c.none},
        ["@number"] = {fg = c.number},
        ["@number.float"] = {fg = c.number_float},
        ["@operator"] = {fg = c.operator},  -- = > < |
        ["@parameter.reference"] = colors.TO,
        ["@property"] = {fg = c.lua_property},  -- lua properties, doesnt seem to effect python

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
        ["@text"] = {fg = c.text_primary},
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
        ["@namespace"] = {fg = c.text_primary},
        ["@parameter"] = {fg = c.text_primary},
        ["@preproc"] = {fg = c.text_primary},
        ["@punctuation.special"] = {fg = c.brackets_in_strings},
        ["@repeat"] = {fg = c.text_primary, fmt = cfg.code_style.keywords},
        ["@string.regex"] = {fg = c.string_regex, fmt = cfg.code_style.strings},
        ["@text.strong"] = {fg = c.text_primary, fmt = 'bold'},
        ["@text.emphasis"] = {fg = c.text_primary, fmt = 'italic'},
        ["@text.underline"] = {fg = c.text_primary, fmt = 'underline'},
        ["@text.strike"] = {fg = c.text_primary, fmt = 'strikethrough'},
        ["@text.title"] = {fg = c.text_primary, fmt = 'bold'},
        ["@text.literal"] = {fg = c.text_primary},
        ["@text.uri"] = {fg = c.text_primary, fmt = 'underline'},
        ["@text.todo"] = {fg = c.text_primary, fmt = cfg.code_style.comments},
        ["@text.todo.unchecked"] = {fg = c.text_primary, fmt = cfg.code_style.comments},
        ["@text.todo.checked"] = {fg = c.text_primary, fmt = cfg.code_style.comments},
        ["@text.math"] = {fg = c.text_primary},
        ["@text.reference"] = {fg = c.text_primary},
        ["@text.environment"] = {fg = c.text_primary},
        ["@text.environment.name"] = {fg = c.text_primary},
        ["@text.diff.add"] = {fg = c.text_primary},
        ["@text.diff.delete"] = {fg = c.text_primary},
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

local diagnostics_error_color = cfg.diagnostics.darker and c.error or c.error
local diagnostics_hint_color = cfg.diagnostics.darker and c.warning or c.warning
local diagnostics_warn_color = cfg.diagnostics.darker and c.warning or c.warning
local diagnostics_info_color = cfg.diagnostics.darker and c.text_tertiary or c.text_tertiary
hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = colors.Orange,
    LspCxxHlGroupMemberVariable = colors.Orange,
    LspCxxHlGroupNamespace = colors.Blue,
    LspCxxHlSkippedRegion = colors.Grey,
    LspCxxHlSkippedRegionBeginEnd = colors.Red,

    DiagnosticError = {fg = c.text_tertiary},
    DiagnosticHint = {fg = c.text_tertiary},
    DiagnosticInfo = {fg = c.text_tertiary},
    DiagnosticWarn = {fg = c.text_tertiary},

    DiagnosticVirtualTextError = { bg = cfg.transparent and c.none or c.warning,
                                   fg = diagnostics_error_color },
    DiagnosticVirtualTextWarn = { bg = cfg.transparent and c.none or c.warning,
                                  fg = diagnostics_warn_color },
    DiagnosticVirtualTextInfo = { bg = cfg.transparent and c.none or c.warning,
                                  fg = diagnostics_info_color },
    DiagnosticVirtualTextHint = { bg = cfg.transparent and c.none or c.warning,
                                  fg = diagnostics_hint_color },

    DiagnosticUnderlineError = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.text_tertiary},
    DiagnosticUnderlineHint = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.text_tertiary},
    DiagnosticUnderlineInfo = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.text_tertiary},
    DiagnosticUnderlineWarn = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.text_tertiary},

    LspReferenceText = { bg = c.test_yellow },
    LspReferenceWrite = { bg = c.test_yellow },
    LspReferenceRead = { bg = c.test_yellow },

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
    BufferCurrent = {fmt = "bold"},
    BufferCurrentMod = {fg = c.keyword_import, fmt = "bold,italic"},
    BufferCurrentSign = {fg = c.text_tertiary},
    BufferInactiveMod = {fg = c.type_builtin, bg = cfg.transparent and c.none or c.grey_1, fmt = "italic"},  -- shows up in lua
    BufferVisible = {fg = c.text_tertiary, bg = cfg.transparent and c.none or c.keyword_import},  -- non selected buffer
    BufferVisibleMod = {fg = c.test_yellow, bg = c.grey_2, fmt = "italic"},
    BufferVisibleIndex = {fg = c.test_orange, bg = c.grey_2},
    BufferVisibleSign = {fg = c.line_separator, bg = c.grey_2},
    BufferVisibleTarget = {fg = c.grey_1, bg = c.grey_2},  -- next non selected buffer
}

hl.plugins.cmp = {
    CmpItemAbbr = {fg = c.complete_menu_text},  -- 1st col text
    CmpItemAbbrDeprecated = {fg = c.complete_menu_deprecated, fmt = "strikethrough"},  -- 3rd column deprecated
    CmpItemAbbrMatch = {fg = c.complete_menu_predict},  -- 1st col prediction
    CmpItemAbbrMatchFuzzy = {fg = c.complete_menu_match_fuzzy, fmt = "underline"},  -- fuzzy match often underlined
    CmpItemMenu = {fg = c.text_tertiary}, -- [lsp] [buffer]
    CmpItemKind = {fg = c.none, bg = c.complete_menu_selection_background, fmt = cfg.cmp_itemkind_reverse and "reverse"},  -- background of tabbed selection
}

hl.plugins.coc = {
    CocErrorSign = hl.plugins.lsp.DiagnosticError,
    CocHintSign = hl.plugins.lsp.DiagnosticHint,
    CocInfoSign = hl.plugins.lsp.DiagnosticInfo,
    CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
    WhichKey = {fg = c.whichkey_letter},  -- letter
    WhichKeySeparator = {fg = c.whichkey_arrow},  -- arrow
    WhichKeyDesc = {fg = c.whichkey_description},  -- decription
    WhichKeyGroup = {fg = c.whichkey_prefix},  -- +prefix
}

hl.plugins.gitgutter = {
    GitGutterAdd = {fg = c.grey_3}, -- git add lines to the left of numbers
    GitGutterChange = {fg = c.grey_2},
    GitGutterDelete = {fg = c.grey_2},
}

hl.plugins.hop = {
    HopNextKey = {fg = c.grey_2, fmt = "bold"},
    HopNextKey1 = {fg = c.cyan, fmt = "bold"},
    HopNextKey2 = {fg = util.darken(c.blue, 0.7)},
    HopUnmatched = colors.Grey,
}

-- comment
hl.plugins.diffview = {
    DiffviewFilePanelTitle = {fg = c.blue, fmt = "bold"},
    DiffviewFilePanelCounter = {fg = c.placeholder, fmt = "bold"},
    DiffviewFilePanelFileName = colors.placeholder,
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath = colors.Grey,
    DiffviewFilePanelPath = colors.Grey,
    DiffviewFilePanelInsertions = colors.grey_4,
    DiffviewFilePanelDeletions = colors.Red,
    DiffviewStatusAdded = colors.grey_4,
    DiffviewStatusUntracked = colors.grey_4,
    DiffviewStatusModified = colors.grey_4,
    DiffviewStatusRenamed = colors.grey_4,
    DiffviewStatusCopied = colors.Blue,
    DiffviewStatusTypeChange = colors.Blue,
    DiffviewStatusUnmerged = colors.Blue,
    DiffviewStatusUnknown = colors.Red,
    DiffviewStatusDeleted = colors.Red,
    DiffviewStatusBroken = colors.Red
}

hl.plugins.gitsigns = {
    GitSignsAdd = colors.grey_4,
    GitSignsAddLn = colors.grey_4,
    GitSignsAddNr = colors.grey_4,
    GitSignsChange = colors.grey_4,
    GitSignsChangeLn = colors.grey_4,
    GitSignsChangeNr = colors.grey_4,
    GitSignsDelete = colors.grey_4,
    GitSignsDeleteLn = colors.grey_4,
    GitSignsDeleteNr = colors.grey_4
}

hl.plugins.neo_tree = {
    NeoTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.placeholder },
    NeoTreeNormalNC = { fg = c.fg, bg = cfg.transparent and c.none or c.placeholder },
    NeoTreeVertSplit = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
    NeoTreeWinSeparator = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
    NeoTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.placeholder, bg = cfg.transparent and c.none or c.placeholder },
    NeoTreeRootName = { fg = c.orange, fmt = "bold" },
    NeoTreeGitAdded = colors.grey_4,
    NeoTreeGitDeleted = colors.Red,
    NeoTreeGitModified = colors.Yellow,
    NeoTreeGitConflict = { fg = c.grey_2, fmt = "bold,italic" },
    NeoTreeGitUntracked = { fg = c.grey_2, fmt = "italic" },
    NeoTreeIndentMarker = colors.Grey,
    NeoTreeSymbolicLinkTarget = {fg = c.placeholder},
}

hl.plugins.neotest = {
    NeotestAdapterName = { fg = c.placeholder, fmt = "bold" },
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
    NeotestTarget = {fg = c.placeholder},
    NeotestTest = colors.placeholder,
    NeotestUnknown = colors.LightGrey,
}

hl.plugins.nvim_tree = {
    NvimTreeNormal = {fg = c.text_primary, bg = cfg.transparent and c.none or c.placeholder},
    NvimTreeVertSplit = {fg = c.line_separator, bg = cfg.transparent and c.none or c.placeholder},
    NvimTreeEndOfBuffer = {fg = cfg.ending_tildes and c.type_builtin or c.none, bg = cfg.transparent and c.none or c.type_builtin},  -- * git changes
    NvimTreeRootFolder = {fg = c.text_secondary},  -- root folder
    NvimTreeGitDirty = {fg = c.text_tertiary},
    NvimTreeGitNew = {fg = c.text_tertiary},
    NvimTreeGitDeleted = {fg = c.text_tertiary},
    NvimTreeSpecialFile = {fg = c.text_tertiary, fmt = "underline"}, -- readme file
    NvimTreeIndentMarker = {fg = c.text_tertiary},
    NvimTreeImageFile = {fg = c.text_tertiary},
    NvimTreeSymlink = {fg = c.text_tertiary},
    NvimTreeFolderName = {fg = c.text_tertiary},
}
hl.plugins.telescope = {
    TelescopeBorder = {fg = c.grey_1}, -- telescope titles
    TelescopePromptBorder = {fg = c.grey_1},  -- textbox boarder
    TelescopeResultsBorder = {fg = c.grey_1},  -- results boarder
    TelescopePreviewBorder = {fg = c.grey_1},  -- preview boarder
    TelescopeMatching = { fg = c.text_primary, fmt = "bold" },  -- matching text in filename
    TelescopePromptPrefix = {fg = c.text_primary},  -- > carrot
    TelescopeSelection =  {bg =c.complete_menu_selection_background}, -- background of tab selection
    TelescopeSelectionCaret = {fg = c.keyword_func},
}

hl.plugins.dashboard = {
    DashboardShortCut = colors.Blue,
    DashboardHeader = colors.Yellow,
    DashboardCenter = colors.Cyan,
    DashboardFooter = { fg = c.dark_red, fmt = "italic"}
}

hl.plugins.outline = {
    FocusedSymbol = { fg = c.placeholder, bg = c.bg2, fmt = "bold" },
    AerialLine = { fg = c.placeholder, bg = c.bg2, fmt = "bold" },
}

hl.plugins.navic = {
    NavicText = { fg = c.fg },
    NavicSeparator = { fg = c.grey_1 },
}

hl.plugins.ts_rainbow = {
    rainbowcol1 = colors.LightGrey,
    rainbowcol2 = colors.Yellow,
    rainbowcol3 = colors.Blue,
    rainbowcol4 = colors.Orange,
    rainbowcol5 = {fg = c.placeholder},
    rainbowcol6 = colors.Green,
    rainbowcol7 = colors.Red
}

hl.plugins.ts_rainbow2 = {
    TSRainbowRed = colors.Red,
    TSRainbowYellow = colors.Yellow,
    TSRainbowBlue = colors.Blue,
    TSRainbowOrange = colors.Orange,
    TSRainbowGreen = colors.Green,
    TSRainbowViolet = {fg = c.placeholder},
    TSRainbowCyan = colors.Cyan,
}

hl.plugins.rainbow_delimiters = {
    RainbowDelimiterRed = colors.Red,
    RainbowDelimiterYellow = colors.Yellow,
    RainbowDelimiterBlue = colors.Blue,
    RainbowDelimiterOrange = colors.Orange,
    RainbowDelimiterGreen = colors.Green,
    RainbowDelimiterViolet = {fg = c.placeholder},
    RainbowDelimiterCyan = colors.Cyan,
}

hl.plugins.indent_blankline = {
    IndentBlanklineIndent1 = colors.Blue,
    IndentBlanklineIndent3 = colors.Green,
    IndentBlanklineIndent4 = colors.LightGrey,
    IndentBlanklineIndent5 = {fg = c.placeholder},
    IndentBlanklineIndent6 = colors.Red,
    IndentBlanklineChar = { fg = c.grey_1, fmt = "nocombine" },
    IndentBlanklineContextChar = { fg = c.grey_1, fmt = "nocombine" },
    IndentBlanklineContextStart = { sp = c.grey_1, fmt = "underline" },
    IndentBlanklineContextSpaceChar = { fmt = "nocombine" },

    -- Ibl v3
    IblIndent = { fg = c.grey_4, fmt = "nocombine" },  -- all lines
    IblWhitespace = { fg = c.grey_4, fmt = "nocombine" },  -- underline between current area and text
    IblScope = { fg = c.grey_4, fmt = "nocombine" },  -- line of current cursor area
}

hl.plugins.mini = {
    MiniCompletionActiveParameter = { fmt = "underline" },

    MiniCursorword = { fmt = "underline" },
    MiniCursorwordCurrent = { fmt = "underline" },

    MiniIndentscopeSymbol = { fg = c.grey },
    MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible

    MiniJump = { fg = c.placeholder, fmt = "underline", sp = c.placeholder },

    MiniJump2dSpot = { fg = c.grey_2, fmt = "bold,nocombine" },

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
    MiniStatuslineModeNormal = { fg = c.bg0, bg = c.grey_2, fmt = "bold" },
    MiniStatuslineModeOther = { fg = c.bg0, bg = c.cyan, fmt = "bold" },
    MiniStatuslineModeReplace = { fg = c.bg0, bg = c.grey_2, fmt = "bold" },
    MiniStatuslineModeVisual = { fg = c.bg0, bg = c.placeholder, fmt = "bold" },

    MiniSurround = { fg = c.bg0, bg = c.orange },

    MiniTablineCurrent = { fmt = "bold" },
    MiniTablineFill = { fg = c.grey, bg = c.bg1 },
    MiniTablineHidden = { fg = c.fg, bg = c.bg1 },
    MiniTablineModifiedCurrent = { fg = c.orange, fmt = "bold,italic" },
    MiniTablineModifiedHidden = { fg = c.grey_1, bg = c.bg1, fmt = "italic" },
    MiniTablineModifiedVisible = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
    MiniTablineTabpagesection = { fg = c.bg0, bg = c.bg_yellow },
    MiniTablineVisible = { fg = c.grey_1, bg = c.bg0 },

    MiniTestEmphasis = { fmt = "bold" },
    MiniTestFail = { fg = c.grey_2, fmt = "bold" },
    MiniTestPass = { fg = c.grey_2, fmt = "bold" },

    MiniTrailspace = { bg = c.grey_2 },
}

hl.langs.c = {
    cInclude = colors.Blue,
    cStorageClass = {fg = c.placeholder},
    cTypedef = {fg = c.placeholder},
    cDefine = colors.Cyan,
    cTSInclude = colors.Blue,
    cTSConstant = colors.Cyan,
    cTSConstMacro = {fg = c.placeholder},
    cTSOperator = {fg = c.placeholder},
}

hl.langs.cpp = {
    cppStatement = { fg = c.placeholder, fmt = "bold" },
    cppTSInclude = colors.Blue,
    cppTSConstant = colors.Cyan,
    cppTSConstMacro = {fg = c.placeholder},
    cppTSOperator = {fg = c.placeholder},
}

hl.langs.markdown = {
    markdownBlockquote = colors.Grey,
    markdownBold = {fg = c.none, fmt = "bold"},
    markdownBoldDelimiter = colors.Grey,
    markdownCode = colors.Green,
    markdownCodeBlock = colors.Green,
    markdownCodeDelimiter = {fg = c.placeholder},
    markdownH1 = {fg = c.red, fmt = "bold"},
    markdownH2 = {fg = c.placeholder, fmt = "bold"},
    markdownH3 = {fg = c.orange, fmt = "bold"},
    markdownH4 = {fg = c.red, fmt = "bold"},
    markdownH5 = {fg = c.placeholder, fmt = "bold"},
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
    markdownRule = {fg = c.placeholder},
    markdownUrl = {fg = c.blue, fmt = "underline"},
    markdownUrlDelimiter = colors.Grey,
    markdownUrlTitleDelimiter = colors.Green
}

hl.langs.php = {
    phpFunctions = {fg = c.fg, fmt = cfg.code_style.functions},
    phpMethods = colors.Cyan,
    phpStructure = {fg = c.placeholder},
    phpOperator = {fg = c.placeholder},
    phpMemberSelector = colors.placeholder,
    phpVarSelector = {fg = c.orange, fmt = cfg.code_style.variables},
    phpIdentifier = {fg = c.orange, fmt = cfg.code_style.variables},
    phpBoolean = colors.Cyan,
    phpNumber = colors.Orange,
    phpHereDoc = colors.Green,
    phpNowDoc = colors.Green,
    phpSCKeyword = {fg = c.placeholder, fmt = cfg.code_style.keywords},
    phpFCKeyword = {fg = c.placeholder, fmt = cfg.code_style.keywords},
    phpRegion = colors.Blue
}

hl.langs.scala = {
    scalaNameDefinition = colors.placeholder,
    scalaInterpolationBoundary = {fg = c.placeholder},
    scalaInterpolation = {fg = c.placeholder},
    scalaTypeOperator = colors.Red,
    scalaOperator = colors.Red,
    scalaKeywordModifier = {fg = c.grey_2, fmt = cfg.code_style.keywords},
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
    texMathDelim = {fg = c.placeholder},
    texMathOper = colors.Red,
    texCmd = {fg = c.placeholder},
    texCmdPart = colors.Blue,
    texCmdPackage = colors.Blue,
    texPgfType = colors.Yellow,
}

hl.langs.vim = {
    vimOption = colors.Red,
    vimSetEqual = colors.Yellow,
    vimMap = {fg = c.placeholder},
    vimMapModKey = colors.Orange,
    vimNotation = colors.Red,
    vimMapLhs = colors.Red,
    vimMapRhs = colors.Blue,
    vimVar = {fg = c.fg, fmt = cfg.code_style.variables},
    vimCommentTitle = {fg = c.grey_1, fmt = cfg.code_style.comments},
}

local lsp_kind_icons_color = {
    Default = c.placeholder,
    Array = c.yellow,
    Boolean = c.orange,
    Class = c.yellow,
    Color = c.grey_2,
    Constant = c.orange,
    Constructor = c.blue,
    Enum = c.placeholder,
    EnumMember = c.yellow,
    Event = c.yellow,
    Field = c.placeholder,
    File = c.blue,
    Folder = c.orange,
    Function = c.blue,
    Interface = c.grey_2,
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
    String = c.grey_2,
    Struct = c.placeholder,
    Text = c.grey_1,
    TypeParameter = c.red,
    Unit = c.grey_2,
    Value = c.orange,
    Variable = c.placeholder,
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
