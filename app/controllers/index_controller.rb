class IndexController < ApplicationController
  allow_unauthenticated_access only: :index
  
  def index
    if authenticated?
      @to_donts = ToDont.where(user: Current.user)
      @rental_listings = RentalListing.all
    end
  end
end
