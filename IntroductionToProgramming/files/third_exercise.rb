require 'json'
require 'csv'
require 'nokogiri'
require 'axlsx'
require 'byebug'

# parse slashdot.xml into an array of hashes

slashdot_articles = []
File.open("slashdot.xml", "r") do |f|
  doc = Nokogiri::XML(f)
  slashdot_articles = doc.css('item').map do |i|
    {
      title: i.at_css('title').content,
      link: i.at_css('link').content,
      summary: i.at_css('description').content
    }
  end
end
puts "complete xml file parsing, title of first article is: #{slashdot_articles.first[:title]}"
puts

# parse feedzilla.json into an array of hashes

feedzilla_articles = []
File.open("feedzilla.json", "r") do |f|
  items = JSON.parse(f.read)
  feedzilla_articles = items['articles'].map do |a|
    {
      title: a['title'],
      link: a['url'],
      summary: a['summary']
    }
  end
end
puts "complete json file parsing, title of first article is: #{feedzilla_articles.first[:title]}"
puts

sorted_articles = (slashdot_articles + feedzilla_articles).sort_by {|a| a[:title]}

# create the csv file

CSV.open("articles.csv", "wb") do |csv|
  sorted_articles.each {|a| csv << [a[:title], a[:link], a[:summary]]}
end

# create the xlsx file

pkg = Axlsx::Package.new
pkg.workbook.add_worksheet(:name => "Articles") do |sheet|
  sorted_articles.each {|a| sheet.add_row [a[:title], a[:link], a[:summary]]}
end
pkg.serialize("articles.xlsx")