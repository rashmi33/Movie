class CreateTypeOfTickets < ActiveRecord::Migration
  def change
    create_table :type_of_tickets do |t|
    	t.string :type_of_ticket
      t.timestamps
    end
  end
end
