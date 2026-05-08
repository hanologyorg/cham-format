<template>
  <section id="file-format" class="spec-section">
    <h2>5. CHAM File Format</h2>

    <h3>5.1 Overall Structure</h3>

    <p>A CHAM file consists of three parts in order:</p>

    <ol>
      <li><strong>YAML frontmatter</strong> — metadata delimited by <code>---</code></li>
      <li><strong>Text blocks with inline markers</strong> — the actual text content (main files only)</li>
      <li><strong>Annotation sections</strong> — one or more named groups of annotation entries</li>
    </ol>

    <div class="example-block">
      <span class="example-label">Example: Complete CHAM file structure</span>
      <div class="example-content">
        <pre><code>---
(YAML frontmatter)
---

(Text blocks with {N}...{/N} inline markers)

## 注釋
(Annotation entries)

## 王弼註
@contributor: A010
@role: annotator
@nature: commentary
(Annotation entries)</code></pre>
      </div>
    </div>

    <h3>5.2 Main File Frontmatter</h3>

    <p>A main file (no <code>base</code> field) <strong>shall</strong> include the following frontmatter:</p>

    <table class="spec-table">
      <thead>
        <tr><th>Field</th><th>Status</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr><td><code>id</code></td><td><span class="status-tag required">required</span></td><td>Piece identifier (number or string). Unique within its book folder.</td></tr>
        <tr><td><code>title</code></td><td><span class="status-tag required">required</span></td><td>Piece title (Chinese).</td></tr>
        <tr><td><code>contributors</code></td><td>conditional</td><td>List of contributors. Required unless inherited from <code>book.yaml</code>.</td></tr>
        <tr><td><code>date</code></td><td>conditional</td><td>Historical date. Required unless inherited from <code>book.yaml</code>.</td></tr>
        <tr><td><code>genre</code></td><td>conditional</td><td>One of: <code>poetry</code>, <code>prose</code>, <code>mixed</code>, <code>drama</code>. Required unless inherited.</td></tr>
      </tbody>
    </table>

    <h4>5.2.1 Contributors</h4>

    <p>Each contributor entry <strong>shall</strong> have:</p>
    <ul>
      <li><code>ref</code> — references an author ID in <code>authors.yaml</code> (e.g., <code>A001</code>)</li>
      <li><code>role</code> — one of: <code>author</code>, <code>editor</code>, <code>annotator</code>, <code>translator</code></li>
    </ul>

    <h4>5.2.2 Date</h4>

    <p>The <code>date</code> field supports the following sub-fields:</p>

    <table class="spec-table">
      <thead>
        <tr><th>Field</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr><td><code>dynasty</code></td><td>Dynasty name (e.g., <code>秦末</code>, <code>唐</code>)</td></tr>
        <tr><td><code>era</code></td><td>Era name (年號), e.g., <code>開元</code></td></tr>
        <tr><td><code>era_year</code></td><td>Year within the era (年號紀年)</td></tr>
        <tr><td><code>sexagenary</code></td><td>Sexagenary cycle year (天干地支), e.g., <code>甲子</code></td></tr>
        <tr><td><code>iso</code></td><td>ISO/CE year. Negative for BCE (no year 0).</td></tr>
        <tr><td><code>circa</code></td><td>Boolean. <code>true</code> indicates an approximate date.</td></tr>
      </tbody>
    </table>

    <div class="example-block">
      <span class="example-label">Example: Main file frontmatter</span>
      <div class="example-content">
        <pre><code>---
id: 1
title: 垓下歌
contributors:
  - ref: A001
    role: author
date:
  dynasty: 秦末
  circa: true
genre: poetry
---</code></pre>
      </div>
    </div>

    <h3>5.3 Subordinate File Frontmatter</h3>

    <p>A subordinate file <strong>shall</strong> include:</p>

    <table class="spec-table">
      <thead>
        <tr><th>Field</th><th>Status</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr><td><code>base</code></td><td><span class="status-tag required">required</span></td><td>Filename of the main file (typically <code>text.cham.md</code>)</td></tr>
        <tr><td><code>contributor</code></td><td><span class="status-tag required">required</span></td><td>Contributor ID (references <code>authors.yaml</code>)</td></tr>
        <tr><td><code>role</code></td><td><span class="status-tag required">required</span></td><td>Role: <code>annotator</code> | <code>translator</code> | <code>editor</code></td></tr>
        <tr><td><code>dynasty</code></td><td><span class="status-tag optional">optional</span></td><td>Dynasty of the contributor</td></tr>
        <tr><td><code>nature</code></td><td><span class="status-tag optional">optional</span></td><td>Nature of the annotation layer: <code>commentary</code> | <code>translation</code> | <code>annotation</code> | <code>exegesis</code> | <code>notes</code></td></tr>
      </tbody>
    </table>

    <div class="example-block">
      <span class="example-label">Example: Subordinate file frontmatter</span>
      <div class="example-content">
        <pre><code>---
base: text.cham.md
contributor: A010
role: annotator
dynasty: 三國（魏）
nature: commentary
---</code></pre>
      </div>
    </div>

    <h3>5.4 Content Body</h3>

    <p>
      The content body follows the frontmatter and consists of text blocks (§6), inline markers (§7),
      and annotation sections (§9). In a subordinate file, the content body contains only annotation
      sections — no text blocks or inline markers.
    </p>
  </section>
</template>
