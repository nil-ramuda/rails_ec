# frozen_string_literal: true

class AddDetailToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :detail, :text
  end
end
