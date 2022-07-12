const tokens = [
  {
    "name": "Comment",
    "scope": [
      "comment",
      "punctuation.definition.comment"
    ],
    "settings": {
      "fontStyle": "italic",
      "foreground": "#0088ff"
    }
  },
  {
    "name": "Constant",
    "settings": {
      "foreground": "#ff628c"
    }
  },
  {
    "name": "Entity",
    "settings": {
      "foreground": "#ffc600"
    }
  },
  {
    "name": "Invalid",
    "settings": {
      "foreground": "#f44542"
    }
  },
  {
    "name": "Storage Type Function",
    "settings": {
      "foreground": "#ff9d00"
    }
  },
  {
    "name": "Keyword",
    "settings": {
      "foreground": "#ff9d00"
    }
  },
  {
    "name": "Meta",
    "settings": {
      "foreground": "#9effff"
    }
  },
  {
    "name": "Meta JSX",
    "scope": [
      "meta.jsx.children",
      "meta.jsx.children.js",
      "meta.jsx.children.tsx"
    ],
    "settings": {
      "foreground": "#fff"
    }
  },
  {
    "name": "Meta Brace",
    "settings": {
      "foreground": "#e1efff"
    }
  },
  {
    "name": "Punctuation",
    "settings": {
      "foreground": "#e1efff"
    }
  },
  {
    "name": "Punctuation Parameters",
    "settings": {
      "foreground": "#ffee80"
    }
  },
  {
    "name": "Punctuation Template Expression",
    "settings": {
      "foreground": "#ffee80"
    }
  },
  {
    "name": "Storage",
    "settings": {
      "foreground": "#ffc600"
    }
  },
  {
    "name": "Storage Type Arrow Function",
    "settings": {
      "foreground": "#ffc600"
    }
  },
  {
    "name": "String",
    "scope": [
      "string",
      "punctuation.definition.string"
    ],
    "settings": {
      "foreground": "#a5ff90"
    }
  },
  {
    "name": "String Template",
    "scope": [
      "string.template",
      "punctuation.definition.string.template"
    ],
    "settings": {
      "foreground": "#3ad900"
    }
  },
  {
    "name": "Support",
    "settings": {
      "foreground": "#80ffbb"
    }
  },
  {
    "name": "Support Function",
    "settings": {
      "foreground": "#ff9d00"
    }
  },
  {
    "name": "Support Variable Property DOM",
    "settings": {
      "foreground": "#e1efff"
    }
  },
  {
    "name": "Variable",
    "settings": {
      "foreground": "#e1efff"
    }
  },
  {
    "name": "[CSS] - Entity",
    "scope": [
      "source.css entity",
      "source.stylus entity"
    ],
    "settings": {
      "foreground": "#3ad900"
    }
  },
  {
    "name": "[CSS] - ID Selector",
    "settings": {
      "foreground": "#FFB454"
    }
  },
  {
    "name": "[CSS] - Element Selector",
    "settings": {
      "foreground": "#9EFFFF"
    }
  },
  {
    "name": "[CSS] - Support",
    "scope": [
      "source.css support",
      "source.stylus support"
    ],
    "settings": {
      "foreground": "#a5ff90"
    }
  },
  {
    "name": "[CSS] - Constant",
    "scope": [
      "source.css constant",
      "source.css support.constant",
      "source.stylus constant",
      "source.stylus support.constant"
    ],
    "settings": {
      "foreground": "#ffee80"
    }
  },
  {
    "name": "[CSS] - String",
    "scope": [
      "source.css string",
      "source.css punctuation.definition.string",
      "source.stylus string",
      "source.stylus punctuation.definition.string"
    ],
    "settings": {
      "foreground": "#ffee80"
    }
  },
  {
    "name": "[CSS] - Variable",
    "scope": [
      "source.css variable",
      "source.stylus variable"
    ],
    "settings": {
      "foreground": "#9effff"
    }
  },
  {
    "name": "[HTML] - Entity Name",
    "settings": {
      "foreground": "#9effff"
    }
  },
  {
    "name": "[HTML] - ID value",
    "settings": {
      "foreground": "#A5FF90"
    }
  },
  {
    "name": "[HTML] - Entity Other",
    "settings": {
      "fontStyle": "italic",
      "foreground": "#ffc600"
    }
  },
  {
    "name": "[HTML] - Script Tag",
    "settings": {
      "foreground": "#ffc600"
    }
  },
  {
    "name": "[HTML] - Quotes. these are a slightly different colour because expand selection will then not include quotes",
    "settings": {
      "foreground": "#92fc79"
    }
  },
  {
    "name": "[INI] - Entity",
    "settings": {
      "foreground": "#e1efff"
    }
  },
  {
    "name": "[INI] - Keyword",
    "settings": {
      "foreground": "#ffc600"
    }
  },
  {
    "name": "[INI] - Punctuation Definition",
    "settings": {
      "foreground": "#ffee80"
    }
  },
  {
    "name": "[INI] - Punctuation Separator",
    "settings": {
      "foreground": "#ff9d00"
    }
  },
  {
    "name": "[JAVASCRIPT] - Storage Type Function",
    "settings": {
      "foreground": "#fb94ff"
    }
  },
  {
    "name": "[JAVASCRIPT] - Variable Language",
    "settings": {
      "foreground": "#fb94ff"
    }
  },
  {
    "name": "[JAVASCRIPT] - Inherited Component",
    "settings": {
      "foreground": "#ccc"
    }
  },
  {
    "name": "[PYTHON] - Self Argument",
    "settings": {
      "foreground": "#fb94ff"
    }
  },
  {
    "name": "[JSON] - Support",
    "settings": {
      "foreground": "#ffc600"
    }
  },
  {
    "name": "[JSON] - String",
    "scope": [
      "source.json string",
      "source.json punctuation.definition.string"
    ],
    "settings": {
      "foreground": "#e1efff"
    }
  },
  {
    "name": "[MARKDOWN] - Heading Punctuation",
    "settings": {
      "foreground": "#e1efff"
    }
  },
  {
    "name": "[MARKDOWN] - Heading Name Section",
    "scope": [
      "entity.name.section.markdown",
      "markup.heading.setext.1.markdown",
      "markup.heading.setext.2.markdown"
    ],
    "settings": {
      "foreground": "#ffc600",
      "fontStyle": "bold"
    }
  },
  {
    "name": "[MARKDOWN] - Paragraph",
    "settings": {
      "foreground": "#e1efff"
    }
  },
  {
    "name": "[MARKDOWN] - Quote Punctuation",
    "settings": {
      "foreground": "#ffc600"
    }
  },
  {
    "name": "[MARKDOWN] - Quote Paragraph",
    "settings": {
      "fontStyle": "italic",
      "foreground": "#9effff"
    }
  },
  {
    "name": "[MARKDOWN] - Separator",
    "settings": {
      "foreground": "#ffc600"
    }
  },
  {
    "name": "[MARKDOWN] - Emphasis Bold",
    "settings": {
      "fontStyle": "bold",
      "foreground": "#9effff"
    }
  },
  {
    "name": "[MARKDOWN] - Emphasis Italic",
    "settings": {
      "fontStyle": "italic",
      "foreground": "#9effff"
    }
  },
  {
    "name": "[MARKDOWN] - Lists",
    "settings": {
      "foreground": "#ffc600"
    }
  },
  {
    "name": "[MARKDOWN] - Link Title",
    "settings": {
      "foreground": "#a5ff90"
    }
  },
  {
    "name": "[MARKDOWN] - Link/Image Title",
    "scope": [
      "string.other.link.title.markdown",
      "string.other.link.description.markdown",
      "string.other.link.description.title.markdown"
    ],
    "settings": {
      "foreground": "#a5ff90"
    }
  },
  {
    "name": "[MARKDOWN] - Link Address",
    "scope": [
      "markup.underline.link.markdown",
      "markup.underline.link.image.markdown"
    ],
    "settings": {
      "foreground": "#9effff"
    }
  },
  {
    "name": "[MARKDOWN] - Inline Code",
    "scope": [
      "fenced_code.block.language",
      "markup.inline.raw.markdown"
    ],
    "settings": {
      "foreground": "#9effff"
    }
  },
  {
    "name": "[MARKDOWN] - Code Block",
    "scope": [
      "fenced_code.block.language",
      "markup.inline.raw.markdown"
    ],
    "settings": {
      "foreground": "#9effff"
    }
  },
  {
    "name": "[PUG] - Entity Name",
    "settings": {
      "foreground": "#9effff"
    }
  },
  {
    "name": "[PUG] - Entity Attribute Name",
    "settings": {
      "fontStyle": "italic"
    }
  },
  {
    "name": "[PUG] - String Interpolated",
    "settings": {
      "foreground": "#ffee80"
    }
  },
  {
    "name": "[TYPESCRIPT] - Entity Name Type",
    "settings": {
      "foreground": "#80ffbb"
    }
  },
  {
    "name": "[TYPESCRIPT] - Keyword",
    "settings": {
      "foreground": "#ffc600"
    }
  },
  {
    "name": "[TYPESCRIPT] - Punctuation Parameters",
    "settings": {
      "foreground": "#e1efff"
    }
  },
  {
    "name": "[TYPESCRIPT] - Punctuation Arrow Parameters",
    "settings": {
      "foreground": "#ffee80"
    }
  },
  {
    "name": "[PHP] - Entity",
    "settings": {
      "foreground": "#9effff"
    }
  },
  {
    "name": "[PHP] - Variables",
    "settings": {
      "foreground": "#ffc600"
    }
  },
  {
    "name": "[C#] - Annotations",
    "settings": {
      "foreground": "#9effff"
    }
  },
  {
    "name": "[C#] - Properties",
    "settings": {
      "foreground": "#9effff"
    }
  },
  {
    "name": "[C#] - Storage modifiers",
    "settings": {
      "foreground": "#80ffbb"
    }
  },
  {
    "name": "Italicsify for Operator Mono",
    "scope": [
      "modifier",
      "this",
      "comment",
      "storage.modifier",
      "entity.other.attribute-name.js",
      // "storage.modifier.js",
      // "storage.modifier.ts",
      // "storage.modifier.tsx",
      "entity.other.attribute-name.js",
      "entity.other.attribute-name.ts",
      "entity.other.attribute-name.tsx",
      "entity.other.attribute-name.html"
    ],
    "settings": {
      "fontStyle": "italic"
    }
  },
  {
    "name": "Export Default",
    "scope": [
      "keyword.control.export"
    ],
    "settings": {
      "foreground": "#ff9d00",
      "fontStyle": "italic"
    }
  },
  {
    "name": "[TYPESCRIPT] Returned Type",
    "settings": {
      "foreground": "#ff0088",
      "fontStyle": "italic"
    }
  },
]