class ChangeColumnQtdeCnpjLead < ActiveRecord::Migration
  def change
  	change_column :leads, :qtde_cnpj, :integer
  end
end
