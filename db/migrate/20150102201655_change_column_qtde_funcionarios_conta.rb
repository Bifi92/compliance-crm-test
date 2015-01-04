class ChangeColumnQtdeFuncionariosConta < ActiveRecord::Migration
  def change
  	change_column :conta, :qtde_funcionarios, :integer, :using :string
  end
end