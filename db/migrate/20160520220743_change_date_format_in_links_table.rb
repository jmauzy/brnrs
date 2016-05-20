class ChangeDateFormatInLinksTable < ActiveRecord::Migration
  def change
    change_column :links, :expiration, :integer, :limit => 10
  end
end
