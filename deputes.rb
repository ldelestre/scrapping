require 'open-uri'
require 'nokogiri'

def deputes_infos(url)

	page = Nokogiri::HTML(open("#{url}"))
	name_deputee = page.xpath('//*[@id="corps_page"]/div/div[1]/div[1]/h1').text
	email = page.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li[1]').text

	hash = {"#{name_deputee}" => "#{email}"}
	puts hash

end

deputes_infos("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036")

# def method_for_each_deputee
	
# 	page_source = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
	
# 	x = 128

# 	while x < 704
# 		deputee_sheet = []
# 		deputee_sheet << '//*[@id="corps_page"]/div/div/div[29]/table/tbody/tr/td[1]/a[1]' + page_source.css('a')[x]['href']
# 		deputee_sheet.each do |link|
# 			puts deputes_infos(link)
# 			x = x + 1
# 		end
# 	end
# end

# method_for_each_deputee