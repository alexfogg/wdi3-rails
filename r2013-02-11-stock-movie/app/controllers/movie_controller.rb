class MovieController < ApplicationController
  def new
  end

  def submitmovie
  if params[:title].present?
    name = params[:title].gsub(' ', '+')
    url = "http://www.omdbapi.com/?t=#{name}"
    html = HTTParty.get(url)
    @hash = JSON(html)
    render 'poster'
  end

  def poster
  end
end

end