class AddProprietarioToContato < ActiveRecord::Migration
  def change
    add_column :contatos, :proprietario_user_id, :integer, references: :users
  end
end
