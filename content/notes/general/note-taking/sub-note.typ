#import "/typ/templates/note.typ": *
#show: main-zh.with(
  title: "Index and References",
  desc: [Notes about index and references.],
  date: "2025-09-03",
  tags: (),
)

= 索引 <note-taking:index>

JavaScript脚本可访问到站内的笔记图谱信息。

= 站内交叉引用 <note-taking:cross-references>

typst会自动生成交叉引用表，你可以使用引用语法引用外部笔记，且语言服务器能帮助你正常补全此类语法。

```typ
@painting:philosophy[绘画哲学]
```

= 站外交叉引用 <note-taking:external-references>

typst默认支持bibliography引用，除此之外，还可以导入并引用其他笔记网站的索引。
