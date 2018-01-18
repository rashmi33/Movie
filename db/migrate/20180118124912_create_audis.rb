class CreateAudis < ActiveRecord::Migration
  def change
    create_table :audis do |t|
    	t.string :code
    	t.integer :no_of_seats
    	t.references :movie_hall, foreign_key: true
      t.timestamps
    end
  end
end
