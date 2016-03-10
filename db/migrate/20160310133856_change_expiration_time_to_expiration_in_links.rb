class ChangeExpirationTimeToExpirationInLinks < ActiveRecord::Migration
  def change
    rename_column :links, :expiration_time, :expiration
  end
end
