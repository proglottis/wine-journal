class RemoveValueFromRating < ActiveRecord::Migration
  def self.up
    remove_column :ratings, :value
  end

  def self.down
    add_column :ratings, :value, :integer
  end
end
