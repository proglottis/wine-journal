class CreateWines < ActiveRecord::Migration
  def self.up
    create_table :wines do |t|
      t.string :slug, :null => false
      t.string :name
      t.string :year
      t.string :producer
      t.string :grape
      t.float :alcohol
      t.string :region

      t.timestamps
    end
  end

  def self.down
    drop_table :wines
  end
end
