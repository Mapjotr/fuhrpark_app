require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

    def setup 
        @user = users(:michael) 
    end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", impressum_path
    get contact_path
    assert_select "title", full_title("Kontakt")
    get signup_path
    assert_select "title", full_title("Anmeldung")
    assert_select "a[href=?]", users_path, count: 0 #make sure that there is no link to users_path when not logged in
    log_in_as(@user)
    assert_redirected_to user_url(@user)
    follow_redirect!
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", users_path
  end

end
