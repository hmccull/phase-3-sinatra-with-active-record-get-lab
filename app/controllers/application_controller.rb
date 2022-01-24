class ApplicationController < Sinatra::Base

  # set Content-Type header for all responses
  set :default_content_type, 'application/json'

  # add routes

  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # look up the game in the database using its ID
    bakery = Bakery.find(params[:id])
    # send a JSON-formatted response of the game data
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    # see the BakedGood class for the method definitions of .by_price
    goods = BakedGood.by_price
    goods.to_json
  end

  get '/baked_goods/most_expensive' do
    goods = BakedGood.most_expensive
    goods.to_json
  end

end
