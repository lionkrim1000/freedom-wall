class WelcomeController < ApplicationController
  def index
    @random_rant = Rant.order("RANDOM()").first
    @random_confession = Confession.order("RANDOM()").first
    @random_casual_post = CasualPost.order("RANDOM()").first
    
    Rails.logger.debug "Fetched Random Rant: #{@random_rant}"
    Rails.logger.debug "Fetched Random Confession: #{@random_confession}"
    Rails.logger.debug "Fetched Random Casual Post: #{@random_casual_post}"
  end
end
