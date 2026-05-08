<template>
  <section id="multi-file" class="spec-section">
    <h2>10. Multi-file Relationships</h2>

    <p>
      Complex texts with multiple annotation layers (e.g., classical commentaries from different
      traditions) can distribute annotations across multiple files, all sharing a common marker table.
    </p>

    <h3>10.1 Main File</h3>

    <p>The main file is identified by the absence of a <code>base</code> field in its frontmatter. It:</p>
    <ul>
      <li>Contains the text content with inline markers</li>
      <li>May contain its own annotation entries</li>
      <li>Defines the marker table used by all subordinate files in the same piece folder</li>
    </ul>

    <h3>10.2 Subordinate File</h3>

    <p>
      A subordinate file is identified by the presence of a <code>base</code> field in its frontmatter.
      It:
    </p>
    <ul>
      <li>Does <strong>not</strong> contain text content or inline markers</li>
      <li>Contains only annotation entries that reference the main file's marker IDs</li>
      <li>Has its own contributor, date, and nature metadata</li>
    </ul>

    <h3>10.3 Merge Rules</h3>

    <p>When processing a piece folder, a parser <strong>shall</strong>:</p>

    <ol>
      <li>Load the main file and build the marker table (marker ID → text block + offset + length)</li>
      <li>Load all other <code>*.cham.md</code> files in the same directory that contain a <code>base</code> field</li>
      <li>For each subordinate file, resolve its annotation entries against the main file's marker table</li>
      <li>Merge all annotations. Section names <strong>shall not</strong> be duplicated across files</li>
    </ol>

    <h3>10.4 Usage Patterns</h3>

    <h4>10.4.1 Single-file Mode</h4>
    <p>
      For simple texts (individual poems, short prose), all annotations reside in
      <code>text.cham.md</code> using annotation sections to separate layers. This is the
      simplest mode and requires only one file.
    </p>

    <h4>10.4.2 Multi-file Mode</h4>
    <p>
      For complex texts (classical works with multiple commentaries), each annotation layer is
      stored in a separate subordinate file. This mode provides clear attribution and enables
      independent editing of each layer.
    </p>

    <div class="example-block">
      <span class="example-label">Example: Multi-file piece folder</span>
      <div class="example-content">
        <pre><code>content/老子/01_第一章/
  text.cham.md            # Main: text + inline markers + editor annotations
  wangbi.cham.md          # Wang Bi's commentary (base: text.cham.md)
  modern-trans.cham.md    # Modern translation (base: text.cham.md)</code></pre>
      </div>
    </div>

    <p>
      Both modes are fully compatible in syntax. The only difference is file organization.
      A single-file piece with multiple <code>##</code> sections and a multi-file piece with
      separate files produce equivalent structured data.
    </p>
  </section>
</template>
