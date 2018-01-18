class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
    	t.string :code
    	t.string :seat_no
    	t.references :type_of_ticket, foreign_key: true
      t.references :show_time, foreign_key: true
      t.timestamps
    end
  end
end
