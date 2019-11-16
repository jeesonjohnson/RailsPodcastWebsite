require 'rest-client'
require 'json'
class Podcast < ApplicationRecord

    def self.new_podcast_search(search_term)
        puts "HASDHJJAHDGASHGDJHASHKJASHJASHKJASHJASHKASDHDKASHDASKHDASKJDHASKJDHASKDSHKASHKASJHDKASHDASKHDASKDHASDASHKJASHDKASHDASKJHDASKJ"
        itunesURL="https://itunes.apple.com/search?term="
        itunesURL=itunesURL+search_term.downcase.tr(" ","+")+"&entity=podcast"
        # response=HTTParty.get(itunesURL)
        # response= response.parsed_response
        response = RestClient.get(itunesURL)
        response=JSON.parse(response)
        return response
        # return response["results"][1]
        # return {"test"=>"Values"}
        #return {:test=> "testvalue"}

    end


    


end
