require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_email townhall_url
	Nokogiri::HTML(open("#{townhall_url}")).xpath('//*[@id="sideinfocom"]/p/span/a').text
end

def get_name
	tab_of_names = []
	Nokogiri::HTML(open('https://www.annuaire-mairie.fr/departement-val-d-oise.html')).xpath('//*[@id="annuaire"]/ul/li/h2/a/span').each do |nom|
		tab_of_names << nom.text
	end
	return tab_of_names
end

def get_townhall_urls
	tab_of_last_urls = []
	tab_of_urls = []		
	Nokogiri::HTML(open('https://www.annuaire-mairie.fr/departement-val-d-oise.html')).xpath('//*[@id="annuaire"]/ul/li/h2/a/@href').each do |url_suffix|
		tab_of_last_urls << url_suffix.text
	end			
	basic_url = "https://www.annuaire-mairie.fr"
	tab_of_last_urls.each do |url|
		tab_of_urls << basic_url + url
	end
	return tab_of_urls
end

final_tab = []
for num in 0..get_townhall_urls.length-1
	mail = get_townhall_email(get_townhall_urls[num])
	my_hash = {
		get_name[num] => mail
	}
	final_tab << my_hash
end

puts final_tab