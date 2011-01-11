class RemoveGrapeFromWines < ActiveRecord::Migration
  def self.up
    grapes = {}
    Wine.select('id, grape').each do |wine|
      grapes[wine.id] = wine.grape || ''
    end
    remove_column :wines, :grape
    Wine.all.each do |wine|
      wine.grape_list = grapes[wine.id].split(' ').join(', ')
      wine.save
    end
  end

  def self.down
    add_column :wines, :grape, :string
    Wine.all.each do |wine|
      wine.grape = wine.grape_list.join(' ')
      wine.save
    end
  end
end
