class RentalListingsController < ApplicationController
    before_action :set_rental_listing, only: [:show, :edit, :update, :toggle_interested, :toggle_contacted]
    
    def index
        @rental_listings = RentalListing.all
    end

    def show
    end

    def edit
    end

    def new
        @rental_listing = RentalListing.new
    end

    def create
        @rental_listing = RentalListing.new(rental_listing_params)
        if @rental_listing.save
            redirect_to @rental_listing
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @rental_listing.update(rental_listing_params)
          redirect_to @rental_listing
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
    def toggle_interested
        if @rental_listing.update(toggle_interested_params)
            msg = {status: "ok"}
            render :json => msg
        else
            render :json => @rental_listing, status: :unprocessable_entity
        end
    end

    def toggle_contacted
        if @rental_listing.update(toggle_contacted_params)
            msg = {status: "ok"}
            render :json => msg
        else
            render :json => @rental_listing, status: :unprocessable_entity
        end
    end

    def toggle_available
        if @rental_listing.update(toggle_available_params)
            msg = {status: "ok"}
            render :json => msg
        else
            render :json => @rental_listing, status: :unprocessable_entity
        end
    end

    private
        def set_rental_listing
            @rental_listing = RentalListing.find(params[:id])
        end

        def rental_listing_params
            params.expect(rental_listing: %i[ address start_date bedrooms bathrooms pets price notes contacted ])
        end

        def toggle_interested_params
            params.expect(rental_listing: %i[ interested ])
        end

        def toggle_contacted_params
            params.expect(rental_listing: %i[ contacted ])
        end
end
