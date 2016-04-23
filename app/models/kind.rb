class Kind < ActiveRecord::Base
  has_many :snippets, dependant: :nullify
end
