<template>
  <section id="text-blocks" class="spec-section">
    <h2>6. Text Blocks</h2>

    <p>
      Text blocks are the primary content units of a CHAM file. The text between the frontmatter
      closing <code>---</code> and the first annotation section heading (<code>##</code>) is parsed as
      text blocks.
    </p>

    <h3>6.1 Blank Line Semantics</h3>

    <p>The number of blank lines between content lines determines their structural relationship:</p>

    <table class="spec-table">
      <thead>
        <tr><th>Blank lines</th><th>Semantic</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr><td>0 (consecutive lines)</td><td>Continuation</td><td>Lines belong to the same text block. Line breaks within the block do not affect annotation offsets.</td></tr>
        <tr><td>1 (single blank line)</td><td>Block boundary</td><td>New text block. In poetry: a new line/verse. In prose: a new paragraph.</td></tr>
        <tr><td>2+ (multiple blank lines)</td><td>Structural break</td><td>New section. In poetry: a new stanza. In prose: a major structural division (chapter, section).</td></tr>
      </tbody>
    </table>

    <h3>6.2 Poetry Text</h3>

    <p>In poetry mode (<code>genre: poetry</code>), each verse line is followed by a single blank line.
    Stanzas are separated by two or more blank lines.</p>

    <div class="example-block">
      <span class="example-label">Example: Poetry — 2 sections, 4 text blocks</span>
      <div class="example-content">
        <pre><code>力拔山兮氣蓋世。

時不利兮{1}騅{/1}不逝。

{1}騅{/1}不逝兮可奈何！


虞兮虞兮{2}奈若何{/2}！</code></pre>
      </div>
    </div>

    <p>
      The blank line after "可奈何！" is followed by another blank line, creating a 2-blank-line gap
      — this is a structural break separating the two stanzas (sections).
    </p>

    <h3>6.3 Prose Text</h3>

    <p>
      In prose mode (<code>genre: prose</code>), consecutive lines without blank lines are
      <strong>continuations</strong> — they are merged into a single text block. Line breaks within
      a continuation block do not affect annotation character offsets.
    </p>

    <div class="example-block">
      <span class="example-label">Example: Prose — 1 section, 2 text blocks</span>
      <div class="example-content">
        <pre><code>{1}道{/1}可道，非常{2}道{/2}。
{3}名{/3}可名，非常{4}名{/4}。

無名天地之始，有名萬物之母。
故常無欲，以觀其妙；
常有欲，以觀其徼。</code></pre>
      </div>
    </div>

    <p>
      The first two lines form one text block (no blank line between them). The single blank line
      creates a block boundary. The next three lines form a second text block.
    </p>

    <h3>6.4 Section and Block Indexing</h3>

    <p>Parsers <strong>shall</strong> assign indices as follows:</p>
    <ul>
      <li><strong>Sections</strong> are numbered sequentially starting from 0, each separated by 2+ blank lines.</li>
      <li><strong>Text blocks</strong> are numbered sequentially within each section, starting from 0.</li>
      <li>Character offsets are calculated within each text block independently (see §7.3).</li>
    </ul>
  </section>
</template>
