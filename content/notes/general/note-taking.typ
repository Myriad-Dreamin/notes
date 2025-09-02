#import "/typ/templates/note.typ": *
#show: main-zh.with(
  title: "Painting",
  desc: [Notes about note-taking.],
  date: "2025-09-03",
  tags: (),
)

= 理念 <concept>

所有的笔记整体以树形结构组织。允许使用不同的切面重新阅读整个笔记，例如，X话题既属于A也属于B，有两种组织方式：

1. X话题单独分开成为一个文件：

```typ
X.typ
  = X topic <x-topic>
A.typ
  = A topic <a-topic>
  #include "X.typ"
B.typ
  = B topic <b-topic>
  #include "X.typ"
```

2. X话题主要属于A，并不单独成文：

```typ
A.typ
  = A topic <a-topic>
  == X topic <x-topic>
B.typ
  = B topic <b-topic>
  #remige(<x-topic>)
```

此时`x-topic`会自动附带标签：
```typ
The `x-topic` belongs to (or, is tagged by) `A` and `B`.
```

= 编辑支持 <editor>

只要支持editor插件和lsp扩展的编辑器，都可以用来写笔记。

- VS Code
- #link("https://github.dev/Myriad-Dreamin/notes/blob/main/content/notes/general/note-taking.typ")[github.dev]
- Neovim

辅助工具：

- LSP自带功能：`#remige, #remige`自动补全引用
- 补全特殊风格前缀：`x:y`
- 补全子文件，LSP自动补全`#remige($1, include $2)`

= 笔记的组织方式 <note-organization>

总的来说，按照树形结构组织笔记。

使用`.gitignore`配置私有笔记：

```typ
content
  .gitgnore // specify the private notes
  notes/..
```

提示：参考「branch-specific gitignore」以使用git VCS托管私有笔记。

== 子文件

设计`remige(to: none, find-content(content | label))`:
- default to is previous heading.

使用以下方式嵌入子笔记：

```typ
#include "path/to/note.typ"
```

使用以下方式保证子笔记的嵌套级别和```typ <my-topic>```的一致：

```typ
= My Topic <my-topic>
#include "path/to/note.typ"
等同于：
#remige(to: <my-topic>, include "path/to/note.typ")
等同于：
#remige(to: <my-topic>)[
  #include "path/to/note.typ"
]
等同于：
#remige(to: <my-topic>)[
  = 索引 <note-taking:index>
  ...
]
```

使用以下方式嵌入全局笔记：

```typ
#remige(include "path/to/note.typ")
```

= 页面构建

== 强嵌入与弱嵌入

默认所有嵌入都是尽可能是强嵌入。当嵌入关系成环时，会自动转换为弱嵌入。

- 话题在不同文件夹，子文件夹里对夫文件话题或其他文件夹的remige为弱嵌入。
- 同一个文件夹内的remige，嵌套层级更深的remige为弱嵌入。
- 同一嵌套层级的remige，话题第二次出现时为弱嵌入。

== 分类和标签

把话题视为图的结点。强嵌入的边被称为分类，弱嵌入的边被称为标签。

== 嵌入配置

当本笔记作为页面构建时，可以使用`regex`配置所有的remige为强嵌入。

```typ
#configure-remige-embedding(
  (true, ),
  // 等价于：
  (regex(".*"), true),
)
```

复杂配置：

```typ
#configure-remige-embedding(
  (path: "path/to/note.typ", label: regex(".*"), strong: true),
)
```

全局配置：

在`astro.config.mjs`中可以配置全局配置：

```js
export default defineConfig({
  remige: { embedding: false || true },
});
// 或复制配置：
export default defineConfig({
  remige: {
    embedding: [
      { in: "some-topic.typ", path: "path/to/note.typ", label: /.*/, strong: true },
    ],
  },
});
```

== 条件样式

条件样式控制remige的显示方式。以下配置表示，当话题属于A时，remige会默认显示。反之，remige会以其他样式显示,默认不显示：

```typ
#remige-if(belongs-to: <a-topic>)[
  When the X topic is about A, we observe that X has some special feature.
]
```

默认不显示：

```typ
#remige-if(else: (display: none), body)
```

显示为旁注：
```typ
#remige-if(else: (class: "footnote"), body)
```

优化：当`display`设置为`none`时，等价于：

```typ
#context if check-condition(belongs-to: <a-topic>) { body }
```

此时在编译`<b-topic>`为页面时，body不会在构建产物中。

== 页面产物

- 主页面（Index Page）：`content/index.typ`。
- 枝干页面（Stem Pages）：`content/notes`中的每个文件都被构建成一个页面，且其他话题都按以上方式决定强弱嵌入。
- 叶子页面（Leaf Pages）：每个话题会构建一个独立的页面，且其他话题都为弱嵌入。

= 索引和引用 <note-taking:index-and-references>

#remige(to: <note-taking:index-and-references>, include "note-taking/sub-note.typ")
