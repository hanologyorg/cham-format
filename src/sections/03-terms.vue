<template>
  <section id="terms" class="spec-section">
    <h2>3. Terms and Definitions</h2>

    <dl>
      <dt><strong>CHAM file</strong></dt>
      <dd>A text file with the <code>.cham.md</code> extension containing classical Chinese text, inline markers, and/or annotation entries. See <a href="#file-format">§5</a>.</dd>

      <dt><strong>main file</strong></dt>
      <dd>The primary CHAM file in a piece folder, containing the text content and inline markers. Identified by the absence of a <code>base</code> field in its frontmatter. Conventionally named <code>text.cham.md</code>. See <a href="#multi-file">§10</a>.</dd>

      <dt><strong>subordinate file</strong></dt>
      <dd>A CHAM file that references a main file via its <code>base</code> frontmatter field. It contains only annotation entries, referencing the main file's marker table. See <a href="#multi-file">§10</a>.</dd>

      <dt><strong>marker</strong></dt>
      <dd>A zero-width inline annotation reference point. Markers are expressed as <code>{N}</code> (opening) and <code>{/N}</code> (closing), where <code>N</code> is a positive integer. See <a href="#inline-markers">§7</a>.</dd>

      <dt><strong>marker table</strong></dt>
      <dd>The mapping from marker ID to the text block, character offset, and length of the marked range. Built by parsing a main file's inline markers.</dd>

      <dt><strong>text block</strong></dt>
      <dd>A contiguous unit of text delimited by blank lines. Text blocks are the primary content units in a CHAM file. See <a href="#text-blocks">§6</a>.</dd>

      <dt><strong>section</strong> (structural)</dt>
      <dd>A group of text blocks separated by two or more blank lines. Sections represent structural breaks such as stanzas, chapters, or paragraphs.</dd>

      <dt><strong>annotation entry</strong></dt>
      <dd>A single annotation that targets a specific position or range in the text. Composed of a target, a kind, optional parameters, and bracket-enclosed values. See <a href="#annotation-entries">§8</a>.</dd>

      <dt><strong>annotation section</strong></dt>
      <dd>A named group of annotation entries within a CHAM file, introduced by a <code>##</code> heading. See <a href="#annotation-sections">§9</a>.</dd>

      <dt><strong>annotation layer</strong></dt>
      <dd>An independent set of annotations from a specific contributor or tradition. Layers may come from different files (multi-file mode) or different annotation sections (single-file mode). See <a href="#annotation-layers">§11</a>.</dd>

      <dt><strong>annotation kind</strong></dt>
      <dd>The type of an annotation entry, expressed as a lowercase keyword (e.g., <code>pron</code>, <code>meaning</code>, <code>person</code>). The set of kinds is open and extensible. See <a href="#annotation-entries">§8</a>.</dd>

      <dt><strong>headword</strong></dt>
      <dd>The word or phrase being annotated, as it should be displayed in the annotation. May differ from the full text of the marked range. Expressed in square brackets before the annotation value.</dd>

      <dt><strong>offset</strong></dt>
      <dd>The zero-based character position within a text block, used to locate inline markers and annotation targets. Punctuation characters are counted; marker syntax itself is not. See <a href="#inline-markers">§7.3</a>.</dd>

      <dt><strong>registry</strong></dt>
      <dd>A structured YAML file that provides authoritative reference data for entities (authors, places, events, dynasties, etc.). See <a href="#registries">§12</a>.</dd>

      <dt><strong>global lexicon</strong></dt>
      <dd>A registry file (<code>lexicon.yaml</code>) that provides pronunciation data for characters and words across all texts. See <a href="#annotation-layers">§11</a>.</dd>

      <dt><strong>frontmatter</strong></dt>
      <dd>YAML metadata at the beginning of a CHAM file, delimited by <code>---</code> lines. Contains the document's ID, title, contributors, date, and genre.</dd>

      <dt><strong>piece folder</strong></dt>
      <dd>A directory containing the files for a single piece (poem, chapter, or other text unit). Identified by containing a <code>text.cham.md</code> file. See <a href="#file-structure">§4</a>.</dd>

      <dt><strong>book folder</strong></dt>
      <dd>A directory containing a <code>book.yaml</code> file and one or more piece subdirectories. Represents a multi-chapter work. See <a href="#file-structure">§4</a>.</dd>

      <dt><strong>round-trip equivalence</strong></dt>
      <dd>The property that parsing a CHAM document, serializing the result, and parsing again produces semantically identical structured data. See <a href="#round-trip">§14</a>.</dd>
    </dl>
  </section>
</template>

<style scoped>
dl {
  margin-bottom: 1rem;
}

dt {
  font-weight: 700;
  font-family: var(--font-serif);
  margin-top: 1.25rem;
  margin-bottom: 0.25rem;
  color: var(--color-text);
}

dd {
  margin-left: 1.5rem;
  margin-bottom: 0.5rem;
  color: var(--color-text-secondary);
}
</style>
