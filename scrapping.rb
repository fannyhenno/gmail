require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'pry'
require "google_drive"

session = GoogleDrive::Session.from_config("config.json")
ws = session.spreadsheet_by_key("1wU080Syipluw9mfuOoLXRPDXZE-VuZaa0NQFQSeqOe4").worksheets[0]



def get_all_the_urls_of_nord_townhalls

	def get_the_email_of_a_townhal_from_its_webpage(url_townhall) 
	url_townhall = Nokogiri::HTML(open(url_townhall))
	email = url_townhall.css("p.Style22")[11].text #position de l'email trouvée gràace à l'inspecteur
print url_townhall
	end
=begin
page = Nokogiri::HTML(open("https://annuaire-des-mairies.com/nord.html"))   

links = page.css("a.lientxt") #commande pour accéder aux balises <a> qui contiennent le nom des mairies et l'url pour accéder à leur page
villes = page.css("a.lientxt").text #.text permet d'afficher seulement le texte de la balise <a> 


table = links.map { |link| link['href'][1..100] } #itération sur chaque balise <a> pour isoler leur url (href) et enlever le point (.)
	table.each do |town_link| #pour chaque bout d'url ...
		
		new_page = "https://annuaire-des-mairies.com" + town_link #reconstitution d'un url entier
		get_the_email_of_a_townhal_from_its_webpage(new_page) #appel à la fonction précédente grâce à notre url
	end

end
=end

=begin
ws[1, 1] = "mairie"
ws[1, 2] = "email"
i = 2
mon_hash.each do |k, v|
ws[i, 1] = k
ws[i, 2] = v
i += 1
end
=end

print city_email
binding.pry


get_all_the_urls_of_nord_townhalls
ws.reload
ws.save()
end