<template>
  <section id="inline-markers" class="spec-section">
    <h2>7. Inline Markers</h2>

    <p>
      Inline markers are zero-width annotations embedded in the text content. They define character
      ranges that annotation entries can reference.
    </p>

    <h3>7.1 Syntax</h3>

    <table class="spec-table">
      <thead>
        <tr><th>Marker</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr><td><code>{N}</code></td><td>Opening marker — marks the start of a range. Zero-width.</td></tr>
        <tr><td><code>{/N}</code></td><td>Closing marker — marks the end of a range. Zero-width.</td></tr>
      </tbody>
    </table>

    <p>Where <code>N</code> is a positive integer (1, 2, 3, ...). Multi-digit IDs are supported (e.g., <code>{12}</code>, <code>{/12}</code>).</p>

    <h3>7.2 Characteristics</h3>

    <h4>7.2.1 Zero-width</h4>
    <p>
      Markers do not wrap text. They are inserted at specific positions. Removing all markers yields
      the plain text:
    </p>
    <div class="example-block">
      <span class="example-label">Example</span>
      <div class="example-content">
        <pre><code>時不利兮{1}騅{/1}不逝。
→ 時不利兮騅不逝。</code></pre>
      </div>
    </div>

    <h4>7.2.2 Overlapping Ranges</h4>
    <p>Markers support overlapping ranges:</p>
    <div class="example-block">
      <span class="example-label">Example: Overlapping</span>
      <div class="example-content">
        <pre><code>{1}力拔{2}山兮{/1}氣蓋{/2}世。
Range 1: 力拔山兮
Range 2: 山兮氣蓋 (overlap: 山兮)</code></pre>
      </div>
    </div>

    <h4>7.2.3 Enclosed Ranges</h4>
    <p>A range may be fully enclosed within another:</p>
    <div class="example-block">
      <span class="example-label">Example: Enclosed</span>
      <div class="example-content">
        <pre><code>{1}奈{2}若何{/2}{/1}！
Range 1: 奈若何
Range 2: 若何 (enclosed in Range 1)</code></pre>
      </div>
    </div>

    <h4>7.2.4 Disallowed Patterns</h4>
    <p>Markers <strong>shall not</strong> produce syntax ambiguity. Specifically, an opening marker <strong>shall not</strong> be closed by a different marker's closing tag when that would leave the first marker unclosed:</p>
    <ul>
      <li><code>{1}{2}{/1}{/2}</code> — allowed (properly interleaved)</li>
      <li><code>{1}{2}{/1}</code> — disallowed (marker 2 is unclosed)</li>
    </ul>

    <h4>7.2.5 Uniqueness</h4>
    <p>Each marker ID <code>N</code> <strong>shall</strong> be unique within a single CHAM file. The same ID may appear as both an opening and closing pair, but no two opening markers may share the same ID.</p>

    <h3>7.3 Offset Calculation</h3>

    <p>Character offsets are calculated on the merged text block string after removing all marker syntax:</p>

    <ul>
      <li>Offsets are <strong>zero-based</strong> character positions within a text block</li>
      <li>Continuation line breaks (within a prose text block) are <strong>not</strong> counted</li>
      <li>Punctuation characters <strong>are</strong> counted</li>
      <li>The marker syntax itself (<code>{N}</code>, <code>{/N}</code>) is <strong>not</strong> counted</li>
    </ul>

    <div class="example-block">
      <span class="example-label">Example: Offset calculation</span>
      <div class="example-content">
        <pre><code>Text:     時不利兮{1}騅{/1}不逝。
Clean:    時不利兮騅不逝。
Offsets:  0 1 2 3 4 5 6 7

Marker {1}...{/1}:
  offset: 5, length: 1 (covers 騅)</code></pre>
      </div>
    </div>
  </section>
</template>
