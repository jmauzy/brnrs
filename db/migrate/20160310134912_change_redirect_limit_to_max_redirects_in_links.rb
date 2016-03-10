class ChangeRedirectLimitToMaxRedirectsInLinks < ActiveRecord::Migration
  def change
    rename_column :links, :redirect_limit, :max_redirects
  end
end
