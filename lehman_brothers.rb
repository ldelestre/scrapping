require 'open-uri'
require 'nokogiri'
require 'rubygems'

def main

	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

	currencies = page.css('td class="text-center sorting_1"').content

	puts "#{currencies}"
end

main