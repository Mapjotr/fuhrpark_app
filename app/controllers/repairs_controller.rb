class RepairsController < ApplicationController
  before_action :logged_in_user
  before_action only: [:edit, :update, :destroy] do
    correct_user( current_car.user_id)
  end
  #before_action :admin_user,      only: :destroy
    
  def show
    @repair = Repair.find(params[:id])
    #@cars = @user.cars.paginate(page: params[:page])
    #redirect_to root_url and return unless @user.activated
  end
  
  def new
    @repair = Repair.new
  end

  def create
    @repair = current_car.repairs.build(repairs_params)
    if @repair.save
      flash[:info] = "Neue Reparatur hinzuzugefügt"
      redirect_to car_repairs_path
    else
      render 'new'
    end
  end

  def update
    #if current_user.cars.find(params[:id]).update_attributes(car_params) # in case you should be only allowed to update your own cars
    if @repair.update_attributes(repairs_params)
      flash[:success] = "Reparatur aktualisiert"
      redirect_to car_repairs_path
    else
      render 'edit'
    end
  end

  def edit
    @repair = current_car.repairs.find(params[:id])
  end

  def destroy
    @repair = current_car.repairs.find(params[:id])
    @repair.destroy
    flash[:success] = "Eintrag gelöscht"
    redirect_to car_repairs_path
  end

  def index
    @repairs = current_car.repairs.paginate(page: params[:page],:per_page => 3)
    @car_id = current_car.id
    @car_name = current_car.car_name
  end

private

  def repairs_params
    params.require(:repair).permit(:id,:repair_date, :title, :description,
                                 :billings_amount, :garage)
  end

  def current_car
    Car.all.find(params[:car_id])
  end

end
