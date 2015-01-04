class AddEstadoCobrToConta < ActiveRecord::Migration
  def change
    add_column :conta, :estadocobr_estado_id, :integer, references: :estado
  end
end
