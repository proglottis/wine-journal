class AddWineIdToRatings < ActiveRecord::Migration
  def self.up
    add_column :ratings, :wine_id, :integer
  end

  def self.down
    remove_column :ratings, :wine_id
  end
end
