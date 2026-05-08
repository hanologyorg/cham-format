<template>
  <section id="introduction" class="spec-section">
    <h2>1. Introduction</h2>

    <p>
      CHAM (Classical Han with Annotations Markup) is a structured markup format for classical Chinese texts.
      It is designed to serve as the <strong>single source of truth</strong> for digital libraries of classical
      Han literature — encompassing poetry, prose, philosophical works, historical records, and all other
      genres of classical Chinese writing.
    </p>

    <p>
      CHAM files are plain text files using a Markdown-based syntax with YAML frontmatter. They encode the
      text content, inline annotation markers, annotation entries, and structural metadata in a format that
      is both human-editable and machine-parseable.
    </p>

    <h3>1.1 Design Principles</h3>

    <table class="spec-table">
      <thead>
        <tr><th>Principle</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr>
          <td><strong>Explicit Declaration</strong></td>
          <td>All semantics are expressed through explicit syntax. No meaning is inferred from convention or positional assumption.</td>
        </tr>
        <tr>
          <td><strong>Universality</strong></td>
          <td>Not limited to poetry. CHAM supports all genres of classical Chinese literature — poetry (<code>shì</code> 詩), prose (<code>sǎn</code> 散文), philosophical works (<code>jīng</code> 經), historical records (<code>shǐ</code> 史), rhapsodies (<code>fù</code> 賦), and drama (<code>xìqǔ</code> 戲曲).</td>
        </tr>
        <tr>
          <td><strong>Extensibility</strong></td>
          <td>Annotation kinds (<code>kind</code>) are an open enumeration. New kinds can be added without modifying the core specification.</td>
        </tr>
        <tr>
          <td><strong>Round-trip Equivalence</strong></td>
          <td>CHAM → structured data → CHAM produces semantically equivalent output. The format is lossless for all semantic content.</td>
        </tr>
        <tr>
          <td><strong>Human-Machine Duality</strong></td>
          <td>CHAM files can be edited by hand in any text editor and can be parsed programmatically with equal ease.</td>
        </tr>
      </tbody>
    </table>

    <h3>1.2 Scope</h3>

    <p>CHAM files handle:</p>
    <ul>
      <li>Text content with inline annotation markers</li>
      <li>Annotation entries (pronunciation, semantics, people, places, events, dates, allusions, commentary, translation, and extensible kinds)</li>
      <li>Multi-layer annotations (independent annotation layers from different contributors)</li>
      <li>Multi-file relationships (main files and subordinate files sharing a common marker table)</li>
    </ul>

    <p>CHAM files do <strong>not</strong> handle:</p>
    <ul>
      <li>Author biographies, background essays, literary appreciation — these are plain Markdown files (see <a href="#file-structure">§4</a>)</li>
      <li>Global pronunciation lexicons — these are separate YAML registry files (see <a href="#registries">§12</a>)</li>
      <li>Registry data (authors, places, events, dynasties) — these are separate YAML files (see <a href="#registries">§12</a>)</li>
    </ul>

    <h3>1.3 Format Support</h3>

    <p>
      This specification defines CHAM in terms of a Markdown-based file format (<code>.cham.md</code>) and
      JSON output. The format is designed to be format-agnostic at the semantic level, allowing future
      implementations to support additional serialization formats (e.g., YAML, XML, database storage)
      without changing the underlying data model.
    </p>

    <p>
      A conforming implementation may support any combination of input/output formats, provided the
      semantic model defined in this specification is preserved.
    </p>

    <h3>1.4 Notation</h3>

    <p>
      In this specification, the key words <strong>shall</strong>, <strong>shall not</strong>,
      <strong>should</strong>, <strong>should not</strong>, and <strong>may</strong> are to be interpreted
      as described in RFC 2119.
    </p>
  </section>
</template>
