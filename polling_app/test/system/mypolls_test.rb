require "application_system_test_case"

class MypollsTest < ApplicationSystemTestCase
  setup do
    @mypoll = mypolls(:one)
  end

  test "visiting the index" do
    visit mypolls_url
    assert_selector "h1", text: "Mypolls"
  end

  test "creating a Mypoll" do
    visit mypolls_url
    click_on "New Mypoll"

    fill_in "Category", with: @mypoll.category_id
    fill_in "User", with: @mypoll.user_id
    click_on "Create Mypoll"

    assert_text "Mypoll was successfully created"
    click_on "Back"
  end

  test "updating a Mypoll" do
    visit mypolls_url
    click_on "Edit", match: :first

    fill_in "Category", with: @mypoll.category_id
    fill_in "User", with: @mypoll.user_id
    click_on "Update Mypoll"

    assert_text "Mypoll was successfully updated"
    click_on "Back"
  end

  test "destroying a Mypoll" do
    visit mypolls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mypoll was successfully destroyed"
  end
end
