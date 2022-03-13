require "application_system_test_case"

class MeetingsTest < ApplicationSystemTestCase
  setup do
    @meeting = meetings(:one)
  end

  test "visiting the index" do
    visit meetings_url
    assert_selector "h1", text: "Meetings"
  end

  test "should create meeting" do
    visit meetings_url
    click_on "Nova Reunião"

    fill_in "Termino", with: @meeting.end_time
    fill_in "Nome", with: @meeting.name
    fill_in "Inicio", with: @meeting.start_time
    fill_in "Usuario", with: @meeting.user_id
    click_on "Criar Reunião"

    assert_text "Meeting was successfully created"
    click_on "Back"
  end

  test "should update Meeting" do
    visit meeting_url(@meeting)
    click_on "Editar Reunião", match: :first

    fill_in "Termino", with: @meeting.end_time
    fill_in "Nome", with: @meeting.name
    fill_in "Inicio", with: @meeting.start_time
    fill_in "Usuario", with: @meeting.user_id
    click_on "Update Meeting"

    assert_text "Reunião marcada com sucesso!"
    click_on "Voltar"
  end

  test "should destroy Meeting" do
    visit meeting_url(@meeting)
    click_on "Destroy this meeting", match: :first

    assert_text "Meeting was successfully destroyed"
  end
end
