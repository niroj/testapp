class ReviewsController < ApplicationController
  before_filter :find_destination
  before_filter :authenticate_user!

  # POST /destinations/:destination_id/reviews
  def create
    if @destination.user_id != current_user.id
      @review = @destination.reviews.new(params[:review ])
      @review.user_id = current_user.id

      respond_to do |format|
          # format.html{ redirect_to destination_path(@destination) }
          format.js
      end
    else
      redirect_to destination_path(@destination)
      flash[:alert] = "You Are not allowed to add review in destinations you add"
    end
  end


  private

  def find_destination
    @destination = Destination.find(params[:destination_id])
  end
end


