class CreateMovieHalls < ActiveRecord::Migration
  def change
    create_table :movie_halls do |t|
    	t.string :name
    	t.string :address
    	t.string :city
      t.timestamps
    end
  end
end
