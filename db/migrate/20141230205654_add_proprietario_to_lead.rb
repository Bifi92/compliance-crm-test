class AddProprietarioToLead < ActiveRecord::Migration
  def change
    add_column :leads, :proprietario_user_id, :integer, references: :users
  end
end