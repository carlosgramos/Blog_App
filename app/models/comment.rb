class Comment < ApplicationRecord
  belongs_to :article
  #The references keyword used in bash is a special data type for models.
  #It creates a foreign key on the :article table.
end
