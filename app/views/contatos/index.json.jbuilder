json.array!(@contatos) do |contato|
  json.extract! contato, :id, :contum_id, :contato_id, :saudacao, :sexo, :titulo, :nome, :sobrenome, :data_nascimento, :empresa, :departamento, :cpf, :descricao, :email_pessoal, :email_corporativo, :nome_assistente, :telefone_assistente, :data_devolucao_email, :motivo_devolucao_email, :recusar_emails, :fax, :recusar_fax, :telefone_residencial, :telefone_comercial, :celular, :outro_telefone, :recusar_telefonemas, :bairro_corre, :rua_corre, :numero_corre, :complemento_corre, :cep_corre, :bairro_corpo, :logradouro, :rua_corpo, :numero_corpo, :complemento_corpo, :cep_corpo, :esporte_preferido, :hobby, :excluido, :origem_lead
  json.url contato_url(contato, format: :json)
end
