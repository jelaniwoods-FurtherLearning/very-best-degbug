class VenuesController < ApplicationController

  def index
    @venues = Venue.all.order(:created_at)

    render({ :template => "venues/venue_list.html.erb" })
  end

  def show
    venue_id = params.fetch("venue_id")
    @venue = Venue.where({ :id => venue_id }).first

    render({ :template => "venues/details.html.erb" })
  end

  def create
    venue = Venue.new
    venue.address = params.fetch("input_address")
    venue.name = params.fetch("input_name")
    venue.neighborhood = params.fetch("input_neighborhood")
    venue.save

    redirect_to("/venues/#{venue.id}")
  end
  
  def update
    the_id = params.fetch("venue_id")

    venue = Venue.where({ :id => the_id }).at(0)
    venue.address = params.fetch("input_address")
    venue.name = params.fetch("input_name")
    venue.neighborhood = params.fetch("input_neighborhood")
    venue.save
    
    redirect_to("/venues/#{venue.id}")
  end

  def destroy
    the_id = params.fetch("venue_id")
    venue = Venue.where({ :id => the_id }).at(0)
    venue.destroy

    redirect_to("/venues")
  end

end
