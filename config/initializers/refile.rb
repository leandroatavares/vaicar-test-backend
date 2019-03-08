require "refile/s3"

# backend = Refile::Backend::S3.new(
#   access_key_id: ENV["AWS_ACCESS_KEY_ID"],
#   secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
#   bucket: "vaicar-test",
# )
# file = backend.upload(StringIO.new("hello"))
# backend.read(file.id) # => "hello"

aws = {
  region: "us-east-2",
  access_key_id: ENV["AWS_ACCESS_KEY_ID"],
  secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
  bucket: "vaicar-test",
}

if Rails.env.test? || Rails.env.development?
  Refile.cache = Refile::S3.new(prefix: "platform/develop/cache", **aws)
  Refile.store = Refile::S3.new(prefix: "platform/develop/store", **aws)
elsif Rails.env.production?
  Refile.cache = Refile::S3.new(prefix: "platform/prod/cache", **aws)
  Refile.store = Refile::S3.new(prefix: "platform/prod/store", **aws)
end
