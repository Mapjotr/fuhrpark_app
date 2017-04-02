class CarsController < ApplicationController
  before_action :logged_in_user
  # run the before_action ONLY for the three defined actions. 
  # Hence, only if the user of the car is also the current user, he is allowed to do these actions
  # For just :show[ing] a car, he does not have to be the cars user
  before_action only: [:edit, :update, :destroy] do
    correct_user( current_car.user_id)
  end
  before_action :set_car, only: [:edit, :update, :destroy]
  #before_action :admin_user,      only: [:destroy] #only if a user destroys a car, it is checked if he/she is an admin
  # if a user only wants to :show, :edit etc. a car, he does not have to be an admin

  def calc_consump
    date1_id = params['date1_id']
    date2_id = params['date2_id']
    car_id = params['car_id']
    consumption = {"consump" => date1_id}
    milage_date_1 = Car.find(car_id).refuellings.find(date1_id).milage
    milage_date_2 = Car.find(car_id).refuellings.find(date2_id).milage
    date_date_1 = Car.find(car_id).refuellings.find(date1_id).refuel_date.strftime("%Y-%m-%d")
    date_date_2 = Car.find(car_id).refuellings.find(date2_id).refuel_date.strftime("%Y-%m-%d")
    km_driven = milage_date_1 - milage_date_2
    liters_total = Car.find(car_id).refuellings.where(:refuel_date => date_date_2..date_date_1).sum(:liters)
    consumption = (liters_total*100/km_driven).round(2)
    #return milage.to_s
    respond_to do |format|
      format.html
      format.json { render json: consumption }  # respond with the created JSON object
    end

  end

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
    if @car.update_attributes(car_params)
      flash[:success] = "#{@car.car_name} aktualisiert"
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
	  params.require(:car).permit(:id,:car_name, :car_brand, :car_model, :purchase_price,
	                               :purchase_date, :seller, :fuel_type, :cubic_capacity, 
                                 :engine_power, :registrationdate, :milage_purchase_date, :numberplate,:picture,
                                 :emission_class,:insurance_nr,:sf_class,:sf_perc,:liability,:comprehensive_part,
                                 :comprehensive_full,:tax,:sold,:sold_date,:sale_price,:buyer)
	end

  def current_car
    Car.all.find(params[:id])
  end

  def set_car
    @car = current_car
  end

end
