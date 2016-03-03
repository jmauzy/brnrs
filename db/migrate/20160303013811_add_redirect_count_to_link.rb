class AddRedirectCountToLink < ActiveRecord::Migration
  def change
    add_column :links, :redirect_count, :integer, default: 0
  end
end
