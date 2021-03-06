class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :person_num
      t.integer :total_price
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
