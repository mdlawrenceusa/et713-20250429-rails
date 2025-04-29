require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference("Student.count") do
      post students_url, params: { student: { address: @student.address, calls: @student.calls, city: @student.city, climate_change: @student.climate_change, consumer: @student.consumer, democracy: @student.democracy, email: @student.email, first_name: @student.first_name, higher_ed: @student.higher_ed, internship: @student.internship, last_name: @student.last_name, mass_transit: @student.mass_transit, phone: @student.phone, poverty: @student.poverty, state: @student.state, texts: @student.texts, zip_code: @student.zip_code } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { address: @student.address, calls: @student.calls, city: @student.city, climate_change: @student.climate_change, consumer: @student.consumer, democracy: @student.democracy, email: @student.email, first_name: @student.first_name, higher_ed: @student.higher_ed, internship: @student.internship, last_name: @student.last_name, mass_transit: @student.mass_transit, phone: @student.phone, poverty: @student.poverty, state: @student.state, texts: @student.texts, zip_code: @student.zip_code } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
