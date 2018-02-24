class HomeController < ApplicationController

  def index
    month = "february"
    day = 25
    destUrl = "https://www.factmonster.com/dayinhistory/february-25"

    destResponse = HTTParty.get(destUrl)

    destDom = Nokogiri::HTML(destResponse.body)

    theyear = destDom.css('.history-current-events ul li h3')
    thisday = destDom.css('.history-current-events ul li p')

    @year = []
    theyear.each do |years|
      @year << years.text
    end

    @event = []
    thisday.each do |events|
      @event << events.text
    end

  end
end
