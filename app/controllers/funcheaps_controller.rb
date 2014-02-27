class FuncheapsController < ApplicationController

    def perform_scrape
        ItineraryWorker.perform_async
    end
end
