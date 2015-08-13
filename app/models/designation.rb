class Designation < ActiveRecord::Base
  self.table_name = :designations
  has_one :film
  belongs_to :series, class_name: 'Series'
  # name, series, film
end