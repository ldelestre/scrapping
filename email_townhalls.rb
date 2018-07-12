require 'open-uri'
require 'nokogiri'

######################### Méthode qui récupère l'adresse mail de la mairie de Vaureal ########################

# def get_the_email_of_a_townhal_from_its_webpage

# 	page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))
# 	email = page.css('td')[7].content
# 	puts "#{email}"

# end

######################### Méthode qui récupère chaque adresse mail des mairies du 95 et les range dans un hash avec le nom de la commune  #########################

def get_the_email_of_a_townhal_from_its_webpage(url)

	page = Nokogiri::HTML(open("#{url}"))
	email = page.css('td')[7].content
	town_name = page.css('small')[0].content

	hash = { town_name => email }
	puts hash

end

def get_all_the_urls_of_val_doise_townhalls
	
	page_source = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	
	x = 8

	while x < 186
		websites_of_townhalls = []
		websites_of_townhalls << "http://annuaire-des-mairies.com/" + page_source.css('a')[x]['href']
		websites_of_townhalls.each do |link|
			puts get_the_email_of_a_townhal_from_its_webpage(link)
			x = x + 1
		end
	end
end

get_all_the_urls_of_val_doise_townhalls