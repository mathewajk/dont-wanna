class IndexController < ApplicationController
  allow_unauthenticated_access only: :index
  
  def index
    if authenticated?
      redirect_to to_donts_path
    end
  end
end
