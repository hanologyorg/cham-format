<template>
  <section id="registries" class="spec-section">
    <h2>12. Registries</h2>

    <p>
      Registries are authoritative YAML files that provide reference data shared across all texts.
      They reside in the <code>data/</code> directory.
    </p>

    <h3>12.1 File Manifest</h3>

    <table class="spec-table">
      <thead>
        <tr><th>File</th><th>Purpose</th><th>ID Format</th></tr>
      </thead>
      <tbody>
        <tr><td><code>lexicon.yaml</code></td><td>Global pronunciation lexicon</td><td>Character/word as key</td></tr>
        <tr><td><code>authors.yaml</code></td><td>People registry (authors, annotators, translators)</td><td><code>A</code> + 3 digits (e.g., <code>A001</code>)</td></tr>
        <tr><td><code>dynasties.yaml</code></td><td>Dynasty registry</td><td>Dynasty name as key</td></tr>
        <tr><td><code>eras.yaml</code></td><td>Era table (652 entries from Chinese national standard)</td><td>Sequential entries</td></tr>
        <tr><td><code>sexagenary.yaml</code></td><td>Sexagenary cycle reference</td><td>60 cycle names as keys</td></tr>
        <tr><td><code>places.yaml</code></td><td>Place name registry</td><td><code>P</code> + 3 digits (e.g., <code>P001</code>)</td></tr>
        <tr><td><code>events.yaml</code></td><td>Historical event registry</td><td><code>E</code> + digits (e.g., <code>E001</code>)</td></tr>
      </tbody>
    </table>

    <h3>12.2 authors.yaml</h3>

    <p>
      The authors registry contains all historical figures referenced in the corpus — not limited
      to authors. Commentators, translators, and editors are also included.
    </p>

    <div class="example-block">
      <span class="example-label">Example: authors.yaml</span>
      <div class="example-content">
        <pre><code>A001:
  name: 項羽
  dynasty: 秦末
  bio: 項羽（前232—前202），名籍，字羽，下相人……

A010:
  name: 王弼
  dynasty: 三國（魏）
  bio: 王弼（226—249），字輔嗣，山陽高平人……</code></pre>
      </div>
    </div>

    <p>ID allocation rules:</p>
    <ul>
      <li>IDs are permanent — once assigned, they <strong>shall not</strong> be changed or reused</li>
      <li>The <code>name</code> field <strong>shall</strong> be in Chinese</li>
      <li>The <code>dynasty</code> field <strong>should</strong> match a key in <code>dynasties.yaml</code></li>
      <li>The <code>bio</code> field is optional free text</li>
    </ul>

    <h3>12.3 places.yaml</h3>

    <div class="example-block">
      <span class="example-label">Example: places.yaml</span>
      <div class="example-content">
        <pre><code>P001:
  name: 垓下
  modern: 今安徽省靈璧縣東南
  geo: [33.28, 117.55]    # optional: latitude, longitude</code></pre>
      </div>
    </div>

    <h3>12.4 events.yaml</h3>

    <div class="example-block">
      <span class="example-label">Example: events.yaml</span>
      <div class="example-content">
        <pre><code>E001:
  name: 垓下之戰
  date: -202
  description: 楚漢戰爭最後決戰</code></pre>
      </div>
    </div>

    <h3>12.5 dynasties.yaml</h3>

    <div class="example-block">
      <span class="example-label">Example: dynasties.yaml</span>
      <div class="example-content">
        <pre><code>秦:
  code: QIN
  start: -221
  end: -207
西漢:
  code: XHAN
  start: -206
  end: 8
唐:
  code: TANG
  start: 618
  end: 907</code></pre>
      </div>
    </div>

    <h3>12.6 eras.yaml</h3>

    <p>
      The era registry contains 652 entries derived from the Chinese national standard
      GB/T XXXXX Part 2 (《日期和時間 日曆體系代碼 第2部分：中國古代》). Each entry records:
    </p>

    <div class="example-block">
      <span class="example-label">Example: eras.yaml entry</span>
      <div class="example-content">
        <pre><code>- dynasty: 漢
  dynasty_code: HAN
  ruler: 高祖
  ruler_code: GZ
  era: null              # null for pre-era-name periods
  era_code: null
  year: 1
  sexagenary: 乙未
  iso: -206</code></pre>
      </div>
    </div>

    <h3>12.7 sexagenary.yaml</h3>

    <div class="example-block">
      <span class="example-label">Example: sexagenary.yaml (partial)</span>
      <div class="example-content">
        <pre><code>stems: [甲, 乙, 丙, 丁, 戊, 己, 庚, 辛, 壬, 癸]
branches: [子, 醜, 寅, 卯, 辰, 巳, 午, 未, 申, 酉, 戌, 亥]
甲子: 1
乙丑: 2
# ... through 癸亥: 60</code></pre>
      </div>
    </div>

    <h3>12.8 Date Encoding</h3>

    <p>
      CHAM supports four Chinese historical date encoding types based on the national standard
      <code>h-CN.{type}...</code> system:
    </p>

    <table class="spec-table">
      <thead>
        <tr><th>Type</th><th>System</th><th>Format</th></tr>
      </thead>
      <tbody>
        <tr><td>1</td><td>Ruler regnal year (王公即位年次)</td><td><code>h-CN.1.{dynasty}.{ruler}.{year}</code></td></tr>
        <tr><td>2</td><td>Era name year (年號紀年)</td><td><code>h-CN.2.{dynasty}.{era}.{year}</code></td></tr>
        <tr><td>3</td><td>Republic of China year (中華民國紀年)</td><td><code>h-CN.3.{year}</code></td></tr>
        <tr><td>4</td><td>Sexagenary cycle (天干地支紀年)</td><td><code>h-CN.4.{cycle}</code></td></tr>
      </tbody>
    </table>
  </section>
</template>
