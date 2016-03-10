class RenameRedirectCountToRedirectsInLinks < ActiveRecord::Migration
  def change
    rename_column :links, :redirect_count, :redirects
  end
end
