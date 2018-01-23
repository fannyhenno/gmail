gmail = Gmail.connect('fannyhenno', 'sodhweenna120611')

Gmail.connect('fannyhenno', 'sodhweenna120611') do |gmail|
 	puts gmail.logged_in?
end

gmail.deliver do
  to "leila_06@hotmail.com"
  subject "Having fun in Bali!"
  text_part do
    body "You're the best"
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Text of <em>html</em> message.</p>"
  end
end