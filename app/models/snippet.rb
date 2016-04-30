class Snippet < ActiveRecord::Base
  belongs_to :kind
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :work,  presence: true
end
