class AddDefaultValueToPrivate < ActiveRecord::Migration
  def change
    change_column_default(:wikis, :private, from: nil, to: false)
  end
end
