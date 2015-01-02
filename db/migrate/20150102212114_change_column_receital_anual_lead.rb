class ChangeColumnReceitalAnualLead < ActiveRecord::Migration
  def change
  	change_column :leads, :receita_anual, :float
  end
end
