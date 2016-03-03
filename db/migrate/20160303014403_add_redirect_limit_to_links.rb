class AddRedirectLimitToLinks < ActiveRecord::Migration
  def change
    add_column :links, :redirect_limit, :integer, default: 0
  end
end
