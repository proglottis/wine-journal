class RemoveSlugFromWines < ActiveRecord::Migration
  def self.up
    remove_column :wines, :slug
  end

  def self.down
    add_column :wines, :slug, :string
  end
end
