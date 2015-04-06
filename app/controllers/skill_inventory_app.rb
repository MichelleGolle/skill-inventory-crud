class SkillInventoryApp < Sinatra::Base
  get '/' do
   haml :dashboard
  end

  get '/skills' do
    @skills = SkillInventory.all
    haml :index
  end

  get '/skills/new' do
    haml :new
  end

  post '/skills' do
    SkillInventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    haml :show
  end

  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    haml :edit
  end

  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, params[:skill])
    redirect "/skills/#{id}"
  end

  delete '/skills/:id' do |id|
    SkillInventory.destroy(id.to_i)
    redirect '/skills'
  end

  not_found do
    haml :error
  end

end
