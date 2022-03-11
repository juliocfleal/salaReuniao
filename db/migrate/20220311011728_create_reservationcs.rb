class CreateReservationcs < ActiveRecord::Migration[7.0]
  def change
    create_table :reservationcs do |t|
      t.string :name
      t.datetime :start_time

      t.timestamps
    end
  end
end
