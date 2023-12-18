class AddAdditionalsAttrsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :date_of_joining, :date
    add_column :employees, :bio, :text
  end
end
