class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :destination
      t.date :arrival_date
      t.text :duration
      t.text :reflections
      t.integer :user_id
    end
  end
end
