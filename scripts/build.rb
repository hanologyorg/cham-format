# frozen_string_literal: true

require 'coradoc'
require 'coradoc/asciidoc'
require 'coradoc/html'

project_dir = File.expand_path('..', __dir__)
spec_file = File.join(project_dir, 'cham-spec.adoc')
dist_dir = File.join(project_dir, 'dist')

content = File.read(spec_file)
doc = Coradoc::AsciiDoc.parse(content)
expanded = doc.expand_includes(File.dirname(spec_file))

core = Coradoc::AsciiDoc::Transform::ToCoreModel.transform(expanded)

config = Coradoc::Html::Static::Configuration.new(
  include_toc: true,
  toc_levels: 3,
  toc_placement: :left,
  section_numbering: true,
  section_numbering_levels: 3,
  theme_toggle: true,
  css_theme: :professional,
  lang: 'en'
)
html = Coradoc::Html::Static.convert(core, config)

FileUtils.mkdir_p(dist_dir)
output = File.join(dist_dir, 'index.html')
File.write(output, html)
puts "Built #{output} (#{html.size} bytes)"
