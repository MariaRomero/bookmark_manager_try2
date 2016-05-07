require './app/data_mapper_setup'

class Tag
  include DataMapper::Resource

  #has n, :links, :through => Resource

  property :id,  Serial
  property :name, String

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
