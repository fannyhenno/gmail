require 'gmail'
require "google_drive"
require "pry"
require_relative "mairie.rb"

=begin
session = GoogleDrive::Session.from_config("config.json")
ws = session.spreadsheet_by_key("1wU080Syipluw9mfuOoLXRPDXZE-VuZaa0NQFQSeqOe4").worksheets[0]
=end

gmail = Gmail.connect('fannyhenno', '***')

Gmail.connect('fannyhenno', '***') do |gmail|
 	puts gmail.logged_in?
end

def createspreadsheet(h, mytittle)
	session = GoogleDrive::Session.from_config("config.json")
	ws = session.create_spreadsheet(title = mytittle).worksheets[0]
	i = 1
	h.each do |k, v|
		ws[i, 1] = k
		ws[i, 2] = v
		i += 1	
		ws.save
	end
	return ws
end	

#binding.pry

def send_email_to_line (mairie, email)
gmail = Gmail.connect('fannyhenno', '***')

gmail.deliver do
  to email
  subject "The Hacking Project"
  text_part do
    body "Bonjour,

	Je m'appelle Fanny, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. 

	La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

	Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{mairie}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec la ville de #{mairie} !

	Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80

	Bien à vous,
	Fanny"
  			end

end 
end

#send_email_to_line("Lille", "fannyhenno@gmail.com")

def go_through_all_the_lines(h, mytittle)
	ws = createspreadsheet(h, mytittle)
	for i in 1..120 do
		mairie = ws[i, 1]
		email = ws[i, 2][1..100]
		send_email_to_line(mairie, email)
	end
end

mairie = get_all_the_urls_of_nord_townhalls

#go_through_all_the_lines(mairie, "mairies du nord") pour remplir mon spreadsheet
go_through_all_the_lines(mairie, "projet email") #j'appelle ma fonction pour balancer les emails et les autres fonctions