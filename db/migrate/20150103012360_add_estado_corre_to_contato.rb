class AddEstadoCorreToContato < ActiveRecord::Migration
  def change
    add_column :contatos, :estadocorre_estado_id, :integer, references: :estado
  end
end
