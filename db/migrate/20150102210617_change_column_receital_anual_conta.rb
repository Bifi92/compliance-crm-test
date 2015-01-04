class ChangeColumnReceitalAnualConta < ActiveRecord::Migration
  def change
  	change_column :conta, :receita_anual, :float
  end
end
