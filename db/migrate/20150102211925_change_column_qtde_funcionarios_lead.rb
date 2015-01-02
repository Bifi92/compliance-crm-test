class ChangeColumnQtdeFuncionariosLead < ActiveRecord::Migration
  def change
  	change_column :leads, :qtde_funcionarios, :integer
  end
end
