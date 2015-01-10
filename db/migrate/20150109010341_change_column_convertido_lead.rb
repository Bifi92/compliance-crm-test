class ChangeColumnConvertidoLead < ActiveRecord::Migration
  def change
  	change_column :leads, :convertido, :boolean, :default => false
  end
end