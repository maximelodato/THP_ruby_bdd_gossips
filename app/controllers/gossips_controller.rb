class GossipsController < ApplicationController
  before_action :set_user, only: [:index, :show, :contact]
  before_action :authenticate_user!, only: [:create]
  
  def show
    @gossip = Gossip.find_by(id: params[:id])
    if @gossip
      @comments = @gossip.comments
      @comment = @gossip.comments.build
    else
      redirect_to gossips_path, alert: 'Gossip not found.'
    end
  end

  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
    @user = User.new
  end

  def team
    @user = User.new
  end

  def contact
  end

  def create
    if params[:gossip_id].present?
      create_comment
    else
      create_gossip
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path, notice: 'Le potin a été supprimé avec succès.'
  end

  def confirm_delete
    @gossip = Gossip.find(params[:id])
  end

  private

  def create_gossip
    @gossip = current_user.gossips.build(gossip_params)
    if @gossip.save
      redirect_to root_url, notice: 'Le potin a été créé avec succès !'
    else
      render :new
    end
  end

  def create_comment
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @gossip, notice: 'Commentaire ajouté avec succès.'
    else
      render 'gossips/show'
    end
  end

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_user
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
