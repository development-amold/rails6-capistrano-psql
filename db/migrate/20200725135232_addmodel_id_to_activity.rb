class AddmodelIdToActivity < ActiveRecord::Migration[6.0]
  def up
    add_column :activities, :model_id, :integer
  end
end
