
require 'rest_client'

module HomeHelper

  @token = nil

  class << self
    attr_accessor :token
  end

  def self.generate_token
    moltin_client = Moltin::Api::Client
    if self.token.nil? || !moltin_client.authenticated?
      moltin_client.authenticate('client_credentials', client_id: 'RZsR5ErdxqMJNami9Bb7lOtDKy9ujFwaAb9bkCHm3s', client_secret: 'ffUhy8qZjb4vniRkHG9ZdoqEqIOpRBOGNqITVpbZpG')
    end
    self.token = moltin_client.access_token
    self.token
  end

  def get_products
    response = RestClient.get("https://#{Moltin::Config.api_host}/v1/products", {:Authorization => "Bearer #{HomeHelper.generate_token}"})
    JSON.parse(response.body)['result']
  end

  def get_image(id)
    response = RestClient.get("https://#{Moltin::Config.api_host}/v1/files/#{id}", {:Authorization => "Bearer #{HomeHelper.generate_token}"})
    result = JSON.parse(response.body)['result']
    "https://#{result['segments']['domain']}fit/w600/h600/#{result['segments']['suffix']}"
  end

  def get_regions(id)
    relations = RelationLogo.get_relation(id)
    if relations.nil?
      relations = RelationLogo.new(item_id: id, left_margin: 20, top_margin: 20, right_margin: 20, bottom_margin: 20)
      relations.save
    end
    relations
  end

  def self.get_product_by_id(id)
    response = RestClient.get("https://#{Moltin::Config.api_host}/v1/products/#{id}", {:Authorization => "Bearer #{self.generate_token}"})
    JSON.parse(response.body)['result']
  end

  def get_teaser(text)
    "#{text[0, 30]}"
  end

  def get_complete(text)
    "#{text[30..-1]}"
  end

  def get_showcase_items
    response = RestClient.get("https://#{Moltin::Config.api_host}/v1/products?limit=5", {:Authorization => "Bearer #{HomeHelper.generate_token}"})
    JSON.parse(response.body)['result']
  end

  def get_item_count
    user = current_user
    if user.nil?
      if session[:temp_user_id].nil?
        user = TempUser.create
        p ("user_created with id: #{user.id}")
        session[:temp_user_id] = user.id

      else
        user = TempUser.find(session[:temp_user_id])
      end
    end
    user.cart.n_products
  end

end
