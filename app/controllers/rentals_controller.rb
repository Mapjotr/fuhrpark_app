class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @car = current_car
  end

  def create
    @car = current_car
    @rental = current_car.rentals.build(rentals_params)
    if @rental.save
      flash[:info] = "Neuer Verleih hinzuzugefügt"
      redirect_to car_rentals_path
    else
      render 'new'
    end
  end

  def update
    @car = current_car
    @rental = @car.rentals.find(params[:id])
    if @rental.update_attributes(rentals_params)
      flash[:success] = "Verleihausgang aktualisiert"
      redirect_to car_rentals_path
    else
      render 'edit'
    end
  end

  def edit
    @car = current_car
    @rental = current_car.rentals.find(params[:id])
  end

  def destroy
    @rental = current_car.rentals.find(params[:id])
    @rental.destroy
    flash[:success] = "Eintrag gelöscht"
    redirect_to car_rentals_path
  end

  def index
    @rentals = current_car.rentals.paginate(page: params[:page],:per_page => 5)
    @car = current_car
    @car_id = current_car.id
    @car_name = current_car.car_name
    @driven_kilometers = 999
    @rental_amount_total = 58.00
    @rental_amount_final = 28.00
  end

  def show
    @rental = Rental.find(params[:id])
  end

private

  def rentals_params
    params.require(:rental).permit(:id,:customer, :rental_date_out, :rental_date_return,
                                 :milage_out, :milage_return, :amount_refuelled, :description)
  end

  def current_car
    Car.all.find(params[:car_id])
  end

end
