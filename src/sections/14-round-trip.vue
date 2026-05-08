<template>
  <section id="round-trip" class="spec-section">
    <h2>14. Round-trip Equivalence</h2>

    <h3>14.1 Guarantees</h3>

    <p>
      A CHAM document that is parsed into structured data and then serialized back to CHAM format
      <strong>shall</strong> produce output that is semantically equivalent to the input. That is,
      parsing the serialized output <strong>shall</strong> yield the same structured data as parsing
      the original input.
    </p>

    <p>Specifically, the following <strong>shall</strong> be preserved through a round trip:</p>

    <ul>
      <li>All annotation entries: <code>kind</code>, <code>params</code>, <code>headword</code>, <code>value</code></li>
      <li>Inline marker positions: text block index, character offset, and length</li>
      <li>Frontmatter field values</li>
      <li>Section metadata (<code>@key:value</code> entries)</li>
      <li>The plain text content (after stripping markers)</li>
    </ul>

    <h3>14.2 Non-Guarantees</h3>

    <p>The following <strong>may</strong> change through a round trip:</p>

    <ul>
      <li><strong>Whitespace quantity</strong> — the number of blank lines between sections, the indentation of YAML</li>
      <li><strong>Field order</strong> — the order of frontmatter fields or annotation entry parameters</li>
      <li><strong>YAML quoting style</strong> — the choice of single vs. double quotes vs. no quotes in frontmatter</li>
      <li><strong>Comments</strong> — inline comments in YAML frontmatter or in the text body are not preserved</li>
    </ul>

    <h3>14.3 Equivalence Rules</h3>

    <p>
      Two CHAM documents are considered <strong>semantically equivalent</strong> if, after parsing
      both into structured data, the following conditions hold:
    </p>

    <ol>
      <li>All annotation entries have matching <code>kind</code>, <code>params</code>, <code>headword</code>, and <code>value</code></li>
      <li>All inline markers map to the same text block, character offset, and length</li>
      <li>All frontmatter fields have matching values</li>
      <li>All section metadata entries match</li>
      <li>The clean text (with markers removed) is identical</li>
    </ol>
  </section>
</template>
