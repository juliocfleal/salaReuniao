require "application_system_test_case"

class ReservationcsTest < ApplicationSystemTestCase
  setup do
    @reservationc = reservationcs(:one)
  end

  test "visiting the index" do
    visit reservationcs_url
    assert_selector "h1", text: "Reservationcs"
  end

  test "should create reservationc" do
    visit reservationcs_url
    click_on "New reservationc"

    fill_in "Name", with: @reservationc.name
    fill_in "Start time", with: @reservationc.start_time
    click_on "Create Reservationc"

    assert_text "Reservationc was successfully created"
    click_on "Back"
  end

  test "should update Reservationc" do
    visit reservationc_url(@reservationc)
    click_on "Edit this reservationc", match: :first

    fill_in "Name", with: @reservationc.name
    fill_in "Start time", with: @reservationc.start_time
    click_on "Update Reservationc"

    assert_text "Reservationc was successfully updated"
    click_on "Back"
  end

  test "should destroy Reservationc" do
    visit reservationc_url(@reservationc)
    click_on "Destroy this reservationc", match: :first

    assert_text "Reservationc was successfully destroyed"
  end
end
