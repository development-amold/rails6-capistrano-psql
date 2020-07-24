class AddDisplaytitleToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :displayname, :string
  end
end
