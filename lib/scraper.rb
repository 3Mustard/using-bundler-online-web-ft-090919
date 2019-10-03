require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper 
  
  
  @@name_array = []
  
  def self.name_array
    @@name_array
  end 
  
  def scrape 
    html = open('https://rankedboost.com/league-of-legends/counter/')
    doc = Nokogiri::HTML(html)
    array = []
    doc.css("table#lol-table tbody tr").each do |table_row| 
      table_row.css("td").each do |table_data|
        name = table_data.css("a").attr("title")
          array << name
      end 
    end 
    puts array
  end 
end 




