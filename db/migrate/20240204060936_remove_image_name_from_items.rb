class RemoveImageNameFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :image_name, :string
  end
end
