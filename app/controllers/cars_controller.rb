class CarsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,    only: [:edit,:update,:destroy]
  before_action :admin_user,      only: :destroy

  def show
    @car = Car.find(params[:id])
    #@cars = @user.cars.paginate(page: params[:page])
    #redirect_to root_url and return unless @user.activated
  end

  def new
  	@car = Car.new
  end

  def create
    @car = current_user.cars.build(car_params)
    if @car.save
      flash[:info] = "Erfolgreich neues Auto hinzuzugefügt"
      redirect_to cars_path
    else
      render 'new'
    end
  end

  def edit
      @car = Car.find(params[:id])
  end

  def update
    #if current_user.cars.find(params[:id]).update_attributes(car_params) # in case you should be only allowed to update your own cars
    if current_car.update_attributes(car_params)
      flash[:success] = "#{current_car.car_name} aktualisiert"
      redirect_to cars_path
    else
      render 'edit'
    end
  end

  def destroy
    car_name = current_car.car_name
    current_car.destroy
    flash[:success] = "#{car_name} gelöscht"
    redirect_to cars_path
  end

  def index
	 @cars = Car.all
  end

private

	def car_params
	  params.require(:car).permit(:car_name, :car_brand, :car_model, :purchase_price,
	                               :purchase_date, :seller, :fuel_type, :cubic_capacity, 
                                 :engine_power, :registrationdate, :milage_purchase_date, :numberplate,:picture,
                                 :emission_class,:insurance_nr,:sf_class,:sf_perc,:liability,:comprehensive_part,
                                 :comprehensive_full,:tax,:sold,:sold_date,:sale_price,:buyer,
                                 refuellings_attributes: [:id, :refuel_date, :milage, :cents_per_liter,
                                 :filling_station, :location, :liters, :filled_up, :_destroy])
	end

  def current_car
    Car.all.find(params[:id])
  end

end
