# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

CHAM (Classical Han with Annotations Markup) is a specification for a structured markup format used to encode classical Chinese texts with annotations. The repository produces a specification document deployed to GitHub Pages at https://www.hanalogy.org/cham-format/.

The canonical spec source is `cham-spec.adoc` — a ~1500-line AsciiDoc document covering: file structure, text blocks, inline markers, annotation entries/sections/layers, multi-file relationships, registries, processing pipeline, round-trip equivalence, and complete examples.

## Current state

The repo is mid-transition from a Vue+Vite site to an AsciiDoc-based build:
- The committed `package.json`, `src/`, and Vite config represent the original Vue site (deleted from working tree but still in git)
- `cham-spec.adoc` is the new canonical source (untracked in working tree)
- `TODO.coradoc-fix/` tracks known issues with the coradoc AsciiDoc→HTML pipeline (untracked)
- The GitHub Actions workflow (`.github/workflows/deploy.yml`) still runs `npm ci && npm run build` — this will need updating once the AsciiDoc pipeline is ready

## Build commands (Vue site, still in git)

```
npm ci
npm run dev          # dev server
npm run build        # production build → dist/
npm run preview      # preview production build
```

## Architecture

Single-file specification. The spec defines:
- `.cham.md` file format (Markdown + YAML frontmatter)
- Inline markers `{N}` / `{/N}` for annotation targets (supporting overlapping and nested ranges)
- Annotation entries with kinds (pron, meaning, person, place, event, etc.) — open enumeration
- Multi-file mode (main file + subordinate annotation files sharing a marker table)
- Three-layer annotation architecture (base text, contributor annotations, global lexicon)
- YAML registries for authors, places, events, dynasties, eras, sexagenary dates

## TODO.coradoc-fix

Documents 8 known bugs in the coradoc AsciiDoc parser that prevent `cham-spec.adoc` from compiling correctly. Priority order: page break parsing → table row grouping → LineBreak leak → remaining issues. Written in Chinese.
