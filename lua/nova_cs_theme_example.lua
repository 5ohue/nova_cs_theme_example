local M = {
    p = {},
    groups = {},
}
-------------------------------------------------------------------------------

local function apply_groups(groups)
    for group, parameters in pairs(groups) do
        vim.api.nvim_set_hl(0, group, parameters)
    end
end

-------------------------------------------------------------------------------

local function create_groups(p)
    M.groups.base = {
        -- Editor highlight groups
        Normal          = { fg = p.fg,                      bg = p.bg },                    -- Normal text and background color
        NormalNC        = { fg = p.fg,                      bg = p.gray_02 },               -- Normal text in non-current windows
        Fg              = { fg = p.fg,                      bg = 'NONE' },
        SignColumn      = { fg = p.fg,                      bg = 'NONE' },                  -- Column where signs are displayed
        EndOfBuffer     = { fg = p.gray_15 },                                               -- ~ lines at the end of a buffer
        NormalFloat     = { fg = p.fg,                      bg = p.gray_02 },               -- Normal text and background color for floating windows
        FloatBorder     = { fg = p.bright.blue,             bg = p.gray_02 },
        ColorColumn     = { fg = 'NONE',                    bg = p.gray_05 },               -- Used for the columns set with 'colorcolumn'
        Conceal         = { fg = p.gray_05 },                                               -- Placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor          = { fg = 'NONE',                    bg = 'NONE', reverse = true },  -- The character under the cursor
        CursorIM        = { link = 'Cursor' },                                              -- Like Cursor, but used when in IME mode
        Directory       = { fg = p.bright.blue,             bg = 'NONE', bold = true },     -- Directory names (and other special names in listings)
        ErrorMsg        = { fg = p.bright.red },                                            -- error messages
        Folded          = { fg = p.gray_13,                 bg = 'NONE', italic = true },
        -- FoldColumn = { fg = p.blue },
        IncSearch       = { fg = p.mixed_bright.green_cyan, bg = 'NONE', reverse = true },
        LineNr          = { fg = p.gray_26 },
        CursorLineNr    = { fg = p.bright.green },
        MatchParen      = { fg = 'NONE',                    bg = p.gray_12, bold = true },
        ModeMsg         = { fg = p.fg,          bold = true },                              -- "-- Insert --" text at the bottom
        MoreMsg         = { fg = p.bright.cyan, bold = true },
        NonText         = { fg = p.gray_14 },  -- Whitespace
        Pmenu           = { fg = p.gray_07,                 bg = p.fg },
        PmenuSel        = { fg = p.bg,                      bg = p.fg },
        PmenuSbar       = { fg = p.fg,                      bg = p.bg },
        PmenuThumb      = { fg = p.fg,                      bg = p.bg },
        Question        = { fg = p.normal.green, bold = true },
        -- QuickFixLine = { fg = p.blue, bg = p.gray01, bold = true, italic = true },
        -- qfLineNr = { fg = p.blue, bg = p.gray01 },
        Search          = { reverse = true },
        SpecialKey      = { fg = p.mixed_bg_normal_50.red_yellow },
        SpellBad        = { fg = 'NONE',          bg = 'NONE', italic = true, undercurl = true },
        SpellCap        = { fg = 'NONE',          bg = 'NONE', italic = true, undercurl = true },
        SpellLocal      = { fg = 'NONE',          bg = 'NONE', italic = true, undercurl = true },
        SpellRare       = { fg = 'NONE',          bg = 'NONE', italic = true, undercurl = true },
        StatusLine      = { fg = p.normal.magenta,    bg = p.bg_normal_25.green },
        StatusLineNC    = { fg = p.bright.magenta,    bg = p.bg_normal_25.green },
        StatusLineTerm  = { fg = p.normal.magenta,    bg = p.normal.red },
        StatusLineTermNC= { fg = p.normal.magenta,    bg = p.normal.red },
        TablineSel      = { fg = p.normal.green,    bg = p.gray_07 },
        Tabline         = { fg = p.gray_05 },
        Title           = { fg = p.normal.cyan,     bg = 'NONE', bold = true },
        Visual          = { fg = 'NONE',            bg = p.bg_normal_25.blue }, -- visual selection color
        VisualNOS       = { fg = 'NONE',            bg = p.selectionBg },  -- According to a github issue, this is deprecated
        WarningMsg      = { fg = p.normal.yellow, bold = true },
        WildMenu        = { fg = p.fg,              bg = p.bg, bold = true },
        CursorColumn    = { fg = 'NONE', bg = p.gray_50 }, -- column highlight color
        CursorLine      = { fg = 'NONE', bg = p.gray_05 }, -- line highlight color
        VertSplit       = { fg = p.normal.green }, -- line between two split buffers
        NormalMode    = { fg = p.normal.magenta, bg = p.normal.green, reverse = true },
        InsertMode    = { fg = p.normal.magenta, bg = p.normal.green, reverse = true },
        VisualMode    = { fg = p.normal.magenta, bg = p.normal.green, reverse = true },
        -- CommandMode = { fg = p.gray05, bg = 'NONE', reverse = true },
        -- Warnings = { fg = p.yellow },
        -- healthError = { fg = p.red },
        -- healthSuccess = { fg = p.green },
        -- healthWarning = { fg = p.yellow },
    }

    M.groups.toolbar = {
        TabLineFill   = { fg = p.normal.magenta, bg = p.normal.green },
        TabLineSel    = { fg = p.normal.magenta, bg = p.normal.green },
        ToolbarLine   = { fg = p.normal.magenta, bg = p.normal.green },
        ToolbarButton = { fg = p.normal.magenta, bg = p.normal.green, bold = true },
    }

    M.groups.common = {
        Type            = { fg = p.normal.cyan }, -- int, long, char, etc.
        StorageClass    = { link = 'Type' }, -- static, register, volatile, etc.
        Structure       = { link = 'Type' }, -- struct, union, enum, etc.
        Constant        = { fg = p.bright_fg_50.cyan }, -- any constant
        Comment         = { fg = p.gray_60, bg = 'NONE', italic = true }, -- italic comments
        Conditional     = { fg = p.bright.green,    bg = 'NONE', bold = true }, -- italic if, then, else, endif, switch, etc.
        Keyword         = { fg = p.normal.green,    bg = 'NONE', bold = true }, -- italic for, do, while, etc.
        Repeat          = { fg = p.bright.green,    bg = 'NONE', bold = true }, -- italic any other keyword
        Boolean         = { fg = p.normal_bright_50.green, bg = 'NONE' }, -- true , false
        Function        = { fg = p.bright.yellow,   bg = 'NONE', bold = true },
        Identifier      = { fg = 'NONE',            bg = 'NONE' }, -- any variable name
        String          = { fg = p.bright_fg_50.red, bg = 'NONE' }, -- Any string
        Character       = { fg = p.normal.yellow, bg = 'NONE' }, -- any character constant: 'c', '\n'
        Number          = { fg = p.mixed_bright.green_cyan }, -- a number constant: 5
        Float           = { fg = p.mixed_bright.green_cyan }, -- a floating point constant: 2.3e10
        Statement       = { fg = p.bright.green,    bg = 'NONE', bold = true }, -- any statement
        Label           = { fg = p.normal.yellow, bg = 'NONE' }, -- case, default, etc.
        Operator        = { fg = p.mixed_bright.red_yellow }, -- sizeof", "+", "*", etc.
        Exception       = { fg = p.bright.green,    bg = 'NONE', bold = true }, -- try, catch, throw
        PreProc         = { fg = p.gray_35 }, -- generic Preprocessor
        Include         = { fg = p.gray_45 }, -- preprocessor #include
        Define          = { fg = p.gray_35 }, -- preprocessor #define
        Macro           = { fg = p.normal.magenta }, -- same as Define
        Typedef         = { fg = p.normal.cyan }, -- A typedef
        PreCondit       = { fg = p.gray_35 }, -- preprocessor #if, #else, #endif, etc.
        Special         = { fg = p.normal.blue, bg = 'NONE' }, -- any special symbol
        SpecialChar     = { fg = p.normal.blue, bg = 'NONE' }, -- special character in a constant
        Tag             = { fg = p.normal.yellow }, -- you can use CTRL-] on this
        Delimiter       = { fg = p.gray_40 }, -- character that needs attention like , or .
        SpecialComment  = { fg = p.normal.blue }, -- special things inside a comment
        Debug           = { fg = p.normal.magenta }, -- debugging statements
        Underlined      = { fg = p.bright.cyan, bg = 'NONE', underline = true }, -- text that stands out, HTML links
        Ignore          = { fg = p.gray_40 }, -- left blank, hidden
        Error           = { fg = p.bright.red, bg = 'NONE', bold = true, underline = true }, -- any erroneous construct
        Todo            = { fg = p.normal.blue, bg = 'NONE', reverse = true, bold = true, italic = true }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    }

    M.groups.html = {
        htmlArg             = { fg = p.fg, bg = 'NONE', italic = true },
        htmlBold            = { fg = p.fg, bg = 'NONE', bold = true },
        htmlEndTag          = { fg = p.fg },
        htmlStyle           = { fg = p.normal.cyan, bg = 'NONE', italic = true },
        htmlLink            = { fg = p.bright.cyan, bg = 'NONE', underline = true },
        htmlSpecialChar     = { fg = p.bright.yellow },
        htmlSpecialTagName  = { fg = p.normal.blue, bold = true },
        htmlTag             = { fg = p.fg },
        htmlTagN            = { fg = p.bright.blue },
        htmlTagName         = { fg = p.bright.blue },
        htmlTitle           = { fg = p.fg },
        htmlH1              = { fg = p.normal.yellow,  bold = true },
        htmlH2              = { fg = p.normal.green,   bold = true },
        htmlH3              = { fg = p.normal.cyan,    bold = true },
        htmlH4              = { fg = p.normal.blue,    bold = true },
        htmlH5              = { fg = p.normal.magenta, bold = true },
    }

    M.groups.markdown = {
        markdownH1                = { fg = p.normal.yellow,  bold = true },
        markdownH2                = { fg = p.normal.green,   bold = true },
        markdownH3                = { fg = p.normal.cyan,    bold = true },
        markdownH4                = { fg = p.normal.blue,    bold = true },
        markdownH5                = { fg = p.normal.magenta, bold = true },
        markdownH6                = { fg = p.normal.red,     bold = true },
        markdownHeadingDelimiter  = { fg = p.gray_50 },
        markdownHeadingRule       = { fg = p.gray_50 },
        markdownId                = { fg = p.normal.cyan },
        markdownIdDeclaration     = { fg = p.normal.blue },
        markdownIdDelimiter       = { fg = p.normal.cyan },
        markdownLinkDelimiter     = { fg = p.normal.gray_50 },
        markdownLinkText          = { fg = p.bright.cyan, italic = true },
        markdownListMarker        = { fg = p.bright.yellow },
        markdownOrderedListMarker = { fg = p.bright.yellow },
        markdownRule              = { fg = p.gray_50 },
        markdownUrl               = { fg = p.bright.cyan, bg = 'NONE' },
        markdownBlockquote        = { fg = p.gray_50 },
        markdownBold              = { fg = p.fg, bg = 'NONE', bold = true },
        markdownItalic            = { fg = p.fg, bg = 'NONE', italic = true },
        markdownCode              = { fg = p.normal.magenta, bg = 'NONE' },
        markdownCodeBlock         = { fg = p.normal.magenta, bg = 'NONE' },
        markdownCodeDelimiter     = { fg = p.normal.magenta, bg = 'NONE' },
    }

    M.groups.diff = {
        -- Diff
        diffAdded     = { fg = p.bright.green },
        diffRemoved   = { fg = p.bright.red },
        diffChanged   = { fg = p.bright.blue },
        diffOldFile   = { fg = p.gray_40 },
        diffNewFile   = { fg = p.bright.fg },
        diffFile      = { fg = p.gray_50 },
        diffLine      = { fg = p.bright.cyan },
        diffIndexLine = { fg = p.bright.magenta },
        DiffAdd       = { fg = p.bright.green },     -- diff mode: Added line
        DiffChange    = { fg = p.bright.blue },      -- diff mode: Changed line
        DiffDelete    = { fg = p.bright.red },       -- diff mode: Deleted line
        DiffText      = { fg = p.fg },               -- diff mode: Changed text within a changed line
        -- Git signs
        GitSignsAdd      = { fg = p.normal.green },  -- diff mode: Added line |diff.txt|
        GitSignsAddNr    = { fg = p.normal.green },  -- diff mode: Added line |diff.txt|
        GitSignsAddLn    = { fg = p.normal.green },  -- diff mode: Added line |diff.txt|
        GitSignsChange   = { fg = p.normal.yellow }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeNr = { fg = p.normal.yellow }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeLn = { fg = p.normal.yellow }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete   = { fg = p.normal.red },    -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteNr = { fg = p.normal.red },    -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteLn = { fg = p.normal.red },    -- diff mode: Deleted line |diff.txt|
        GitSignsCurrentLineBlame = { fg = p.gray_20 }
    }

    M.groups.dashboard = {
        -- DashboardShortCut = { fg = p.red },
        -- DashboardHeader = { fg = p.magenta },
        -- DashboardCenter = { fg = p.blue },
        -- DashboardFooter = { fg = p.green, italic = true },
    }

    M.groups.treesitter = {
        ['@module']                           = { fg = p.bright.magenta, bold = true },

        ['@type.builtin']                     = { fg = p.normal.blue },

        ['@keyword.conditional']              = { link = 'Conditional' },
        ['@keyword.modifier']                 = { link = 'Conditional' },
        ['@keyword.repeat']                   = { link = 'Repeat' },
        ['@keyword.return']                   = { fg = p.normal.red, bold = true },
        ['@keyword.import']                   = { link = 'Include' },

        ['@variable']                         = { fg = p.fg },
        ['@variable.member']                  = { fg = p.bright_fg_50.blue },
        ['@variable.parameter']               = { fg = p.gray_50 },

        ['@comment']                          = { link = 'Comment' },
        ['@comment.doc']                      = { fg = p.gray_70 },

        ['@string.escape']                    = { link = 'Boolean' },

        ['@function.builtin']                 = { fg = p.mixed_bright.red_yellow },
        ['@function.macro']                   = { link = 'Macro' },

        ['@lsp.typemod.enumMember.readonly']  = { fg = p.mixed_bright_fg_25.green_cyan },
        ['@lsp.typemod.namespace']            = { link = '@module' },
        ['@lsp.typemod.variable.static']      = { fg = p.mixed_bright_fg_50.blue_magenta },
        ['@lsp.typemod.variable.globalScope'] = { link = '@lsp.typemod.variable.static' },
        ['@lsp.typemod.variable.readonly']    = { link = 'Constant' },
        ['@lsp.typemod.property.classScope']  = { link = '@variable.member' },
        ['@lsp.type.comment']                 = { link = 'Comment' },
        ['@lsp.type.parameter']               = { link = '@variable.parameter' },
        ['@lsp.type.keyword']                 = { link = 'Keyword' },
        ['@lsp.type.macro']                   = { link = 'Macro' },
        ['@lsp.mod.declaration']              = { bold = true },
    }

    M.groups.nvim_tree = {
        NvimTreeNormal              = { link = 'Normal' },
        NvimTreeIndentMarker        = { fg = p.gray_17 },

        NvimTreeImageFile           = { fg = p.fg },
        NvimTreeExecFile            = { fg = p.normal.blue },
        NvimTreeSpecialFile         = { fg = p.normal.magenta },
        NvimTreeOpenedFile          = { fg = p.normal.green },

        NvimTreeFolderName          = { fg = p.normal.yellow },
        NvimTreeRootFolder          = { fg = p.normal.blue, bold = true },
        NvimTreeEmptyFolderName     = { fg = p.gray02 },

        NvimTreeFolderIcon          = { fg = p.normal.yellow },
        NvimTreeOpenedFolderName    = { fg = p.bright.yellow, bold = true },
        NvimTreeOpenedFolderIcon    = { fg = p.bright.yellow },

        NvimTreeCutHL               = { fg = p.normal.red,   bold = true },
        NvimTreeCopiedHL            = { fg = p.normal.green, bold = true },

        NvimTreeGitDirty            = { fg = p.gray_50 },
        NvimTreeGitStaged           = { fg = p.normal.cyan },
        NvimTreeGitRenamed          = { fg = p.normal.yellow },
        NvimTreeGitNew              = { fg = p.normal.green },
        NvimTreeGitDeleted          = { fg = p.normal.red },
    }

    M.groups.diagnostic = {
        DiagnosticError          = { fg = p.normal.red },                                   -- base highlight group for "Error"
        DiagnosticWarn           = { fg = p.normal.yellow },                                -- base highlight group for "Warning"
        DiagnosticInfo           = { fg = p.normal.blue },                                  -- base highlight group from "Information"
        DiagnosticHint           = { fg = p.normal.cyan },                                  -- base highlight group for "Hint"
        DiagnosticUnderlineError = { fg = p.bg_normal_75.red,    undercurl = true, sp = p.normal.red },      -- used to underline "Error" diagnostics.
        DiagnosticUnderlineWarn  = { fg = p.bg_normal_75.yellow, undercurl = true, sp = p.normal.yellow },   -- used to underline "Warning" diagnostics.
        DiagnosticUnderlineInfo  = { fg = p.bg_normal_75.blue,   undercurl = true, sp = p.normal.blue },     -- used to underline "Information" diagnostics.
        DiagnosticUnderlineHint  = { fg = p.bg_normal_75.cyan,   undercurl = true, sp = p.normal.cyan },     -- used to underline "Hint" diagnostics.
    }

    M.groups.nvim_cmp = {
        CmpItemAbbrDeprecated = { fg = p.bg_normal_75.yellow, strikethrough = true },
        CmpItemAbbrMatch      = { fg = p.mixed_bright_fg_50.green_cyan },
        CmpItemAbbrMatchFuzzy = { fg = p.mixed_bright_fg_50.red_yellow },
        CmpItemKindVariable   = { fg = p.bright_fg_50.blue },
        CmpItemKindInterface  = { fg = p.bright_fg_50.green },
        CmpItemKindText       = { fg = p.bright_fg_50.yellow },
        CmpItemKindFunction   = { fg = p.bright_fg_50.magenta },
        CmpItemKindMethod     = { fg = p.bright_fg_50.cyan },
        CmpItemKindKeyword    = { fg = p.bright_fg_50.green },
        CmpItemKindProperty   = { fg = p.mixed_bright_fg_50.magenta_red },
        CmpItemKindUnit       = { fg = p.mixed_bright_fg_50.yellow_green },
    }

    M.groups.buffer_line = {
        BufferLineIndicatorSelected = { fg = p.normal_bright_50.blue },
        BufferLineFill              = { bg = p.gray_n05 },
        -- BufTabLineCurrent           = { fg = p.normal.magenta, fg = p.normal.green },
        -- BufTabLineActive            = { fg = p.normal.magenta, fg = p.normal.green },
        -- BufTabLineHidden            = { fg = p.normal.magenta, fg = p.normal.green },
        -- BufTabLineFill              = { fg = p.normal.magenta, fg = p.normal.green },
    }

    M.groups.whichkey = {
        WhichKey          = { fg = p.bright.magenta },
        WhichKeyGroup     = { fg = p.bright.yellow, italic = true },
        WhichKeyDesc      = { fg = p.bright.blue },
        WhichKeySeperator = { fg = p.gray_50 },
        WhichKeyFloating  = { bg = p.gray_10 },
        WhichKeyFloat     = { bg = p.gray_10 },
    }

    M.groups.groups = {
        -- -- highlight groups for the native LSP client
        -- LspReferenceText = { fg = p.bg, bg = p.magenta }, -- used for highlighting "text" references
        -- LspReferenceRead = { fg = p.bg, bg = p.magenta }, -- used for highlighting "read" references
        -- LspReferenceWrite = { fg = p.bg, bg = p.magenta }, -- used for highlighting "write" references
        -- -- Diagnostics (old)
        -- LspDiagnosticsDefaultError = { fg = p.red }, -- used for "Error" diagnostic virtual text
        -- LspDiagnosticsSignError = { fg = p.red }, -- used for "Error" diagnostic signs in sign column
        -- LspDiagnosticsFloatingError = { fg = p.red, bold = true }, -- used for "Error" diagnostic messages in the diagnostics float
        -- LspDiagnosticsVirtualTextError = { fg = p.red, bold = true }, -- Virtual text "Error"
        -- LspDiagnosticsUnderlineError = { fg = p.red, undercurl = true, sp = p.red }, -- used to underline "Error" diagnostics.
        -- LspDiagnosticsDefaultWarning = { fg = p.yellow }, -- used for "Warning" diagnostic signs in sign column
        -- LspDiagnosticsSignWarning = { fg = p.yellow }, -- used for "Warning" diagnostic signs in sign column
        -- LspDiagnosticsFloatingWarning = { fg = p.yellow, bold = true }, -- used for "Warning" diagnostic messages in the diagnostics float
        -- LspDiagnosticsVirtualTextWarning = { fg = p.yellow, bold = true }, -- Virtual text "Warning"
        -- LspDiagnosticsUnderlineWarning = { fg = p.yellow, undercurl = true, sp = p.yellow }, -- used to underline "Warning" diagnostics.
        -- LspDiagnosticsDefaultInformation = { fg = p.blue }, -- used for "Information" diagnostic virtual text
        -- LspDiagnosticsSignInformation = { fg = p.blue }, -- used for "Information" diagnostic signs in sign column
        -- LspDiagnosticsFloatingInformation = { fg = p.blue, bold = true }, -- used for "Information" diagnostic messages in the diagnostics float
        -- LspDiagnosticsVirtualTextInformation = { fg = p.blue, bold = true }, -- Virtual text "Information"
        -- LspDiagnosticsUnderlineInformation = { fg = p.blue, undercurl = true, sp = p.blue }, -- used to underline "Information" diagnostics.
        -- LspDiagnosticsDefaultHint = { fg = p.cyan }, -- used for "Hint" diagnostic virtual text
        -- LspDiagnosticsSignHint = { fg = p.cyan }, -- used for "Hint" diagnostic signs in sign column
        -- LspDiagnosticsFloatingHint = { fg = p.cyan, bold = true }, -- used for "Hint" diagnostic messages in the diagnostics float
        -- LspDiagnosticsVirtualTextHint = { fg = p.cyan, bold = true }, -- Virtual text "Hint"
        -- LspDiagnosticsUnderlineHint = { fg = p.cyan, undercurl = true, sp = p.cyan }, -- used to underline "Hint" diagnostics.
        -- -- Plugins highlight groups
        -- -- LspTrouble
        -- LspTroubleText = { fg = p.gray04 },
        -- LspTroubleCount = { fg = p.magenta, bg = p.gray03 },
        -- LspTroubleNormal = { fg = p.fg, bg = p.bg },
        -- -- Telescope
        -- TelescopeSelectionCaret = { fg = 'NONE', bg = p.gray02 },
        -- TelescopeBorder = { fg = p.gray02 },
        -- TelescopePromptBorder = { fg = p.blue },
        -- TelescopeResultsBorder = { fg = p.gray02 },
        -- TelescopePreviewBorder = { fg = p.gray02 },
        -- TelescopeMatching = { fg = p.yellow },
        -- TelescopePromptPrefix = { fg = p.blue },
        -- -- Ale-vim
        -- ALEError = { fg = p.red },
        -- ALEWarning = { fg = p.yellow },
        -- ALEInfo = { fg = p.blue },
        -- ALEErrorSign = { fg = p.red },
        -- ALEWarningSign = { fg = p.yellow },
        -- ALEInfoSign = { fg = p.blue },
        -- ALEVirtualTextError = { fg = p.red },
        -- ALEVirtualTextWarning = { fg = p.yellow },
        -- ALEVirtualTextInfo = { fg = p.blue },
        -- -- LspSaga
        -- LspSagaFinderSelection = { fg = p.magenta },
        -- LspSagaLspFinderBorder = { fg = p.gray05 },
        -- LspFloatWinNormal = { bg = p.bg },
        -- LspFloatWinBorder = { fg = p.gray05 },
        -- LspSagaBorderTitle = { fg = p.gray07 },
        -- TargetWord = { fg = p.cyan },
        -- ReferencesCount = { fg = p.gray07 },
        -- DefinitionCount = { fg = p.gray07 },
        -- TargetFileName = { fg = p.blue },
        -- DefinitionIcon = { fg = p.gray07 },
        -- ReferencesIcon = { fg = p.gray07 },
        -- ProviderTruncateLine = { fg = p.gray05 },
        -- SagaShadow = { fg = p.gray05 },
        -- DiagnosticTruncateLine = { fg = p.gray05 },
        -- DiagnosticWarning = { fg = p.red },
        -- DiagnosticInformation = { fg = p.blue },
        -- DefinitionPreviewTitle = { fg = p.gray07 },
        -- LspSagaShTruncateLine = { fg = p.gray05 },
        -- LspSagaDocTruncateLine = { fg = p.gray05 },
        -- LspSagaCodeActionTitle = { fg = p.gray07 },
        -- LspSagaCodeActionTruncateLine = { fg = p.gray05 },
        -- LspSagaCodeActionContent = { fg = p.magenta },
        -- LspSagaRenamePromptPrefix = { fg = p.green },
        -- LspSagaRenameBorder = { fg = p.gray05 },
        -- LspSagaHoverBorder = { fg = p.gray05 },
        -- LspSagaSignatureHelpBorder = { fg = p.gray05 },
        -- LspSagaCodeActionBorder = { fg = p.gray05 },
        -- LspSagaAutoPreview = { fg = p.gray07 },
        -- LspSagaDefPreviewBorder = { fg = p.gray05 },
        -- LspLinesDiagBorder = { fg = p.gray05 },
        -- LspSagaLightBulb = { fg = p.gray07 },
        -- LspSagaLightBulbSign = { fg = p.gray07 },
        -- LspSagaDiagnosticBorder = { fg = p.gray05 },
        -- LspSagaDiagnosticHeader = { fg = p.gray07 },
        -- LspSagaDiagnosticTruncateLine = { fg = p.gray05 },
        -- -- Sneak
        -- Sneak = { fg = p.bg, bg = p.blue },
        -- SneakScope = { bg = p.gray04 },
        -- -- Indent Blankline
        -- IndentBlanklineChar = { fg = p.indentGuideBg },
        -- IndentBlanklineContextChar = { fg = p.indentGuideActiveBg },
        -- -- mini.nvim
        -- MiniStatuslineModeNormal = { fg = p.bg, bg = p.normalMode },
        -- MiniStatuslineModeInsert = { fg = p.bg, bg = p.insertMode },
        -- MiniStatuslineModeVisual = { fg = p.bg, bg = p.visualMode },
        -- MiniStatuslineModeReplace = { fg = p.bg, bg = p.yellow },
        -- MiniStatuslineModeCommand = { fg = p.bg, bg = p.green },
        -- MiniStatuslineModeOther = { fg = p.gray05, bg = p.gray01 },
        -- MiniStatuslineDevInfo = { fg = p.fg, bg = p.gray02 },
        -- MiniStatuslineFilename = { fg = p.fg, bg = p.gray01 },
        -- MiniStatuslineFileinfo = { fg = p.fg, bg = p.gray02 },
        -- MiniStatuslineInactive = { fg = p.gray05, bg = p.gray01 },
        -- MiniTablineCurrent = { fg = p.bg, bg = p.cyan },
        -- MiniTablineVisible = { fg = p.bg, bg = p.magenta },
        -- MiniTablineHidden = { fg = p.gray05, bg = p.gray02 },
        -- MiniTablineModifiedCurrent = { fg = p.bg, bg = p.cyan },
        -- MiniTablineModifiedVisible = { fg = p.bg, bg = p.magenta },
        -- MiniTablineModifiedHidden = { fg = p.gray05, bg = p.gray02 },
        -- MiniTablineFill = { bg = p.gray01 },
        -- MiniCursorword = { underline = true },
        -- MiniSurround = { underline = true },
        -- MiniTrailspace = { bg = p.red },
        -- MiniCompletionActiveParameter = { underline = true },
        -- MiniJump = { reverse = true },
        -- MiniStarterCurrent = { fg = p.cyan },
        -- MiniStarterFooter = { fg = p.gray07 },
        -- MiniStarterHeader = { fg = p.blue },
        -- MiniStarterInactive = { fg = p.gray07 },
        -- MiniStarterItem = { fg = p.fg, bg = p.gray01 },
        -- MiniStarterItemBullet = { bg = p.gray01 },
        -- MiniStarterItemPrefix = { underline = true },
        -- MiniStarterSelection = { fg = p.magenta },
        -- MiniStarterQuery = { fg = p.magenta },
        -- -- Custom highlight groups for use in statusline plugins
        -- StatusLineNormalMode = { fg = p.black, bg = p.gray02 },
        -- StatusLineInsertMode = { fg = p.black, bg = p.gray03 },
        -- StatusLineVisualMode = { fg = p.black, bg = p.gray04 },
        -- StatusLineReplaceMode = { fg = p.black, bg = p.gray05 },
        -- StatusLineTerminalMode = { fg = p.black, bg = p.gray05 },
        -- StatusLineHint = { fg = p.blue, bg = p.gray01 },
        -- StatusLineInfo = { fg = p.green, bg = p.gray01 },
        -- StatusLineWarn = { fg = p.yellow, bg = p.gray01 },
        -- StatusLineError = { fg = p.red, bg = p.gray01 },
        -- -- Hydra
        -- HydraRed = { fg = p.red },
        -- HydraBlue = { fg = p.blue },
        -- HydraAmaranth = { fg = p.red },
        -- HydraTeal = { fg = p.cyan },
        -- HydraPink = { fg = p.magenta },
        -- HydraHint = { fg = p.fg, bg = p.gray02 },
        -- -- JSON
        -- jsonNumber = { fg = p.yellow },
        -- jsonNull = { fg = p.black },
        -- jsonString = { fg = p.green },
        -- jsonKeyword = { fg = p.blue },
    }

    M.groups.rainbow = {
        MyBracket1 = { fg = p.bright.green },
        MyBracket2 = { fg = p.bright.yellow },
        MyBracket3 = { fg = p.mixed_bright.green_cyan },
    }

    M.groups.indent_blank_line = {
        ['@ibl.indent.char.1'] = { fg = M.p.gray_20 },
        ['@ibl.scope.char.1']  = { fg = M.p.gray_20 },
    }
end

function create_lualine_theme(p)
    M.lualine = {
        normal = {
            a = { fg = p.fg, bg = p.bg_normal_75.green, gui = 'bold' },
            b = { fg = p.fg, bg = p.gray_10},
            c = { fg = p.fg, bg = p.gray_n03 }
        },
        insert = {
            a = { fg = p.fg, bg = p.bg_normal_75.yellow, gui = 'bold' },
            b = { fg = p.fg, bg = p.gray_10},
            c = { fg = p.fg, bg = p.gray_n03 }
        },
        visual = {
            a = { fg = p.fg, bg = p.bg_normal_75.blue, gui = 'bold' },
            b = { fg = p.fg, bg = p.gray_10},
            c = { fg = p.fg, bg = p.gray_n03 }
        },
        replace = {
            a = { fg = p.fg, bg = p.bg_normal_75.red, gui = 'bold' },
            b = { fg = p.fg, bg = p.gray_10},
            c = { fg = p.fg, bg = p.gray_n03 }
        },
        command = {
            a = { fg = p.fg, bg = p.bg_normal_75.magenta, gui = 'bold' },
            b = { fg = p.fg, bg = p.gray_10},
            c = { fg = p.fg, bg = p.gray_n03 }
        },
        inactive = {
            a = { fg = p.fg, bg = p.gray_50, gui = 'bold' },
            b = { fg = p.fg, bg = p.gray_10},
            c = { fg = p.fg, bg = p.gray_n03 }
        }
    }
end

-------------------------------------------------------------------------------

M.set_palette = function(palette)
    M.p = palette
end

M.set_colorscheme = function()
    if vim.g.colors_name then
        vim.cmd.hi("clear")
    end
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "nova_cs_theme_example"

    create_groups(M.p)
    create_lualine_theme(M.p)

    for _, group in pairs(M.groups) do
        apply_groups(group)
    end

    -- Apply neovim terminal colors
    vim.g.terminal_color_0 =  M.bg
    vim.g.terminal_color_1 =  M.p.normal.red
    vim.g.terminal_color_2 =  M.p.normal.green
    vim.g.terminal_color_3 =  M.p.normal.yellow
    vim.g.terminal_color_4 =  M.p.normal.blue
    vim.g.terminal_color_5 =  M.p.normal.magenta
    vim.g.terminal_color_6 =  M.p.normal.cyan
    vim.g.terminal_color_7 =  M.p.gray80
    vim.g.terminal_color_8 =  M.p.gray05
    vim.g.terminal_color_9 =  M.p.bright.red
    vim.g.terminal_color_10 = M.p.bright.green
    vim.g.terminal_color_11 = M.p.bright.yellow
    vim.g.terminal_color_12 = M.p.bright.blue
    vim.g.terminal_color_13 = M.p.bright.magenta
    vim.g.terminal_color_14 = M.p.bright.cyan
    vim.g.terminal_color_15 = M.p.fg
end

return M
