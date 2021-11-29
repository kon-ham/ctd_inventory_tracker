class RemoveItemReferenceToUser < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :items
  end
end
