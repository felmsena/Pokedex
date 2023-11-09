class Pokemon < ApplicationRecord
  serialize :types, type: Array, coder: JSON
end
