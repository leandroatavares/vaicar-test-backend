class Publication < ApplicationRecord 
  extend Refile::Attachment
  attachment :publication_image
  attr_accessor :publication_image_id
end



# Publication.new
# # or a StringIO
# publication.publication_image = StringIO.new("hello world")

# publication.publication_image.id # => "fec421..."
# publication.publication_image.read # => "hello world"




# backend = Refile::Backend::FileSystem.new("tmp")

# file = backend.upload(StringIO.new("hello"))