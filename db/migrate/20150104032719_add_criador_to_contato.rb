class AddCriadorToContato < ActiveRecord::Migration
  def change
    add_column :contatos, :criador_user_id, :integer, references: :users
  end
end
