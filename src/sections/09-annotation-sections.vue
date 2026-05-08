<template>
  <section id="annotation-sections" class="spec-section">
    <h2>9. Annotation Sections</h2>

    <h3>9.1 Section Structure</h3>

    <p>
      A CHAM file may contain multiple annotation sections, each introduced by a <code>##</code>
      (Markdown level-2 heading). Each section represents a distinct annotation layer.
    </p>

    <p>All sections in a file share the same marker table — inline marker IDs are file-scoped, not section-scoped.</p>

    <div class="example-block">
      <span class="example-label">Example: Multiple annotation sections</span>
      <div class="example-content">
        <pre><code>## 注釋
( modern annotations )

## 王弼註
@contributor: A010
@role: annotator
@dynasty: 三國（魏）
@era: 正始
@era_year: 1
@iso: 240
@nature: commentary
( Wang Bi's annotations )

## 白話譯文
@contributor: A050
@role: translator
@nature: translation
( translation entries )</code></pre>
      </div>
    </div>

    <h3>9.2 Section Metadata</h3>

    <p>
      Metadata lines follow the section heading, using the <code>@key:value</code> syntax.
      They appear immediately after the <code>##</code> heading and continue until the first
      non-<code>@</code> line.
    </p>

    <table class="spec-table">
      <thead>
        <tr><th>Key</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr><td><code>@contributor</code></td><td>Contributor ID (references <code>authors.yaml</code>)</td></tr>
        <tr><td><code>@role</code></td><td>Role: <code>annotator</code> | <code>translator</code> | <code>editor</code></td></tr>
        <tr><td><code>@dynasty</code></td><td>Dynasty of the contributor</td></tr>
        <tr><td><code>@era</code></td><td>Era name (年號)</td></tr>
        <tr><td><code>@era_year</code></td><td>Year within the era</td></tr>
        <tr><td><code>@iso</code></td><td>ISO/CE year</td></tr>
        <tr><td><code>@nature</code></td><td>Nature of the annotation layer: <code>annotation</code> | <code>commentary</code> | <code>translation</code> | <code>exegesis</code> | <code>notes</code></td></tr>
      </tbody>
    </table>

    <h3>9.3 Default Section</h3>

    <p>
      The <code>## 注釋</code> section is the default annotation section. It <strong>may</strong>
      omit all metadata (defaulting to <code>nature: annotation</code>). All other sections
      <strong>should</strong> include at minimum <code>@contributor</code> and <code>@nature</code>.
    </p>

    <h3>9.4 Section Semantics</h3>

    <p>
      Annotation sections provide a way to organize annotations by source within a single file.
      They are distinct from multi-file annotation layers (§10), which use separate files.
      Both mechanisms use the same marker table and can coexist.
    </p>
  </section>
</template>
