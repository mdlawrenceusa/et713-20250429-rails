require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New student"

    fill_in "Address", with: @student.address
    check "Calls" if @student.calls
    fill_in "City", with: @student.city
    check "Climate change" if @student.climate_change
    check "Consumer" if @student.consumer
    check "Democracy" if @student.democracy
    fill_in "Email", with: @student.email
    fill_in "First name", with: @student.first_name
    check "Higher ed" if @student.higher_ed
    check "Internship" if @student.internship
    fill_in "Last name", with: @student.last_name
    check "Mass transit" if @student.mass_transit
    fill_in "Phone", with: @student.phone
    check "Poverty" if @student.poverty
    fill_in "State", with: @student.state
    check "Texts" if @student.texts
    fill_in "Zip code", with: @student.zip_code
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "should update Student" do
    visit student_url(@student)
    click_on "Edit this student", match: :first

    fill_in "Address", with: @student.address
    check "Calls" if @student.calls
    fill_in "City", with: @student.city
    check "Climate change" if @student.climate_change
    check "Consumer" if @student.consumer
    check "Democracy" if @student.democracy
    fill_in "Email", with: @student.email
    fill_in "First name", with: @student.first_name
    check "Higher ed" if @student.higher_ed
    check "Internship" if @student.internship
    fill_in "Last name", with: @student.last_name
    check "Mass transit" if @student.mass_transit
    fill_in "Phone", with: @student.phone
    check "Poverty" if @student.poverty
    fill_in "State", with: @student.state
    check "Texts" if @student.texts
    fill_in "Zip code", with: @student.zip_code
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "should destroy Student" do
    visit student_url(@student)
    click_on "Destroy this student", match: :first

    assert_text "Student was successfully destroyed"
  end
end
