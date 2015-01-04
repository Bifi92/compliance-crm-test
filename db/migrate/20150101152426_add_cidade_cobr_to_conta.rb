class AddCidadeCobrToConta < ActiveRecord::Migration
  def change
    add_column :conta, :cidadecobr_cidade_id, :integer, references: :cidade
  end
end
