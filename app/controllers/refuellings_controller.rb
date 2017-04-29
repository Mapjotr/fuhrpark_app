class RefuellingsController < ApplicationController
  before_action :logged_in_user
  before_action only: [:edit, :update, :destroy] do
    correct_user( current_car.user_id)
  end
  # before_action :admin_user,      only: :destroy
  
  def show
    @refuelling = Refuelling.find(params[:id])
    #@cars = @user.cars.paginate(page: params[:page])
    #redirect_to root_url and return unless @user.activated
  end
  
  def new
    @refuelling = Refuelling.new
    @car = current_car
  end

  def create
    @refuelling = current_car.refuellings.build(refuelling_params)
    if @refuelling.save
      flash[:info] = "Neuer Tankeintrag hinzuzugefügt"
      redirect_to car_refuellings_path
    else
      render 'new'
    end
  end

  def update
    #if current_user.cars.find(params[:id]).update_attributes(car_params) # in case you should be only allowed to update your own cars
    @car = current_car
    @refuelling = @car.refuellings.find(params[:id])
    if @refuelling.update_attributes(refuelling_params)
      flash[:success] = "Tankeintrag aktualisiert"
      redirect_to car_refuellings_path
    else
      render 'edit'
    end
  end

  def edit
    @refuelling = current_car.refuellings.find(params[:id])
    @car = current_car
  end

  def destroy
    @refuelling = current_car.refuellings.find(params[:id])
    @refuelling.destroy
    flash[:success] = "Eintrag gelöscht"
    redirect_to car_refuellings_path
  end

  def index
    @refuellings = current_car.refuellings.order('refuel_date DESC').paginate(page: params[:page],:per_page => 10)
    @refuellings_date1 = current_car.refuellings.where(filled_up:true).order('refuel_date')
    @car = current_car
    @car_id = current_car.id
    @car_name = current_car.car_name
    @refuellings_date2 = []
    @refuelling = Refuelling.new
  end

  def update_date2
    refuelling_id_date1 = params[:refuelling_id]
    date1 = Refuelling.find_by(id:refuelling_id_date1).refuel_date
    @refuellings_date2 = current_car.refuellings.where("refuel_date > ? AND filled_up = ?", date1, true).select("id, refuel_date").order('refuel_date')
    respond_to do |format|
      format.json { render json: @refuellings_date2 }  # respond with the created JSON object
      format.js # render update_date2.js.erb
    end
  end

private

  def refuelling_params
    params.require(:refuelling).permit(:id,:refuel_date, :milage, :cents_per_liter,
                                 :filling_station, :location, :liters, :filled_up)
  end

  def current_car
    Car.all.find(params[:car_id])
  end

end
