<template>
  <section id="examples" class="spec-section">
    <h2>A. Complete Examples</h2>

    <h3>A.1 Poetry — Single-file Mode</h3>

    <p>
      The following example demonstrates a complete CHAM file for a poem (垓下歌) using single-file mode.
      All content — text, markers, and annotations — is in one file.
    </p>

    <div class="example-block">
      <span class="example-label">File: content/001_垓下歌/text.cham.md</span>
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
---

力拔山兮氣蓋世。

時不利兮{1}騅{/1}不逝。

{1}騅{/1}不逝兮可奈何！


虞兮虞兮{2}奈若何{/2}！

## 注釋

{1} meaning [騅][項羽的馬名]

{2} meaning [奈何][
「奈何」意為「怎麼辦」。
全句即「把你怎麼辦呢」。

表達了項羽對虞姬的深情與無奈。
]

{3} @title pron type:hom lang:yue [垓][該]

{4} @full meaning [
全詩以「兮」字貫穿四句，反覆詠嘆。
首句寫英雄氣概，末句寫兒女深情。
]</code></pre>
      </div>
    </div>

    <div class="note">
      <p>
        The pronunciation of <code>騅</code> is provided by the global lexicon (<code>lexicon.yaml</code>),
        so it is not repeated in the inline annotations.
      </p>
    </div>

    <h3>A.2 Book — Multi-file Mode</h3>

    <p>
      The following example demonstrates a multi-chapter book (帛書老子 甲本) with multiple
      annotation layers stored in separate files.
    </p>

    <h4>A.2.1 Book Metadata</h4>

    <div class="example-block">
      <span class="example-label">File: content/老子/book.yaml</span>
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
genre: prose</code></pre>
      </div>
    </div>

    <h4>A.2.2 Main File</h4>

    <div class="example-block">
      <span class="example-label">File: content/老子/01_第一章/text.cham.md</span>
      <div class="example-content">
        <pre><code>---
id: 1
title: 第一章
---

{1}道{/1}可道，非常{2}道{/2}。
{3}名{/3}可名，非常{4}名{/4}。

{5}無名{/5}，天地之始；
{6}有名{/6}，萬物之母。

故常{7}無欲{/7}，以觀其{8}妙{/8}；
常{9}有欲{/9}，以觀其{10}徼{/10}。

此兩者同出而異名，同謂之{11}玄{/11}。
玄之又玄，眾妙之門。

## 注釋

{1} meaning [道][
道，宇宙的本源和根本規律。
第一個「道」指可以用語言描述的道。
]

{5} meaning [無名][
沒有具體名稱的狀態，指天地形成之前的混沌。
]

{11} meaning [玄][深奧、微妙。指道的深不可測。]</code></pre>
      </div>
    </div>

    <p>
      Note: the frontmatter omits <code>contributors</code>, <code>date</code>, and <code>genre</code>
      because they are inherited from the parent <code>book.yaml</code>.
    </p>

    <h4>A.2.3 Subordinate File — Commentary</h4>

    <div class="example-block">
      <span class="example-label">File: content/老子/01_第一章/wangbi.cham.md</span>
      <div class="example-content">
        <pre><code>---
base: text.cham.md
contributor: A010
role: annotator
dynasty: 三國（魏）
nature: commentary
---

{1} commentary [可道之道，可名之名，指事造形。非其常也。故不可道，不可名也。]

{5} commentary [凡物皆有始。始，本也。謂道為無，故能生萬物。]

{11} commentary [玄者，冥也。默然無有也。始，母之所出也。]</code></pre>
      </div>
    </div>

    <h4>A.2.4 Subordinate File — Translation</h4>

    <div class="example-block">
      <span class="example-label">File: content/老子/01_第一章/modern-trans.cham.md</span>
      <div class="example-content">
        <pre><code>---
base: text.cham.md
contributor: A050
role: translator
nature: translation
---

{1} translation [可以說出來的道，就不是永恆不變的道。]

{3} translation [可以叫出來的名字，就不是永恆不變的名字。]

{5} translation [
「無名」是天地的開端；
「有名」是萬物的根本。
]

{11} translation [
此兩者同出一源而名稱不同，都可稱之為「玄」。
玄之又玄，是一切奧妙的門徑。
]</code></pre>
      </div>
    </div>

    <h3>A.3 Directory Layout</h3>

    <div class="example-block">
      <span class="example-label">Combined directory structure</span>
      <div class="example-content">
        <pre><code>project/
  data/
    lexicon.yaml
    authors.yaml
    dynasties.yaml
    eras.yaml
    sexagenary.yaml
    places.yaml
    events.yaml
  content/
    001_垓下歌/
      text.cham.md
      author-brief.md
      background.md
    老子/
      book.yaml
      01_第一章/
        text.cham.md
        wangbi.cham.md
        modern-trans.cham.md
      02_第二章/
        text.cham.md
        wangbi.cham.md</code></pre>
      </div>
    </div>
  </section>
</template>
