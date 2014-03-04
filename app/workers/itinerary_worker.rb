require 'mechanize'
require 'nokogiri'
require 'open-uri'

class ItineraryWorker
    include Sidekiq::Worker
    include Sidetiq::Schedulable

    recurrence { hourly }

    def perform
        agent = Mechanize.new
        #Mechanize scrapes site
        # event_date = params[:date]
        page_num = 1
        until page_num == 3
            url = "http://sf.funcheap.com/events/page/#{page_num}"
            list = agent.get(url) #list of links on target page
            page_links = list.search(".title2 a") #gets all links with CSS selector ".title2 a"
            page_links.each do |url| #start loop over page_links
                result_page = Mechanize::Page::Link.new(url, agent, list).click #clicks all links one-by-one
                event_title = result_page.search('.title').text.partition('|').first.strip #display title by CSS selector
                address = result_page.search("//b[contains(., 'Address')]/..").text.partition(':').last.strip #pull address by xpath
                event_date = result_page.search("#stats .left > a").text
                # Save to the model
                unless address == nil #address might be empty ""; check that out later
                    event = Funcheap.find_or_create_by(name: event_title)
                    event.full_address = address
                    event.date = event_date
                    event.save
                end
            end
            page_num += 1
        end
    end
end
