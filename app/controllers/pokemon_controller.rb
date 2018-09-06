class PokemonController < ApplicationController

  def index
    # #render json: { "message": "ok" }
    # res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/")
    # body = JSON.parse(res.body)
    # puts body["name"] # should be "pikachu"
    # res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=pikachu&rating=g")
    #
    # body = JSON.parse(res.body)
    #
    # render json: {"name": body["name"], "id": body["id"], "types": body["types"], "gif": }



  end

  def show
    @id = params[:id]
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{@id}")
    body = JSON.parse(res.body)
    # render json: {"id": @id, "name": body["name"], "types": body["types"]}

      # gif_res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=#{body["name"]}&rating=g")
      puts ENV["GIPHY_KEY"]
          gif_res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}=#{body["name"]}&rating=g")

      gif_body = JSON.parse(gif_res.body)
      puts gif_body
      url = gif_body["data"][0]["url"]
      render json: {"id": body["id"], "name": body["name"], "types": body["types"], "gif": url}
  end
end
