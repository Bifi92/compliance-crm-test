class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :saudacao
      t.string :empresa
      t.string :nome
      t.string :sobrenome
      t.string :titulo
      t.string :status
      t.text :descricao
      t.string :erp
      t.string :solucao_fiscal
      t.references :country, index: true
      t.references :estado, index: true
      t.references :cidade, index: true
      t.string :rua
      t.string :cep
      t.string :origem
      t.string :reconhecido
      t.string :classificacao
      t.text :motivo_desqualificacao
      t.string :orcamento_aprovado
      t.boolean :convertido, :default => false
      t.date :data_da_conversao
      t.string :fax
      t.string :celular
      t.string :telefone
      t.string :recusar_telefonemas
      t.string :email
      t.string :recusar_emails
      t.string :site
      t.integer :qtde_funcionarios
      t.integer :qtde_cnpj
      t.string :setor
      t.float :receita_anual
      t.text :tipo_interesse
      t.text :produtos_interesse

      t.timestamps null: false
    end
    add_foreign_key :leads, :countries
    add_foreign_key :leads, :estados
    add_foreign_key :leads, :cidades
  end
end
