####### Lead ########

#1 - Criar os modelos, scaffold:
rails generate model country nome
rails generate model estado country:references nome sigla
rails generate model cidade estado:references nome ibge
rails generate scaffold lead saudacao empresa nome sobrenome titulo status descricao:text erp solucao_fiscal country:references estado:references cidade:references rua cep origem reconhecido classificacao motivo_desqualificacao:text orcamento_aprovado convertido data_da_conversao:date fax celular telefone recusar_telefonemas email recusar_emails site qtde_funcionarios qtde_cnpj setor receita_anual tipo_interesse:text produtos_interesse:text

#2 - Foi adicionado no script db/seeds.rb a "população" das tabelas cidade, estado e country;
# Arquivos adicionados em db/: cidades.txt, estados.txt e paises.txt.

#3 - Alterações no lead, adicionar campos relacionados a tabela USERS:
rails g migration add_criador_to_lead criador
rails g migration add_proprietario_to_lead proprietario
rails g migration add_ultimo_alterar_to_lead ultimo_alterar
# Alterar as migrações geradas, associando os campos a serem criados com a tabela USERS e
# somente depois executar rake db:migrate;

####### Conta ########

#1 - Scaffold conta sem os campos que possuem referencias
rails generate scaffold conta nome razao_social fantasia cpf_cnpj qtde_funcionarios propriedade tipo_conta setor receita_anual fax telefone email_nfe site inscricao_municipal inscricao_estadual bairro_cobr rua_cobr numero_cobr complemento_cobr cep_cobr bairro_entr rua_entr numero_entr complemento_entr cep_entr descricao excluida:boolean

#2 - Alterações na conta, adicionar campos relacionados a tabela USERS e Cidade/Estado/Pais:
rails g migration add_criador_to_conta criador
rails g migration add_proprietario_to_conta proprietario
rails g migration add_ultimo_alterar_to_conta ultimo_alterar
rails g migration add_country_cobr_to_conta country_cobr
rails g migration add_estado_cobr_to_conta estado_cobr
rails g migration add_cidade_cobr_to_conta cidade_cobr
rails g migration add_country_entr_to_conta country_entr
rails g migration add_estado_entr_to_conta estado_entr
rails g migration add_cidade_entr_to_conta cidade_entr
# Alterar as migrações geradas, associando os campos a serem criados com a tabela USERS 
# e Cidade/Estado/Pais, depois executar rake db:migrate;