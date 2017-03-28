class RefuellingsController < ApplicationController
  
  def show
    @refuelling = Refuelling.find(params[:id])
    #@cars = @user.cars.paginate(page: params[:page])
    #redirect_to root_url and return unless @user.activated
  end
  
  def new
    @refuelling = Refuelling.new
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
  end

  def edit
  end

  def destroy
    @refuelling = current_car.refuellings.find(params[:id])
    @refuelling.destroy
    flash[:success] = "Eintrag gelöscht"
    redirect_to car_refuellings_path
  end

  def index
    @refuellings = current_car.refuellings
    @car_id = current_car.id
  end

private

  def refuelling_params
    params.require(:refuelling).permit(:refuel_date, :milage, :cents_per_liter,
                                 :filling_station, :location, :liters, :filled_up)
  end

  def current_car
    Car.all.find(params[:car_id])
  end

end
