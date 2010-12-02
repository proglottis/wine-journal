class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.decimal :cost
      t.boolean :special
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
