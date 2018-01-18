class CreateShowTimes < ActiveRecord::Migration
  def change
    create_table :show_times do |t|
    	t.string :time
      t.timestamps
    end
  end
end
