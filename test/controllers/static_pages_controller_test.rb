require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

	def setup
		@base_title = 'Fuhrpark'
	end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

   test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Kontakt | #{@base_title}"
  end

   test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "Über | #{@base_title}"
  end

   test "should get impressum" do
    get impressum_path
    assert_response :success
    assert_select "title", "Impressum | #{@base_title}"
  end

end
