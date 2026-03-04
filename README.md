# Computing and AI Ethics Book

This repository contains a web-first textbook project for late high school and early college readers.

## Project Goals

- Explain and apply key ethical concepts in computing and AI.
- Understand what is at stake in major AI ethics debates.
- Identify major thinkers and historical moments in IT ethics.
- Help readers articulate and defend their own ethical positions.

## Directory Structure

- `chapters/` — chapter markdown files.
- `refs/` — bibliography and CSL style files.
- `styles/` — textbook CSS.
- `assets/images/open-license/` — externally sourced open-license images.
- `assets/images/diagrams/` — original diagrams.
- `assets/images/photos/` — project photos.
- `assets/mermaid/` — mermaid diagram source files.
- `pandoc/` — Pandoc defaults and chapter ordering.
- `templates/` — chapter template and writing standards.
- `scripts/` — local build/lint scripts.
- `dist/` — generated output.

## Authoring Workflow

1. Keep `chapters/00-contents.md` up to date.
2. Draft each chapter in markdown using the chapter template in `templates/chapter-template.md`.
3. Add sources manually in `refs/references.bib`.
4. Cite in markdown with `@citationKey`.
5. Follow standardized callout blocks in `templates/markdown-standards.md`.

## Content Components

### Mermaid diagrams

Use this exact pattern in chapters:

```html
<figure class="mermaid-figure">
	<pre class="mermaid">
flowchart TD
		A --> B
	</pre>
	<figcaption>Figure X. Diagram caption.</figcaption>
</figure>
```

- Mermaid is initialized from `templates/mermaid-init.html` via `pandoc/html.yaml`.
- Diagram syntax is validated at runtime; invalid diagrams show an inline error box.
- Do **not** place Mermaid source in a normal `<div>` body, because markdown parsing can alter syntax.

### Open-license images

Use this pattern:

```html
<figure>
	<img src="assets/images/open-license/example.jpg" alt="Accessible alt text" />
	<figcaption>Figure X. Caption text. Full attribution: <a href="assets/images/open-license/ATTRIBUTIONS.md">Image attributions appendix</a>.</figcaption>
</figure>
```

- Store open-license images in `assets/images/open-license/`.
- Record source URL, creator, and license in `assets/images/open-license/ATTRIBUTIONS.md`.

### Tables

Write normal markdown tables plus a caption line:

```markdown
| Col A | Col B |
|---|---|
| A1 | B1 |

Table: Caption text for the table.
```

- Table styling is fully controlled by `styles/book.css`.

## Build Requirements

- Node.js 20+ (for markdown linting)
- Docker (used to run pinned Pandoc image `pandoc/core:3.5`)
- `curl` (used by CSL download helper)

## Setup

```bash
npm install
chmod +x scripts/*.sh tools/*.sh
```

## Commands

```bash
# lint all markdown
npm run lint

# build html textbook
npm run build:html

# build epub textbook
npm run build:epub

# lint + html build
npm run build
```

Generated files are written to `dist/`.
The HTML build generates a chunked web book (chapter-per-page with TOC/navigation), writes `dist/index.html` as the entrypoint, and copies `styles/book.css` to `dist/styles/book.css` (with `assets/` mirrored into `dist/assets/`).

## Preview in Codespaces

Recommended local preview:

```bash
python3 -m http.server 8000 --directory dist
```

Then open port `8000` in Codespaces and load `/index.html`.

## Troubleshooting

- No styling in preview: confirm `dist/styles/book.css` exists, then rebuild with `npm run build:html`.
- Missing images: confirm image files are under `assets/` and rebuild (build mirrors `assets` into `dist/assets`).
- Mermaid parse errors: use the `<pre class="mermaid">` pattern and check diagram syntax.
- Missing citations: confirm keys exist in `refs/references.bib` and rebuild.

## Chapter Ordering

Pandoc build order is controlled by `pandoc/chapter-order.txt`. Add new chapter files there as they are created.

## Citation Style

- CSL target: Chicago author-date (`refs/chicago-author-date.csl`).
- Bibliography file: `refs/references.bib`.
- CSL file is downloaded automatically on first build via `tools/download-csl.sh`.

## Publishing (GitHub Pages)

GitHub Actions workflow: `.github/workflows/pages.yml`.

On push to `main`, the workflow:

1. installs dependencies,
2. lints markdown,
3. builds chunked HTML with `dist/index.html` as the entrypoint,
4. publishes `dist/` to GitHub Pages.

## AI Use Transparency

See `POLICY_AI_USE.md` for required practices on AI-assisted drafting, verification, and citation integrity.

## Contributing

See `CONTRIBUTING.md` for contributor workflow, validation steps, and the pre-PR checklist.
