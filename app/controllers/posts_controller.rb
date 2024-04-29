class PostsController < ApplicationController
  def index
    @gossips = Gossip.all
  end
end