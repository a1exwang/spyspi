class Company < ActiveRecord::Base
  has_many :films
  # name
end