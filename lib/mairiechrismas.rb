
require 'rubygems'
require 'nokogiri'  
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"))



ville=[]
get_townhall_email(https://www.annuaire-des-mairies.com/95/avernes.html)

get_townhall_email

=begin
mail=[]
page.xpath("a//price").each do |node|
	mail << node.text
end

	for i in 0..ville.length-1
		hash=ville[i]
		hash2=mail[i]
		puts "#{hash} => #{hash2} "
	end

=end