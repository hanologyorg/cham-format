<template>
  <section id="conformance" class="spec-section">
    <h2>2. Conformance</h2>

    <h3>2.1 Conforming CHAM Documents</h3>

    <p>A file is a <strong>conforming CHAM document</strong> if it satisfies all of the following:</p>
    <ul>
      <li>It uses the <code>.cham.md</code> file extension</li>
      <li>It contains valid YAML frontmatter delimited by <code>---</code> on lines containing only dashes</li>
      <li>The frontmatter includes all required fields for its document type (main file or subordinate file)</li>
      <li>Inline markers (<code>{N}</code> and <code>{/N}</code>) are well-formed: every opening marker has a matching closing marker</li>
      <li>Marker IDs are unique within the file and are positive integers</li>
      <li>Annotation entries follow the syntax defined in <a href="#annotation-entries">§8</a></li>
      <li>Bracket values are properly balanced: every <code>[</code> has a matching <code>]</code></li>
    </ul>

    <h3>2.2 Conforming CHAM Parsers</h3>

    <p>A <strong>conforming CHAM parser</strong> is software that:</p>
    <ul>
      <li>Accepts one or more conforming CHAM documents as input</li>
      <li>Produces structured data that preserves all semantic content</li>
      <li>Implements the blank-line semantics defined in <a href="#text-blocks">§6</a></li>
      <li>Correctly resolves inline marker positions using the offset calculation defined in <a href="#inline-markers">§7</a></li>
      <li>Supports overlapping and enclosed ranges</li>
      <li>Parses all annotation entry kinds defined in <a href="#annotation-entries">§8</a></li>
      <li>Handles multi-file relationships as defined in <a href="#multi-file">§10</a></li>
      <li>Merges subordinate files according to the rules in <a href="#multi-file">§10</a></li>
    </ul>

    <p>A conforming parser <strong>should</strong> produce informative error messages including line and column information when parsing fails.</p>

    <h3>2.3 Conforming CHAM Serializers</h3>

    <p>A <strong>conforming CHAM serializer</strong> is software that:</p>
    <ul>
      <li>Accepts structured data conforming to the CHAM data model as input</li>
      <li>Produces a conforming CHAM document as output</li>
      <li>Preserves round-trip equivalence as defined in <a href="#round-trip">§14</a></li>
      <li>Produces output that is human-readable and editable</li>
    </ul>
  </section>
</template>
