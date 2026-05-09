# CHAM — Classical Han with Annotations Markup

Structured markup format for encoding classical Chinese texts with annotations.

## Specification

The canonical spec is [`cham-spec.adoc`](cham-spec.adoc), an AsciiDoc document covering:

- File structure and naming conventions
- Text block semantics (blank-line rules)
- Inline markers `{N}`/`{/N}` (overlapping annotation targets)
- Annotation entries, sections, and layers
- Multi-file relationships (primary + subordinate files)
- YAML registries (authors, dynasties, eras, places, events)
- Processing pipeline and round-trip equivalence

## Implementations

| Repository | Description |
|------------|-------------|
| [hanology/cham-js](https://github.com/hanology/cham-js) | TypeScript toolchain (`@hanology/cham`) and site generator (`@hanology/cham-browser`) |

## Quick Example

```markdown
---
id: 1
title: 靜夜思
contributors:
  - ref: LBY
    role: author
date:
  dynasty: 唐
genre: poetry
---

床前{1}明月{/1}光，
疑是地上霜。

舉頭望{2}明月{/2}，
低頭思故鄉。

## 注釋

{1} meaning [明月][明亮的月光]
{2} meaning [望][抬頭看]
```

## License

MIT
