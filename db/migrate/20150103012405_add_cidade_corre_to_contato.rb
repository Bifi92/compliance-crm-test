class AddCidadeCorreToContato < ActiveRecord::Migration
  def change
    add_column :contatos, :cidadecorre_cidade_id, :integer, references: :cidade
  end
end
