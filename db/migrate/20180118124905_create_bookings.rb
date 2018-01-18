class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
    	t.datetime :date_of_movie
    	t.integer :no_of_persons
    	t.decimal :amount
    	t.string :seats_alloted
    	t.references :user, foreign_key: true
      t.references :ticket, foreign_key: true
      t.references :movie, foreign_key: true
      t.timestamps
    end
  end
end
