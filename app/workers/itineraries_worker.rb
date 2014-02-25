require 'mechanize'
require 'nokogiri'
require 'open-uri'

class ItineraryWorker
    include Sidekiq::Worker

    def perform_scrape
        # Instantiate Mechanize agent
        # Agent gets all HTML from page
        # FInd all links, save to variable
        # Iterate over links, click them, scrape data inside, save to variable

        agent = Mechanize.new
        #Mechanize scrapes site
        event_date = params[:date]
        url = "http://sf.funcheap.com/#{event_date}/"
        list = agent.get(url) #list of links on target page
        page_links = list.search(".title a") #gets all links with CSS selector ".title a"
        page_links.each do |url| #start loop over page_links
            result_page = Mechanize::Page::Link.new(url, agent, list).click #clicks all links one-by-one
            event_title = result_page.search('.title').text.partition('|').first.strip #display title by CSS selector
            address = result_page.search("//b[contains(., 'Address')]/..").text.partition(':').last.strip #pull address by xpath
            event_date = result_page.search("#stats .left > a").text
            event_desc = result_page.search(".event-series p").text.strip
            # Save to the model
            event = Funcheap.find_or_create_by(:event_title event_title)
            event.address = address
            event.date = event_date
            event.description = event_desc
            event.save
        end #removed cost(pointless, I think)

    #     url = "http://sf.funcheap.com/90s-simpsons-trivia-night-watch-party-mission-dist-4/"
    #     doc = Nokogiri::HTML(open(url))
    #     doc.css(".post").each do |detail|
    #         @event_title = detail.css(".title").text.partition('|').first.strip
    #         @event_date = detail.css("#stats .left > a").text
    #         @event_desc = detail.css(".event-series p").text.strip
    #         @cost = detail.css(".cost").text.partition(':').last.strip
    #         # @address = detail.css(".left a+ span").text.partition('|').last.strip
    #     end

    #     event = Funcheap.find_or_create_by(:event_title @event_title)
    #     event.date = event_date
    #     event.description = event_desc
    #     event.cost = cost
    #     event.save
    end
end


