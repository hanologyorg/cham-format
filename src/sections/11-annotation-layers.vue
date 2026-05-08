<template>
  <section id="annotation-layers" class="spec-section">
    <h2>11. Annotation Layers</h2>

    <p>
      CHAM uses a three-layer annotation architecture to balance global consistency with
      per-text precision.
    </p>

    <h3>11.1 Three-Layer Architecture</h3>

    <table class="spec-table">
      <thead>
        <tr><th>Layer</th><th>Source</th><th>Scope</th><th>Override Rule</th></tr>
      </thead>
      <tbody>
        <tr><td><strong>1. Global lexicon</strong></td><td><code>data/lexicon.yaml</code></td><td>All texts</td><td>Weakest — overridden by layers 2 and 3</td></tr>
        <tr><td><strong>2. Main file inline</strong></td><td><code>text.cham.md</code> annotation entries</td><td>Single piece</td><td>Overrides layer 1</td></tr>
        <tr><td><strong>3. Subordinate file</strong></td><td><code>*.cham.md</code> subordinate files</td><td>Single piece</td><td>Overrides layer 1</td></tr>
      </tbody>
    </table>

    <h3>11.2 Override Rules</h3>

    <p>At the same position in the text:</p>
    <ul>
      <li>Inline annotations (layers 2–3) override the global lexicon (layer 1)</li>
      <li>Different <code>kind</code> values do <strong>not</strong> override each other — a <code>pron</code> and a <code>meaning</code> annotation at the same position coexist</li>
      <li>Same <code>kind</code> at the same position: the more specific source takes precedence</li>
    </ul>

    <h3>11.3 Global Lexicon Format</h3>

    <p>
      The global lexicon (<code>data/lexicon.yaml</code>) provides pronunciation data for
      characters and words across all texts. It uses the same annotation syntax as inline
      pronunciation entries.
    </p>

    <div class="example-block">
      <span class="example-label">Example: lexicon.yaml</span>
      <div class="example-content">
        <pre><code>騅:
  pron:
    - type:hom lang:yue [錐]
    - type:jyut lang:yue [zeoi1]
    - type:pinyin lang:cmn [zhuī]

行:
  pron:
    - type:pinyin lang:cmn [xíng]
    - type:pinyin lang:cmn [háng]

樂:
  pron:
    - type:hom lang:yue [落]
    - type:jyut lang:yue [lok6]
    - type:pinyin lang:cmn [lè]
    - type:pinyin lang:cmn [yuè]</code></pre>
      </div>
    </div>

    <h3>11.4 Multi-sound Character Handling</h3>

    <p>
      The global lexicon lists all known readings for a character. The <strong>first</strong>
      reading for each type is the <strong>default reading</strong>. When a text uses a
      non-default reading, an inline <code>pron</code> annotation in the CHAM file overrides
      the default.
    </p>

    <p>Parsers <strong>shall</strong> apply the global lexicon as follows:</p>
    <ol>
      <li>Load the lexicon from <code>data/lexicon.yaml</code></li>
      <li>Scan the clean text for characters/words matching lexicon entries</li>
      <li>For each match, create a pronunciation annotation using the default reading</li>
      <li>If an inline <code>pron</code> annotation exists at the same position, the inline annotation takes precedence</li>
    </ol>

    <div class="note">
      <p>
        The global lexicon currently supports only <code>pron</code> annotations.
        Semantic annotations are always position-specific and must be provided inline.
      </p>
    </div>
  </section>
</template>
