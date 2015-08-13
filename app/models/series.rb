class Series < ActiveRecord::Base
  self.table_name = :series
  has_many :designations
  # company, description
end