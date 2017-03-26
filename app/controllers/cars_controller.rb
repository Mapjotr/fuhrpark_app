class CarsController < ApplicationController

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
	  params.require(:car).permit(:car_name, :car_model, :purchase_price,
	                               :purchase_date, :seller)
	end

  def current_car
    Car.all.find(params[:id])
  end


end
