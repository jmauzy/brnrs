class RemoveRedirectLimitFlagFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :redirect_limit_flag
  end
end
