class AddUltimoAlterarToConta < ActiveRecord::Migration
  def change
    add_column :conta, :ultimoalterar_user_id, :integer, references: :users
  end
end
