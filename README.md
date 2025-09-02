# Notes

My personal notes, powered by [typst](https://github.com/typst/typst).

## Early Access

This project is currently in the early access stage. In the short future, I will still focus on writing notes rather than designing and developing note websites or VS Code extensions.

目前仅处于构思阶段。在未来一段时间内，我还是以写笔记为主，而非设计和开发笔记网站或进行笔记 VS Code 扩展。

To preview the note site locally, use typst v0.13.1:

若想要本地预览，使用 typst v0.13.1:

```bash
typst watch content/notes/general/note-taking.typ --features html --input x-target=html --input x-preview="{}" --root . dist/test.html
```

To build the note content, check [CI](.github/workflows/gh-pages.yml) for more details.

若想要构建笔记页面，请参考 [CI](.github/workflows/gh-pages.yml) 。

## Features

- **Tags**: Categorize your notes with tags.
- **Search**: Search through your notes by "title", "description", or "tags".
- **Self-Host Fonts**: bundle and self-host fonts via `@fontsource-variable/inter`.
- **Link Preview**: Link Preview on Open Graph, Facebook, and Twitter.
- **SEO**: ARIA and Sitemap support.

Typst-specific features:

- Heading Permalinks and Table of Contents.
- PDF Archives.

## Commands

All commands are run from the root of the project, from a terminal:

| Command                | Action                                           |
| :--------------------- | :----------------------------------------------- |
| `pnpm install`         | Installs dependencies                            |
| `pnpm dev`             | Starts local dev server at `localhost:4321`      |
| `pnpm build`           | Build your production site to `./dist/`          |
| `pnpm preview`         | Preview your build locally, before deploying     |
| `pnpm astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `pnpm astro -- --help` | Get help using the Astro CLI                     |

## Editor Setup

### VS Code

Open using the default setting:

```bash
code .vscode/notes.code-workspace
```

Or customize it:

```bash
cp .vscode/notes.code-workspace .vscode/notes.private.code-workspace
code .vscode/notes.private.code-workspace
```

Install suggseted extensions:

- `myriad-dreamin.tinymist`, for writing notes in typst.
- `astro-build.astro-vscode`, for developing astro components.

### Official Web App

(Untested) [Start from GitHub](https://typst.app/) and open your notes repository. You should be able to write notes like you do in local.

## Writing

Create a new note in [`content/notes`:](./content/notes/)

```typ
#import "/typ/templates/notes.typ": *
#show: main.with(
  title: "Title of the note",
  desc: [This is a test note.],
  date: "2025-04-25",
  tags: (
    blog-tags.misc,
  ),
)
```

There is a sample note in [`content/notes/general/note-taking.typ`](content/notes/general/note-taking.typ).

## Deploying to GitHub Pages

1. Set the URL_BASE in [.env](./.env). If you would like to keep it in secret, please set it in either `.env.{production,development}` file in root or [Environments](../../settings/environments).
   - For a GitHub page `https://username.github.io/repo`, the URL base is `/repo/`.
1. Change Source's "Build and deployment" to "GitHub Actions" in [Page Settings](../../settings/pages).
1. Push your changes to the `main` branch and it will automatically deploy to GitHub Pages by [CI](.github/workflows/gh-pages.yml).

## Customization

- `.env`: Configuration read by files, Please check `defineConfig/env` in [astro.config.mjs](astro.config.mjs) for schema.
- [`src/consts.ts`](./src/consts.ts),[`src/components/BaseHead.astro`](./src/components/BaseHead.astro): global metadata, font resource declarations, and the head component.
- [`src/styles/*`](src/styles/): CSS styles.

## Todo

- [ ] Special website style for notes

## Credit

- This theme is based off of the lovely [Bear Blog.](https://github.com/HermanMartinus/bearblog/)
- The astro integration is supported by [astro-typst.](https://github.com/overflowcat/astro-typst)
- And, the lovely [typst.](https://github.com/typst/typst)
