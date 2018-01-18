class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
      t.string :address
      t.string :city
      t.string :phone_no
      t.references :movie_hall, foreign_key: true
      t.references :audi, foreign_key: true
      t.timestamps
    end
  end
end
