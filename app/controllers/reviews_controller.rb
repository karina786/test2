class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def create
    @donation = Donation.find(params[:donation_id])
    @review = @donation.reviews.create(review_params)
    if @review.save
      redirect_to donation_path(@donation)
    else
      # redirect_to root_path
    end
  end

  def destroy
    @donation = Donation.find(params[:donation_id])
    @review = Review.find(params[:id])
    flash[:notice] = "successfully deleted your delails"
    @review.destroy
    redirect_to donation_path(@donation), status: :see_other
  end

  private
    def review_params
      params.require(:review).permit(:name, :description, :email)
    end
end

