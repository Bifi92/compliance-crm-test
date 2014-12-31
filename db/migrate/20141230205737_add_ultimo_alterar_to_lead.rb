class AddUltimoAlterarToLead < ActiveRecord::Migration
  def change
    add_column :leads, :ultimoalterar_user_id, :integer, references: :users
  end
end