class AddProprietarioToConta < ActiveRecord::Migration
  def change
    add_column :conta, :proprietario_user_id, :integer, references: :users
  end
end
