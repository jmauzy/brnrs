class AddUrlHashToLink < ActiveRecord::Migration
  def change
    add_column :links, :url_hash, :string
  end
end
