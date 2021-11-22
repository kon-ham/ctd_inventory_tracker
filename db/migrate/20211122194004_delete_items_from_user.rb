class DeleteItemsFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :item, null: false, foreign_key: true
  end
end
