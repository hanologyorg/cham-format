<template>
  <section id="file-structure" class="spec-section">
    <h2>4. File Structure</h2>

    <p>
      CHAM files are organized within a <code>content/</code> directory. Each subdirectory is either a
      <strong>piece folder</strong> (containing one text) or a <strong>book folder</strong> (containing
      a multi-chapter work). Piece and book folders may coexist and nest.
    </p>

    <h3>4.1 Piece Folders</h3>

    <p>
      A piece folder represents a single independent text — a poem, an essay, or a chapter within a book.
      It is identified by the presence of a <code>text.cham.md</code> file.
    </p>

    <div class="example-block">
      <span class="example-label">Example: Independent pieces</span>
      <div class="example-content">
        <pre><code>content/
  001_垓下歌/
    text.cham.md
    author-brief.md
  002_大風歌/
    text.cham.md
  003_岳陽樓記/
    text.cham.md
    background.md
    analysis.md</code></pre>
      </div>
    </div>

    <h3>4.2 Book Folders</h3>

    <p>
      A book folder represents a multi-chapter work. It is identified by the presence of a
      <code>book.yaml</code> file and contains piece subdirectories for each chapter.
    </p>

    <div class="example-block">
      <span class="example-label">Example: Book with multiple chapters</span>
      <div class="example-content">
        <pre><code>content/
  老子/
    book.yaml
    01_第一章/
      text.cham.md
      wangbi.cham.md
      hesonggong.cham.md
    02_第二章/
      text.cham.md
      wangbi.cham.md</code></pre>
      </div>
    </div>

    <p>Book folders may be nested (volumes, parts):</p>

    <div class="example-block">
      <span class="example-label">Example: Nested book structure</span>
      <div class="example-content">
        <pre><code>content/
  詩經/
    book.yaml
    國風/
      book.yaml
      01_關雎/
        text.cham.md
      02_葛覃/
        text.cham.md
    小雅/
      book.yaml
      01_鹿鳴/
        text.cham.md</code></pre>
      </div>
    </div>

    <h3>4.3 book.yaml</h3>

    <p>
      The <code>book.yaml</code> file in a book folder provides book-level metadata. It enables
      <strong>inheritance</strong>: piece frontmatter may omit fields already provided by the nearest
      ancestor <code>book.yaml</code>.
    </p>

    <table class="spec-table">
      <thead>
        <tr><th>Field</th><th>Status</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr><td><code>id</code></td><td><span class="status-tag required">required</span></td><td>Globally unique book identifier</td></tr>
        <tr><td><code>title</code></td><td><span class="status-tag required">required</span></td><td>Book title (Chinese)</td></tr>
        <tr><td><code>title-en</code></td><td><span class="status-tag optional">optional</span></td><td>Book title (English)</td></tr>
        <tr><td><code>contributors</code></td><td><span class="status-tag optional">optional</span></td><td>List of contributors with <code>ref</code> and <code>role</code>. Inherited by pieces.</td></tr>
        <tr><td><code>date</code></td><td><span class="status-tag optional">optional</span></td><td>Historical date (dynasty, era, year). Inherited by pieces.</td></tr>
        <tr><td><code>genre</code></td><td><span class="status-tag optional">optional</span></td><td>Genre: <code>poetry</code> | <code>prose</code> | <code>mixed</code> | <code>drama</code>. Inherited by pieces.</td></tr>
        <tr><td><code>description</code></td><td><span class="status-tag optional">optional</span></td><td>Free-text description</td></tr>
      </tbody>
    </table>

    <div class="example-block">
      <span class="example-label">Example: book.yaml</span>
      <div class="example-content">
        <pre><code>id: laozi-boomian-a
title: 帛書老子 甲本
title-en: Book of Laozi on Silk, Version A
contributors:
  - ref: Laozi
    role: author
date:
  dynasty: 周
  circa: true
genre: prose
description: 馬王堆帛書老子甲本</code></pre>
      </div>
    </div>

    <h4>4.3.1 Inheritance Rules</h4>

    <p>
      When a piece frontmatter omits a field, the parser <strong>shall</strong> inherit it from the nearest
      ancestor <code>book.yaml</code>. If the piece frontmatter explicitly declares a field, the piece-level
      value takes precedence.
    </p>

    <p>Inheritable fields: <code>contributors</code>, <code>date</code>, <code>genre</code>.</p>

    <h3>4.4 Piece Folder File Manifest</h3>

    <table class="spec-table">
      <thead>
        <tr><th>File</th><th>Type</th><th>Required</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr><td><code>text.cham.md</code></td><td>CHAM main file</td><td><span class="status-tag required">required</span></td><td>Text + inline markers + annotations (see §5)</td></tr>
        <tr><td><code>*.cham.md</code> (other)</td><td>CHAM subordinate file</td><td><span class="status-tag optional">optional</span></td><td>Annotation layers (commentary, translation, etc.)</td></tr>
        <tr><td><code>author-brief.md</code></td><td>Markdown</td><td><span class="status-tag optional">optional</span></td><td>Author biography</td></tr>
        <tr><td><code>background.md</code></td><td>Markdown</td><td><span class="status-tag optional">optional</span></td><td>Historical background</td></tr>
        <tr><td><code>analysis.md</code></td><td>Markdown</td><td><span class="status-tag optional">optional</span></td><td>Literary appreciation</td></tr>
        <tr><td><code>follow-up.md</code></td><td>Markdown</td><td><span class="status-tag optional">optional</span></td><td>Extension activities</td></tr>
        <tr><td><code>think-questions.md</code></td><td>Markdown</td><td><span class="status-tag optional">optional</span></td><td>Discussion questions</td></tr>
        <tr><td><code>preparation.md</code></td><td>Markdown</td><td><span class="status-tag optional">optional</span></td><td>Teaching preparation</td></tr>
        <tr><td><code>custom-*.md</code></td><td>Markdown</td><td><span class="status-tag optional">optional</span></td><td>User-defined sections</td></tr>
      </tbody>
    </table>

    <h3>4.5 Naming Rules</h3>

    <ul>
      <li><strong>CHAM files</strong>: <code>*.cham.md</code> extension. The main file is conventionally <code>text.cham.md</code>. Subordinate files are named by contributor or purpose (e.g., <code>wangbi.cham.md</code>, <code>modern-trans.cham.md</code>).</li>
      <li><strong>Piece folders</strong>: <code>NNN_標題/</code> — a numeric prefix for sort order, followed by a human-readable short label. The prefix is independent of the frontmatter <code>id</code>.</li>
      <li><strong>Book folders</strong>: Free-form names (e.g., <code>老子/</code>, <code>論語/</code>). Numeric prefixes may be used for ordering (e.g., <code>01_大學/</code>).</li>
      <li><strong>Plain Markdown files</strong>: Standard <code>.md</code> extension. Not parsed as CHAM. See §4.4 for recognized names.</li>
    </ul>

    <h3>4.6 Plain Markdown Files</h3>

    <p>
      Author biographies, background essays, and teaching materials are plain <code>.md</code> files.
      They are editorial content and do not contain CHAM annotation markers. These files may optionally
      include YAML frontmatter with <code>title</code> and <code>subject</code> fields for semantic linking.
    </p>
  </section>
</template>
