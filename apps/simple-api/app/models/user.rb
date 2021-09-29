class User < ApplicationRecord
  include Flipper::Identifier

  validates :name, :role, presence: true
end
