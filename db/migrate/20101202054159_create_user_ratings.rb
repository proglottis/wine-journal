class CreateUserRatings < ActiveRecord::Migration
  def self.up
    create_table :user_ratings do |t|
      t.integer :user_id
      t.integer :rating_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_ratings
  end
end
