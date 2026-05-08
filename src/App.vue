<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'

const activeSection = ref('introduction')

const navItems = [
  { id: 'introduction', label: '1. Introduction' },
  { id: 'conformance', label: '2. Conformance' },
  { id: 'terms', label: '3. Terms and Definitions' },
  { id: 'file-structure', label: '4. File Structure' },
  { id: 'file-format', label: '5. CHAM File Format' },
  { id: 'text-blocks', label: '6. Text Blocks' },
  { id: 'inline-markers', label: '7. Inline Markers' },
  { id: 'annotation-entries', label: '8. Annotation Entries' },
  { id: 'annotation-sections', label: '9. Annotation Sections' },
  { id: 'multi-file', label: '10. Multi-file Relationships' },
  { id: 'annotation-layers', label: '11. Annotation Layers' },
  { id: 'registries', label: '12. Registries' },
  { id: 'pipeline', label: '13. Processing Pipeline' },
  { id: 'round-trip', label: '14. Round-trip Equivalence' },
  { id: 'examples', label: 'A. Complete Examples' },
]

function onScroll() {
  const sections = document.querySelectorAll('.spec-section[id]')
  let current = ''
  for (const s of sections) {
    const rect = s.getBoundingClientRect()
    if (rect.top <= 120) current = s.id
  }
  if (current) activeSection.value = current
}

onMounted(() => window.addEventListener('scroll', onScroll, { passive: true }))
onUnmounted(() => window.removeEventListener('scroll', onScroll))
</script>

<template>
  <div class="app-layout">
    <aside class="sidebar">
      <div class="sidebar-header">
        <div class="sidebar-title">CHAM</div>
        <div class="sidebar-subtitle">Classical Han with Annotations Markup</div>
      </div>
      <ul class="sidebar-nav">
        <li
          v-for="item in navItems"
          :key="item.id"
        >
          <a
            :href="'#' + item.id"
            :class="{ active: activeSection === item.id }"
          >{{ item.label }}</a>
        </li>
      </ul>
    </aside>
    <main class="main-content">
      <SpecIntroduction />
      <SpecConformance />
      <SpecTerms />
      <SpecFileStructure />
      <SpecFileFormat />
      <SpecTextBlocks />
      <SpecInlineMarkers />
      <SpecAnnotationEntries />
      <SpecAnnotationSections />
      <SpecMultiFile />
      <SpecAnnotationLayers />
      <SpecRegistries />
      <SpecPipeline />
      <SpecRoundTrip />
      <SpecExamples />
    </main>
  </div>
</template>

<script lang="ts">
import SpecIntroduction from './sections/01-introduction.vue'
import SpecConformance from './sections/02-conformance.vue'
import SpecTerms from './sections/03-terms.vue'
import SpecFileStructure from './sections/04-file-structure.vue'
import SpecFileFormat from './sections/05-file-format.vue'
import SpecTextBlocks from './sections/06-text-blocks.vue'
import SpecInlineMarkers from './sections/07-inline-markers.vue'
import SpecAnnotationEntries from './sections/08-annotation-entries.vue'
import SpecAnnotationSections from './sections/09-annotation-sections.vue'
import SpecMultiFile from './sections/10-multi-file.vue'
import SpecAnnotationLayers from './sections/11-annotation-layers.vue'
import SpecRegistries from './sections/12-registries.vue'
import SpecPipeline from './sections/13-pipeline.vue'
import SpecRoundTrip from './sections/14-round-trip.vue'
import SpecExamples from './sections/15-examples.vue'

export default {
  components: {
    SpecIntroduction,
    SpecConformance,
    SpecTerms,
    SpecFileStructure,
    SpecFileFormat,
    SpecTextBlocks,
    SpecInlineMarkers,
    SpecAnnotationEntries,
    SpecAnnotationSections,
    SpecMultiFile,
    SpecAnnotationLayers,
    SpecRegistries,
    SpecPipeline,
    SpecRoundTrip,
    SpecExamples,
  },
}
</script>
