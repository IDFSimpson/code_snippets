class Kind < ActiveRecord::Base
  has_many :snippets, dependant: :nullify

  validates :name, presence: true, uniqueness: true
end
