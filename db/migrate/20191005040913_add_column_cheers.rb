class AddColumnCheers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cheer, :integer, default: 0
  end
end
