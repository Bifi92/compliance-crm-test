# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150130195513) do

  create_table "cidades", force: :cascade do |t|
    t.integer  "estado_id"
    t.string   "nome"
    t.string   "ibge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id"

  create_table "conta", force: :cascade do |t|
    t.string   "nome"
    t.string   "razao_social"
    t.string   "fantasia"
    t.string   "cpf_cnpj"
    t.integer  "qtde_funcionarios"
    t.string   "propriedade"
    t.string   "tipo_conta"
    t.string   "setor"
    t.float    "receita_anual"
    t.string   "fax"
    t.string   "telefone"
    t.string   "email_nfe"
    t.string   "site"
    t.string   "inscricao_municipal"
    t.string   "inscricao_estadual"
    t.string   "bairro_cobr"
    t.string   "rua_cobr"
    t.string   "numero_cobr"
    t.string   "complemento_cobr"
    t.string   "cep_cobr"
    t.string   "bairro_entr"
    t.string   "rua_entr"
    t.string   "numero_entr"
    t.string   "complemento_entr"
    t.string   "cep_entr"
    t.string   "descricao"
    t.boolean  "excluida"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "criador_user_id"
    t.integer  "proprietario_user_id"
    t.integer  "ultimoalterar_user_id"
    t.integer  "countrycobr_country_id"
    t.integer  "estadocobr_estado_id"
    t.integer  "cidadecobr_cidade_id"
    t.integer  "countryentr_country_id"
    t.integer  "estadoentr_estado_id"
    t.integer  "cidadeentr_cidade_id"
    t.string   "slug"
  end

  add_index "conta", ["slug"], name: "index_conta_on_slug"

  create_table "contatos", force: :cascade do |t|
    t.integer  "contum_id"
    t.integer  "contato_id"
    t.string   "saudacao"
    t.string   "sexo"
    t.string   "titulo"
    t.string   "nome"
    t.string   "sobrenome"
    t.date     "data_nascimento"
    t.string   "empresa"
    t.string   "departamento"
    t.string   "cpf"
    t.text     "descricao"
    t.string   "email_pessoal"
    t.string   "email_corporativo"
    t.string   "nome_assistente"
    t.string   "telefone_assistente"
    t.date     "data_devolucao_email"
    t.text     "motivo_devolucao_email"
    t.boolean  "recusar_emails"
    t.string   "fax"
    t.boolean  "recusar_fax"
    t.string   "telefone_residencial"
    t.string   "telefone_comercial"
    t.string   "celular"
    t.string   "outro_telefone"
    t.boolean  "recusar_telefonemas"
    t.string   "bairro_corre"
    t.string   "rua_corre"
    t.string   "numero_corre"
    t.string   "complemento_corre"
    t.string   "cep_corre"
    t.string   "bairro_corpo"
    t.string   "logradouro"
    t.string   "rua_corpo"
    t.string   "numero_corpo"
    t.string   "complemento_corpo"
    t.string   "cep_corpo"
    t.string   "esporte_preferido"
    t.string   "hobby"
    t.boolean  "excluido"
    t.string   "origem_lead"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "proprietario_user_id"
    t.integer  "ultimoalterar_user_id"
    t.integer  "countrycorre_country_id"
    t.integer  "estadocorre_estado_id"
    t.integer  "cidadecorre_cidade_id"
    t.integer  "countrycorpo_country_id"
    t.integer  "estadocorpo_estado_id"
    t.integer  "cidadecorpo_cidade_id"
    t.integer  "criador_user_id"
    t.string   "slug"
  end

  add_index "contatos", ["contato_id"], name: "index_contatos_on_contato_id"
  add_index "contatos", ["contum_id"], name: "index_contatos_on_contum_id"
  add_index "contatos", ["slug"], name: "index_contatos_on_slug", unique: true

  create_table "countries", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estados", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "estados", ["country_id"], name: "index_estados_on_country_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "leads", force: :cascade do |t|
    t.string   "saudacao"
    t.string   "empresa"
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "titulo"
    t.string   "status"
    t.text     "descricao"
    t.string   "erp"
    t.string   "solucao_fiscal"
    t.integer  "country_id"
    t.integer  "estado_id"
    t.integer  "cidade_id"
    t.string   "rua"
    t.string   "cep"
    t.string   "origem"
    t.string   "reconhecido"
    t.string   "classificacao"
    t.text     "motivo_desqualificacao"
    t.string   "orcamento_aprovado"
    t.boolean  "convertido",             default: false
    t.date     "data_da_conversao"
    t.string   "fax"
    t.string   "celular"
    t.string   "telefone"
    t.string   "recusar_telefonemas"
    t.string   "email"
    t.string   "recusar_emails"
    t.string   "site"
    t.integer  "qtde_funcionarios"
    t.integer  "qtde_cnpj"
    t.string   "setor"
    t.float    "receita_anual"
    t.text     "tipo_interesse"
    t.text     "produtos_interesse"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "criador_user_id"
    t.integer  "proprietario_user_id"
    t.integer  "ultimoalterar_user_id"
    t.string   "slug"
  end

  add_index "leads", ["cidade_id"], name: "index_leads_on_cidade_id"
  add_index "leads", ["country_id"], name: "index_leads_on_country_id"
  add_index "leads", ["estado_id"], name: "index_leads_on_estado_id"
  add_index "leads", ["slug"], name: "index_leads_on_slug"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
