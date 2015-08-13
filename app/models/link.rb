class Link < ActiveRecord::Base
  belongs_to :real, polymorphic: true, foreign_key: 'real_id', foreign_type: 'type'
  belongs_to :film
end