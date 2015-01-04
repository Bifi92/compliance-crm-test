class AddEstadoEntrToConta < ActiveRecord::Migration
  def change
    add_column :conta, :estadoentr_estado_id, :integer, references: :estado
  end
end
