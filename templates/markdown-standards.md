# Markdown Authoring Standards

Use these patterns so CSS styling is applied consistently by class selectors.

## Required Structure per Chapter

1. `# Chapter NN: Title`
2. `## Learning Outcomes` with `::: {.learning-outcomes}`
3. `## Essential Question` with `::: {.essential-question}`
4. 5–8 subsection blocks, each as `## Section X: [Question?]`
5. Under each section heading, include `::: {.section-question}` with the question.
6. `## Case Study` with `::: {.case-study}`
7. `## Discussion Questions` with `::: {.discussion-questions}`
8. `## Summary` with `::: {.chapter-summary}`
9. Include distributed discussion prompts inside sections (not only at chapter end).
10. Include at least 1–3 in-section mini case studies where content naturally calls for application.

## Citation Rules

- Put references in `refs/references.bib`.
- Cite with Pandoc keys: `@key`.
- Use author-date CSL via `refs/chicago-author-date.csl`.

## Image Rules

- Place external open-license images in `assets/images/open-license/`.
- Track source + license for each external image in `assets/images/open-license/ATTRIBUTIONS.md`.
- Place original diagrams in `assets/images/diagrams/`.
- Place mermaid source in `assets/mermaid/`.
- Include attribution and license details near image usage or in chapter notes.
- Preferred figure pattern: `<figure><img ... /><figcaption>... attribution link ...</figcaption></figure>`.

## Mermaid Rules

- Author Mermaid diagrams using raw HTML blocks:
	- `<figure class="mermaid-figure">`
	- `<pre class="mermaid"> ...diagram... </pre>`
	- `<figcaption>...</figcaption>`
- Do not place Mermaid source in a normal `<div>` body, because markdown parsing can alter the syntax.

## Table Rules

- Use standard markdown tables (no manual inline table styling).
- Add captions with `Table: ...` directly after each table.

## Section Length Guidance

- Each subsection target length: 500–800 words.
- Keep subsection title in question form when possible.
- Use bulleted or numbered lists when they improve clarity, or to break up log blocks of text.
- Prefer source-anchored quotes (with attribution) for key historical or conceptual claims.
