class CreateConta < ActiveRecord::Migration
  def change
    create_table :conta do |t|
      t.string :nome
      t.string :razao_social
      t.string :fantasia
      t.string :cpf_cnpj
      t.integer :qtde_funcionarios
      t.string :propriedade
      t.string :tipo_conta
      t.string :setor
      t.float :receita_anual
      t.string :fax
      t.string :telefone
      t.string :email_nfe
      t.string :site
      t.string :inscricao_municipal
      t.string :inscricao_estadual
      t.string :bairro_cobr
      t.string :rua_cobr
      t.string :numero_cobr
      t.string :complemento_cobr
      t.string :cep_cobr
      t.string :bairro_entr
      t.string :rua_entr
      t.string :numero_entr
      t.string :complemento_entr
      t.string :cep_entr
      t.string :descricao
      t.boolean :excluida

      t.timestamps null: false
    end
  end
end
