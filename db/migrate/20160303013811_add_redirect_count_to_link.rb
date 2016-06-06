class AddRedirectCountToLink < ActiveRecord::Migration
  def change
    add_column :links, :redirect_count, :bigint, default: 0
  end
end
