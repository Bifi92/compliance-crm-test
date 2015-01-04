class AddCidadeCorpoToContato < ActiveRecord::Migration
  def change
    add_column :contatos, :cidadecorpo_cidade_id, :integer, references: :cidade
  end
end
