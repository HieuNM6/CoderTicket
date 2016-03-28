class VenuesController < ApplicationController
  def new
    @venue = Venue.new
    intialize_show_variable
  end
  
  def create
    @venue = Venue.new(venue_params) 
    if @venue.save
      flash[:success] = "Create venue successful"
      redirect_to root_path
    else
      flash.now[:danger] = "Create venue unsuccessful"
      intialize_show_variable
      render 'new'
    end
  end

  private
    def intialize_show_variable
      @regions = Region.all
    end
    
    def venue_params
      params.require(:venue).permit!
    end
end
