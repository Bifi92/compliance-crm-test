# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

#Paises
  File.open("#{Rails.root}/db/paises.txt") do |paises|
    paises.read.each_line do |pais|
      nome = pais.chomp
      Country.create!(:nome => nome)
    end
  end

#Estados
  File.open("#{Rails.root}/db/estados.txt") do |estados|
    estados.read.each_line do |estado|
      nome, sigla = estado.chomp.split("|")
      Estado.create!(:country_id => Country.where(:nome => 'Brasil').take.id, :nome => nome, :sigla => sigla)
    end
  end

#Cidades
  File.open("#{Rails.root}/db/cidades.txt") do |cidades|
    cidades.read.each_line do |cidade|
      nome, ibge, uf,  = cidade.chomp.split("|")
      Cidade.create!(:estado_id => Estado.where(:sigla => uf).take.id, :nome => nome, :ibge => ibge)
    end
  end