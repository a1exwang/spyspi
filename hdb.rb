require 'rubygems'
require 'active_record'
require 'yaml'

# dbconfig = YAML::load(File.open('./db/config.yml'))
# ActiveRecord::Base.establish_connection(dbconfig)
ActiveRecord::Base.establish_connection(adapter: :sqlite3, database: 'db/development.sqlite3', pool: 5, timeout: 5000)

require './app/models/artist'
require './app/models/company'
require './app/models/ed2k_link'
require './app/models/file_link'
require './app/models/film'
require './app/models/link'
require './app/models/magnet_link'
require './app/models/tag'
require './app/models/series'
require './app/models/designation'

puts 'HDB environment established!'
