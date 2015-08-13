class Artist < ActiveRecord::Base
  has_many :films
  # name, name_eng, name_jp, height, birthday, cup, bust, waistline, hip, created_at, updated_at
end