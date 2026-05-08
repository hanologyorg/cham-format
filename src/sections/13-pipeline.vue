<template>
  <section id="pipeline" class="spec-section">
    <h2>13. Processing Pipeline</h2>

    <h3>13.1 Overview</h3>

    <p>
      A CHAM processing pipeline converts source files (CHAM documents + registries) into
      structured output suitable for consumption by front-end applications, databases, or other
      tools.
    </p>

    <div class="example-block">
      <span class="example-label">Pipeline overview</span>
      <div class="example-content">
        <pre><code>data/lexicon.yaml ─────────┐
                           │
content/                   │
  NNN_標題/ (pieces) ──────┤
    text.cham.md ──────────┤
    *.cham.md (sub files) ─┤
    *.md (prose) ──────────┤──→ CHAM Parser ──→ Merge ──→ JSON
  書籍/                    │                        │
    book.yaml ─────────────┤                        ↓
    NNN_篇章/ ─────────────┤                  cham.json
      text.cham.md ────────┤                  text.json
      *.cham.md ───────────┤                  authors.json
      *.md ────────────────┘                  metadata.json

data/authors.yaml ─────────┤
data/places.yaml ──────────┤
data/events.yaml ──────────┘</code></pre>
      </div>
    </div>

    <h3>13.2 Parse Steps</h3>

    <p>A conforming parser <strong>shall</strong> execute the following steps:</p>

    <ol>
      <li>
        <strong>Load global lexicon</strong> — parse <code>data/lexicon.yaml</code>
      </li>
      <li>
        <strong>Scan content directory</strong> — recursively traverse <code>content/</code>:
        <ul>
          <li>Directory containing <code>text.cham.md</code> → piece folder</li>
          <li>Directory containing <code>book.yaml</code> → book folder, recurse into subdirectories</li>
        </ul>
      </li>
      <li>
        <strong>Load book metadata</strong> — parse <code>book.yaml</code> if present, establishing the inheritance context
      </li>
      <li>
        <strong>Load main file</strong> (CHAM file without <code>base</code> field):
        <ol type="a">
          <li>Parse YAML frontmatter, merging inherited fields from <code>book.yaml</code></li>
          <li>Extract text blocks using blank-line semantics (§6)</li>
          <li>Parse inline markers <code>{N}</code>/<code>{/N}</code> → build marker table</li>
          <li>Strip markers to produce clean text</li>
        </ol>
      </li>
      <li>
        <strong>Load subordinate files</strong> (CHAM files with <code>base</code> field):
        <ol type="a">
          <li>Parse YAML frontmatter (including <code>base</code> reference)</li>
          <li>Parse annotation entries referencing the main file's marker table</li>
        </ol>
      </li>
      <li>
        <strong>Load plain Markdown files</strong> — parse auxiliary content (biographies, background, etc.)
      </li>
      <li>
        <strong>Apply global lexicon</strong>:
        <ol type="a">
          <li>Scan clean text for characters/words matching lexicon entries</li>
          <li>Create pronunciation annotation instances for each match</li>
          <li>If an inline <code>pron</code> exists at the same position, the inline annotation takes precedence</li>
        </ol>
      </li>
      <li>
        <strong>Merge and output</strong> — produce structured JSON output (§13.3)
      </li>
    </ol>

    <h3>13.3 Output Formats</h3>

    <p>The pipeline <strong>shall</strong> produce the following outputs:</p>

    <table class="spec-table">
      <thead>
        <tr><th>File</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr>
          <td><code>cham.json</code></td>
          <td>Complete CHAM structured data — pieces, annotations, marker tables. Preserves the full semantic model.</td>
        </tr>
        <tr>
          <td><code>text.json</code></td>
          <td>Flat format optimized for front-end consumption. Replaces genre-specific formats (e.g., <code>poems.json</code>).</td>
        </tr>
        <tr>
          <td><code>authors.json</code></td>
          <td>People registry in JSON format, derived from <code>authors.yaml</code>.</td>
        </tr>
        <tr>
          <td><code>metadata.json</code></td>
          <td>Book-level metadata, merged from all <code>book.yaml</code> files.</td>
        </tr>
      </tbody>
    </table>

    <h3>13.4 Error Handling</h3>

    <p>Parsers <strong>should</strong> produce informative error messages including:</p>
    <ul>
      <li>File path and line number where the error occurred</li>
      <li>The specific syntax rule that was violated</li>
      <li>A suggestion for fixing the error when possible</li>
    </ul>

    <p>For non-fatal issues (e.g., a subordinate file referencing a non-existent marker ID), parsers <strong>should</strong> emit warnings and skip the affected annotation rather than failing entirely.</p>
  </section>
</template>
