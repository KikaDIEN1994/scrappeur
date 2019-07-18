
require 'rubygems'
require 'nokogiri'  
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
#puts page.class   # => Nokogiri::HTML::Document


name_crypto=[]
page.xpath("//body//tbody//tr//td//span//a").each do |node|
	name_crypto << node.text
end

money=[]
page.xpath("a//price").each do |node|
	money << node.text
end

	for i in 0..name_crypto.length-1
		hash=name_crypto[i]
		hash2=money[i]
		print "#{hash} => #{hash2} "
		puts
	end

=begin
	
rescue Exception => e
	
end
tab=[1,2,3,4]
tab2= ["A","B","C","D"]

	for i in 0..tab.length-1

		hash=tab[i] 
		hash2=tab2[i]
		puts "#{hash} => #{hash2} "
	end
=end

#//*[@id="id-bitcoin"]/td[5]/a
