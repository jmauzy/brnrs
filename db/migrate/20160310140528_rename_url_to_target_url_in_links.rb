class RenameUrlToTargetUrlInLinks < ActiveRecord::Migration
  def change
    rename_column :links, :url, :target_url
  end
end
