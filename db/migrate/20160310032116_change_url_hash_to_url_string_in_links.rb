class ChangeUrlHashToUrlStringInLinks < ActiveRecord::Migration
  def change
    rename_column :links, :url_hash, :url_string
  end
end
