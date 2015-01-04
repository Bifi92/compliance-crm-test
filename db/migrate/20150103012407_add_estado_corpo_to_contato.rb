class AddEstadoCorpoToContato < ActiveRecord::Migration
  def change
    add_column :contatos, :estadocorpo_estado_id, :integer, references: :estado
  end
end
