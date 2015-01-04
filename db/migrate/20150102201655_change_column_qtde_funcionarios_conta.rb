class ChangeColumnQtdeFuncionariosConta < ActiveRecord::Migration
  def change
  	change_column :conta, :qtde_funcionarios, :integer
  end
end