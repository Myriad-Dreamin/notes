# Notes

My personal notes, powered by [typst](https://github.com/typst/typst).

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

The `blog-tags` index is defined in [`content/article/blog-tags.typ`](./typ/templates/mod.typ#L14) to ensure type safety. You can add your own tags by adding a new `notes-tags` index.

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
