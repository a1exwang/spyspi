class Ed2kLink < ActiveRecord::Base
  has_one :base, dependent: :destroy, foreign_key: 'real_id', class_name: 'Link'
end