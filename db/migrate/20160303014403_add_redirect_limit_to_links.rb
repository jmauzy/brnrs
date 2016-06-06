class AddRedirectLimitToLinks < ActiveRecord::Migration
  def change
    add_column :links, :redirect_limit, :bigint, default: 0
  end
end
