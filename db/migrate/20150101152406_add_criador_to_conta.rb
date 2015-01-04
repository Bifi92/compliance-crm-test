class AddCriadorToConta < ActiveRecord::Migration
  def change
    add_column :conta, :criador_user_id, :integer, references: :users
  end
end
