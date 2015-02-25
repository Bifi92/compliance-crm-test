# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

#Paises
  File.open("#{Rails.root}/db/paises.txt") do |paises|
    puts "================================================\n"
    puts "Países\n"
    puts "------------------------------------------------\n\n"

    quantidade = 0
    initial_time = Time.now
    paises.read.each_line do |pais|
      nome = pais.chomp
      Country.create!(:nome => nome)
      quantidade += 1
      puts "País #{quantidade}: #{nome} adicionado.\n"
    end
    delta_time = (Time.now - initial_time)

    puts "\n\n#{quantidade} países adicionados em %.2f segundos." % delta_time
    puts '================================================'
  end

#Estados
  File.open("#{Rails.root}/db/estados.txt") do |estados|
    puts "================================================\n"
    puts "Estados\n"
    puts "------------------------------------------------\n\n"

    quantidade = 0
    initial_time = Time.now
    estados.read.each_line do |estado|
      nome, sigla = estado.chomp.split("|")
      Estado.create!(:country_id => Country.where(:nome => 'Brasil').take.id, :nome => nome, :sigla => sigla)
      quantidade += 1
      puts "Estado #{quantidade}: #{nome} adicionado.\n"
    end
    delta_time = (Time.now - initial_time)

    puts "\n\n#{quantidade} estados adicionados em %.2f segundos." % delta_time
    puts '================================================'
  end

#Cidades
  File.open("#{Rails.root}/db/cidades.txt") do |cidades|
    puts "================================================\n"
    puts "Cidades\n"
    puts "------------------------------------------------\n\n"

    quantidade = 0
    initial_time = Time.now
    cidades.read.each_line do |cidade|
      nome, ibge, uf,  = cidade.chomp.split("|")
      Cidade.create!(:estado_id => Estado.where(:sigla => uf).take.id, :nome => nome, :ibge => ibge)
      quantidade += 1
      puts "Cidade #{quantidade}: #{nome} adicionada.\n"
    end
    delta_time = (Time.now - initial_time)

    puts "\n\n#{quantidade} cidades adicionadas em %.2f segundos." % delta_time
    puts '================================================'
  end
  
