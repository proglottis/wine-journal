class AddRankToRating < ActiveRecord::Migration
  def self.up
    add_column :ratings, :rank_id, :integer
  end

  def self.down
    remove_column :ratings, :rank_id
  end
end
