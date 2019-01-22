# frozen_string_literal: true

ActiveAdmin.register_page 'Nokogiri' do
  page_action :grab, method: :post do
    puts params[:nokogiri][:url]
    _uri = uri?(params[:nokogiri][:url])
    document = Nokogiri::HTML(open(params[:nokogiri][:url]))
    @images = document.css('img')
    @images.each do |image|
      unless uri?(image.attributes['src'].value)
        image.attributes["src"].value = "#{params[:nokogiri][:url]}#{image.attributes["src"].value}"
      end
    end
    render partial: 'images', image: @images
  end

  content do
    render partial: 'form'
  end
end

def uri?(string)
  uri = URI.parse(string)
  %w( http https ).include?(uri.scheme)
rescue URI::BadURIError
  false
rescue URI::InvalidURIError
  false
end
