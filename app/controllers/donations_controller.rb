class DonationsController < ApplicationController  
  def index
    @donations = Donation.paginate(:page => params[:page], :per_page => 5)
    @donations_all=Donation.all
  end

  caches_page :index   

  def show
    @donation = Donation.find(params[:id])
  end

  def new
    @donation = Donation.new
  end

  def aboutus
    
  end

  def search
    @query = params[:query]
    @blood = params[:blood]
    if @query.blank?
      flash[:notice] = "empty search??"
      redirect_to root_path
    else
      q = "%#{params[:query]}%" 
      b = "%#{params[:blood]}%"
      @donations = Donation.where("donations.city Like ? AND donations.blood_group Like ?",q,b).paginate(:page => params[:page], :per_page => 5)
      render "index" ,status: :ok 
    end
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      DonarMailer.with(donation: @donation).welcome_email.deliver_later
      flash[:notice] = "successfully created"
      # redirect_to root_path
      redirect_to donation_path(@donation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @donation = Donation.find(params[:id])
  end

  def update
    @donation = Donation.find(params[:id])
    if @donation.update(donation_params)
      flash[:notice] = "successfully updated"
      redirect_to donation_path(@donation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @donation = Donation.find(params[:id])
    flash[:notice] = "successfully deleted your delails"
    @donation.destroy
    redirect_to root_path, status: :see_other
  end
  
  private
    def donation_params
      params.require(:donation).permit(:name, :blood_group, :dob, :gender, :email, :contact, :city, :last_donate)
    end
end
