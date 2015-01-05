class ChangeColumnQtdeFuncionariosConta < ActiveRecord::Migration
  def self.up
    change_table :tablename do |t|
      t.change :conta, :qtde_funcionarios, :string
    end
  end
  def self.down
    change_table :tablename do |t|
      t.change :conta, :qtde_funcionarios, :integer
    end
  end
end