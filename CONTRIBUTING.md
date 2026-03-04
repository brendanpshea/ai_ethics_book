# Contributing Guide

Thanks for contributing to the Computing and AI Ethics book.

## Scope

- Keep changes focused and chapter-relevant.
- Prefer incremental pull requests over very large mixed changes.
- Follow authoring and style standards in `templates/markdown-standards.md`.

## Writing Conventions

- Use the chapter structure from `templates/chapter-template.md`.
- Keep subsection titles in question form when possible.
- Target 500–800 words per subsection.
- Use standardized callout blocks (`learning-outcomes`, `section-question`, etc.).

## Citations and Sources

- Add references manually to `refs/references.bib`.
- Cite in markdown with `@citationKey`.
- Verify every citation key resolves to a real `.bib` entry.
- Do not include fabricated citations, quotes, or page numbers.

## Mermaid, Images, and Tables

- Mermaid diagrams must use:
  - `<figure class="mermaid-figure">`
  - `<pre class="mermaid"> ... </pre>`
  - `<figcaption>...</figcaption>`
- Place open-license images in `assets/images/open-license/`.
- Record source and license in `assets/images/open-license/ATTRIBUTIONS.md`.
- Use markdown tables with `Table: ...` captions (no manual inline table styling).

## Build and Preview

### Local setup

```bash
npm install
chmod +x scripts/*.sh tools/*.sh
```

### Validate before PR

```bash
npm run lint
npm run build:html
npm run build:epub
```

### Preview in Codespaces

```bash
python3 -m http.server 8000 --directory dist
```

Open port `8000` and visit `/index.html`.

## Pre-PR Checklist

- [ ] `npm run lint` passes.
- [ ] `npm run build:html` succeeds and output looks correct in `dist/index.html`.
- [ ] `npm run build:epub` succeeds (if chapter/content changed).
- [ ] New citations are added to `refs/references.bib` and render correctly.
- [ ] New Mermaid diagrams render without syntax errors.
- [ ] New open-license images are listed in `assets/images/open-license/ATTRIBUTIONS.md`.
- [ ] Tables include captions using `Table: ...`.
- [ ] `chapters/00-contents.md` is updated if structure changed.
- [ ] Documentation is updated if workflow/build behavior changed.

## Commit and PR Notes

- Use clear commit messages describing educational/content intent.
- Mention substantive AI assistance in commit messages when used.
- In PR descriptions, include:
  - What changed
  - Why it changed
  - How it was validated (`lint`, `build:html`, `build:epub`)
