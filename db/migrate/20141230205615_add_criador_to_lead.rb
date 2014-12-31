class AddCriadorToLead < ActiveRecord::Migration
  def change
    add_column :leads, :criador_user_id, :integer, references: :users
  end
end