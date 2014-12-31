json.array!(@leads) do |lead|
  json.extract! lead, :id, :saudacao, :empresa, :nome, :sobrenome, :titulo, :status, :descricao, :erp, :solucao_fiscal, :country_id, :estado_id, :cidade_id, :rua, :cep, :origem, :reconhecido, :classificacao, :motivo_desqualificacao, :orcamento_aprovado, :convertido, :data_da_conversao, :fax, :celular, :telefone, :recusar_telefonemas, :email, :recusar_emails, :site, :qtde_funcionarios, :qtde_cnpj, :setor, :receita_anual, :tipo_interesse, :produtos_interesse
  json.url lead_url(lead, format: :json)
end
