class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.string :name
    	t.string :duration
    	t.string :movie_type
    	t.string :genre
    	t.boolean :is_bollywood, default: true
    	t.decimal :rating
      t.references :movie_hall, foreign_key: true
      t.references :audi, foreign_key: true
      t.timestamps
    end
  end
end
