class AddShowDescCollapsedToQuery < ActiveRecord::Migration
  def self.up
    change_column :queries, :show_desc, :string, :default => "", :null => false, :limit => 30
    add_column :queries, :show_desc_collapsed, :boolean, :default => false
  end

  def self.down
    remove_column :queries, :show_desc
    remove_column :queries, :show_desc_collapsed
  end
end
