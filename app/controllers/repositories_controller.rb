class RepositoriesController < ApplicationController

  def search

  end

  def github_search
     @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = "476eefe204e368e2039e"
        req.params['client_secret'] = b79f80136c1e51fbd1d5c08bc553a6171212381c
        req.params['q'] = params[:query]
    end
      body = JSON.parse(@resp.body)
      @repositories = body["items"]
      render 'search'
  end
end
