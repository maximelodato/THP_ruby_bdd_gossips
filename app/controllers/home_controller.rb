def show
    @gossip = Gossip.find(params[:id])
  end
  