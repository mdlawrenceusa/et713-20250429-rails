json.extract! student, :id, :first_name, :last_name, :phone, :email, :address, :city, :state, :zip_code, :texts, :calls, :internship, :higher_ed, :climate_change, :democracy, :poverty, :mass_transit, :consumer, :created_at, :updated_at
json.url student_url(student, format: :json)
