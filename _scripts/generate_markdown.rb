require 'json'
require 'fileutils'

# JSONファイルのパス
json_file = File.join(__dir__, '../_data/radicals.json')
radicals = JSON.parse(File.read(json_file))

# radicalsの各要素に対して処理を行う
radicals.each do |item|
    item['radicals'].each do |radical|
        # Markdownファイルの内容
        markdown_content = <<~MARKDOWN
        ---
        layout: default
        title: "#{radical['glyph'][0]}部"  # glyphをタイトルに使用
        ---
        
        # #{radical['glyph'][0]}部
        部首ID: #{radical['id']}
        MARKDOWN

        # ファイル名を生成
        file_name = File.join(__dir__, "../radicals/#{radical['id']}.md")

        # Markdownファイルを作成
        File.write(file_name, markdown_content)
    end
end
