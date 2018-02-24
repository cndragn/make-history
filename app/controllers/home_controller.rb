class HomeController < ApplicationController

  def index
    month = "february"
    day = 25

    date = Time.now
    # @month = date.strftime("%B %d, %Y")
    month = date.strftime("%B")
    day = date.strftime("%d")
    @year = date.strftime("%Y")

    destUrl = "https://www.factmonster.com/dayinhistory/#{month}-#{day}"

    destResponse = HTTParty.get(destUrl)

    destDom = Nokogiri::HTML(destResponse.body)

    thisday = destDom.css('.history-current-events ul li')

    thisday.search('//a[not(starts-with(@href, "http://"))]').each do |a|
      a.replace(a.content)
    end

    @onthisday = thisday

  end
end
