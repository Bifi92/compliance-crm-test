class AddUltimoAlterarToContato < ActiveRecord::Migration
  def change
    add_column :contatos, :ultimoalterar_user_id, :integer, references: :users
  end
end
