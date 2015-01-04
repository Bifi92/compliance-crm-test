class AddCidadeEntrToConta < ActiveRecord::Migration
  def change
    add_column :conta, :cidadeentr_cidade_id, :integer, references: :cidade
  end
end
