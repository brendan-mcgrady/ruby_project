require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/tag')
also_reload('models/*')

# INDEX
get ('/tags') do
  @tags = Tag.all()
  erb(:"tags/index")
end

# NEW
get ('/tags/new') do
  erb(:"tags/new")
end

post ("/tags") do
  @tag = Tag.new(params)
  @tag.save()
  redirect to '/tags'
end
