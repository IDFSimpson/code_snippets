class Kind < ActiveRecord::Base
  has_many :snippets, dependent: :nullify

  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}
end
