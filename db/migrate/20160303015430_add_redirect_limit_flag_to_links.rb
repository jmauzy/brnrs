class AddRedirectLimitFlagToLinks < ActiveRecord::Migration
  def change
    add_column :links, :redirect_limit_flag, :boolean, default: false
  end
end
