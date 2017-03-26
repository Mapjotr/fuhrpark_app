require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @car = @user.cars.build(car_name:'Caddy',car_model:'VW Caddy 1.6 Diesel', 
                            purchase_date:Time.zone.parse('2016-07-08'),purchase_price:9999.99, seller:'Autohaus VW')
  end

  test "should be valid" do
    assert @car.valid?
  end

  test "user id should be present" do
    @car.user_id = nil
    assert_not @car.valid?
  end


  test "car name should be present" do
    @car.car_name = "   "
    assert_not @car.valid?
  end

  test "car name should be at most 30 characters" do
    @car.car_name = "a" * 31
    assert_not @car.valid?
  end


  test "car model should be at most 50 characters" do
    @car.car_model = "a" * 51
    assert_not @car.valid?
  end

  test "order should be most recent first" do
    assert_equal cars(:bmw), Car.first
  end

end
