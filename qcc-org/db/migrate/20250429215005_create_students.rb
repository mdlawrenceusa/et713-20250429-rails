class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.boolean :texts
      t.boolean :calls
      t.boolean :internship
      t.boolean :higher_ed
      t.boolean :climate_change
      t.boolean :democracy
      t.boolean :poverty
      t.boolean :mass_transit
      t.boolean :consumer

      t.timestamps
    end
  end
end
