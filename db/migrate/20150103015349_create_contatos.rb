class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.references :contum, index: true
      t.references :contato, index: true
      t.string :saudacao
      t.string :sexo
      t.string :titulo
      t.string :nome
      t.string :sobrenome
      t.date :data_nascimento
      t.string :empresa
      t.string :departamento
      t.string :cpf
      t.text :descricao
      t.string :email_pessoal
      t.string :email_corporativo
      t.string :nome_assistente
      t.string :telefone_assistente
      t.date :data_devolucao_email
      t.text :motivo_devolucao_email
      t.boolean :recusar_emails
      t.string :fax
      t.boolean :recusar_fax
      t.string :telefone_residencial
      t.string :telefone_comercial
      t.string :celular
      t.string :outro_telefone
      t.boolean :recusar_telefonemas
      t.string :bairro_corre
      t.string :rua_corre
      t.string :numero_corre
      t.string :complemento_corre
      t.string :cep_corre
      t.string :bairro_corpo
      t.string :logradouro
      t.string :rua_corpo
      t.string :numero_corpo
      t.string :complemento_corpo
      t.string :cep_corpo
      t.string :esporte_preferido
      t.string :hobby
      t.boolean :excluido
      t.string :origem_lead

      t.timestamps null: false
    end
    add_foreign_key :contatos, :conta
    add_foreign_key :contatos, :contatos
  end
end
