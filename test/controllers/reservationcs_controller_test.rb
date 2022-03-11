require "test_helper"

class ReservationcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservationc = reservationcs(:one)
  end

  test "should get index" do
    get reservationcs_url
    assert_response :success
  end

  test "should get new" do
    get new_reservationc_url
    assert_response :success
  end

  test "should create reservationc" do
    assert_difference("Reservationc.count") do
      post reservationcs_url, params: { reservationc: { name: @reservationc.name, start_time: @reservationc.start_time } }
    end

    assert_redirected_to reservationc_url(Reservationc.last)
  end

  test "should show reservationc" do
    get reservationc_url(@reservationc)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservationc_url(@reservationc)
    assert_response :success
  end

  test "should update reservationc" do
    patch reservationc_url(@reservationc), params: { reservationc: { name: @reservationc.name, start_time: @reservationc.start_time } }
    assert_redirected_to reservationc_url(@reservationc)
  end

  test "should destroy reservationc" do
    assert_difference("Reservationc.count", -1) do
      delete reservationc_url(@reservationc)
    end

    assert_redirected_to reservationcs_url
  end
end
