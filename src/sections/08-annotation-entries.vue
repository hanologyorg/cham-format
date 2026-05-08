<template>
  <section id="annotation-entries" class="spec-section">
    <h2>8. Annotation Entries</h2>

    <p>
      Annotation entries are the core data units that attach information to positions in the text.
      Each entry targets a specific range and classifies the annotation with a <code>kind</code>.
    </p>

    <h3>8.1 Syntax</h3>

    <p>The general form of an annotation entry is:</p>

    <pre><code>target kind params [headword][value]
target kind params [value]</code></pre>

    <p>Components:</p>
    <ul>
      <li><code>target</code> — what the annotation points to (§8.2)</li>
      <li><code>kind</code> — the annotation type (§8.3)</li>
      <li><code>params</code> — key-value parameters specific to the kind (§8.4)</li>
      <li><code>[headword][value]</code> or <code>[value]</code> — the annotation content (§8.5)</li>
    </ul>

    <h3>8.2 Target</h3>

    <p>The target identifies what portion of the text the annotation applies to:</p>

    <table class="spec-table">
      <thead>
        <tr><th>Target</th><th>Semantic</th><th>Usage</th></tr>
      </thead>
      <tbody>
        <tr><td><code>{N}</code></td><td>Inline marker reference</td><td>References the range defined by <code>{N}</code>...<code>{/N}</code> in the text.</td></tr>
        <tr><td><code>@title</code></td><td>Title text</td><td>The annotation targets the piece's title.</td></tr>
        <tr><td><code>@full</code></td><td>Full text</td><td>The annotation targets the entire piece.</td></tr>
        <tr><td><code>@verse:L:C</code></td><td>Position reference</td><td>Targets text block <code>L</code> at character offset <code>C</code>. Rarely used; provided for precision when no inline marker exists.</td></tr>
      </tbody>
    </table>

    <h3>8.3 Kind</h3>

    <p>
      The <code>kind</code> is an open enumeration. Each kind defines its own parameter rules and
      value format. The following kinds are defined by this specification:
    </p>

    <table class="spec-table">
      <thead>
        <tr><th>Kind</th><th>Required Params</th><th>Value</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr>
          <td><code>pron</code></td>
          <td><code>type</code>, <code>lang</code></td>
          <td><code>[reading]</code> or <code>[char][reading]</code></td>
          <td>Pronunciation annotation. Supports homophones, romanization systems, and phonetic notation.</td>
        </tr>
        <tr>
          <td><code>meaning</code></td>
          <td>—</td>
          <td><code>[explanation]</code> or <code>[headword][explanation]</code></td>
          <td>Semantic annotation — the definition or explanation of a word or phrase.</td>
        </tr>
        <tr>
          <td><code>person</code></td>
          <td><code>ref</code> (recommended)</td>
          <td><code>[name][brief]</code> or <code>[brief]</code></td>
          <td>Person reference. <code>ref</code> links to <code>authors.yaml</code>.</td>
        </tr>
        <tr>
          <td><code>place</code></td>
          <td><code>ref</code> (optional)</td>
          <td><code>[name][desc]</code> or <code>[desc]</code></td>
          <td>Place name annotation. <code>ref</code> links to <code>places.yaml</code>.</td>
        </tr>
        <tr>
          <td><code>event</code></td>
          <td><code>ref</code> (optional)</td>
          <td><code>[name][desc]</code> or <code>[desc]</code></td>
          <td>Historical event annotation. <code>ref</code> links to <code>events.yaml</code>.</td>
        </tr>
        <tr>
          <td><code>date</code></td>
          <td><code>dynasty</code>, <code>era</code>, <code>year</code>, <code>iso</code> (all optional)</td>
          <td><code>[text][desc]</code></td>
          <td>Date reference with optional machine-readable parameters.</td>
        </tr>
        <tr>
          <td><code>allusion</code></td>
          <td><code>source</code> (optional)</td>
          <td><code>[quote][explanation]</code></td>
          <td>Literary allusion. <code>source</code> indicates the origin text.</td>
        </tr>
        <tr>
          <td><code>commentary</code></td>
          <td>—</td>
          <td><code>[text]</code></td>
          <td>Traditional commentary (古注). Free-form text from a historical commentator.</td>
        </tr>
        <tr>
          <td><code>translation</code></td>
          <td>—</td>
          <td><code>[text]</code></td>
          <td>Modern translation or transliteration.</td>
        </tr>
      </tbody>
    </table>

    <p>
      Implementations <strong>may</strong> define additional kinds. Unknown kinds <strong>shall</strong>
      be preserved by parsers and passed through unchanged.
    </p>

    <h3>8.4 Parameters</h3>

    <p>
      Parameters are <code>key:value</code> pairs separated by spaces, positioned after the
      <code>kind</code> and before the bracket values.
    </p>

    <div class="example-block">
      <span class="example-label">Example: Parameters</span>
      <div class="example-content">
        <pre><code>{3} pron type:hom lang:yue [錐]
{5} person ref:A020 [皋陶][舜帝理官]
{7} date dynasty:唐 era:開元 year:15 iso:727 [開元十五年]
{4} allusion source:詩經·采薇 [昔我往矣][出自《詩經·小雅·采薇》]</code></pre>
      </div>
    </div>

    <h4>8.4.1 Pronunciation Parameters</h4>

    <table class="spec-table">
      <thead>
        <tr><th>Parameter</th><th>Values</th><th>Description</th></tr>
      </thead>
      <tbody>
        <tr><td><code>type</code></td><td><code>hom</code> | <code>jyut</code> | <code>pinyin</code> | <code>bopomofo</code></td><td>Pronunciation system type</td></tr>
        <tr><td><code>lang</code></td><td><code>yue</code> | <code>cmn</code></td><td>Language variant (ISO 639-5 codes)</td></tr>
      </tbody>
    </table>

    <h4>8.4.2 Entity Reference Parameters</h4>

    <p>
      The <code>ref</code> parameter is used by <code>person</code>, <code>place</code>, and
      <code>event</code> kinds to link to registry entries (see §12).
    </p>

    <h3>8.5 Bracket Values</h3>

    <p>Bracket values carry the actual annotation content:</p>

    <table class="spec-table">
      <thead>
        <tr><th>Form</th><th>Semantic</th></tr>
      </thead>
      <tbody>
        <tr><td><code>[value]</code></td><td>Single value. Headword defaults to the text matched by the inline marker range.</td></tr>
        <tr><td><code>[headword][value]</code></td><td>Two values. Headword is the word being explained (may differ from the full marker range text).</td></tr>
      </tbody>
    </table>

    <h3>8.6 Multi-line Values</h3>

    <p>
      When the value spans multiple lines, it begins with <code>[</code> on the annotation line
      and ends with <code>]</code> alone on its own line (no other characters on that line):
    </p>

    <div class="example-block">
      <span class="example-label">Example: Multi-line value</span>
      <div class="example-content">
        <pre><code>{2} meaning [奈何][
「奈何」意為「怎麼辦」。
全句即「把你怎麼辦呢」。

表達了項羽對虞姬的深情與無奈。
]</code></pre>
      </div>
    </div>

    <p>Multi-line values may contain any characters, blank lines, and paragraphs. The closing <code>]</code> <strong>shall</strong> appear alone on a line with no preceding or following non-whitespace characters.</p>

    <h3>8.7 Complete Examples</h3>

    <div class="example-block">
      <span class="example-label">Example: Various annotation kinds</span>
      <div class="example-content">
        <pre><code>## 注釋

{1} pron type:hom lang:yue [錐]
{1} pron type:jyut lang:yue [zeoi1]
{1} pron type:pinyin lang:cmn [zhuī]
{1} meaning [騅][項羽的馬名]

{2} meaning [奈何][
「奈何」意為「怎麼辦」。
全句即「把你怎麼辦呢」。
]

{3} person ref:A020 [皋陶][舜帝時代理官，中國司法鼻祖]

{4} place ref:P001 [垓下][今安徽省靈璧縣東南]

{5} date dynasty:唐 era:開元 year:15 iso:727 [開元十五年]

{6} allusion source:詩經·采薇 [昔我往矣][
出自《詩經·小雅·采薇》。
原句為「昔我往矣，楊柳依依」。
]

{7} @title pron type:hom lang:yue [垓][該]
{8} @full meaning [全詩以「兮」字貫穿四句，反覆詠嘆。]</code></pre>
      </div>
    </div>
  </section>
</template>
