class PetProject < ApplicationRecord
  serialize :images, coder: JSON
  serialize :languages, coder: JSON
  serialize :libraries, coder: JSON
  serialize :resources, coder: JSON
end
