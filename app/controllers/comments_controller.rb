class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @gossip, notice: 'Commentaire ajouté avec succès.'
    else
      flash[:alert] = 'Une erreur est survenue lors de la sauvegarde du commentaire.'
      redirect_to @gossip
    end
  end

  def destroy
    @comment.destroy
    redirect_to gossip_path(params[:gossip_id]), notice: 'Le commentaire a été supprimé avec succès.'
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to gossip_path(@comment.gossip), notice: 'Commentaire mis à jour avec succès.'
    else
      render 'edit'
    end
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
    unless @comment
      flash[:alert] = 'Commentaire non trouvé.'
      redirect_to root_path
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :guest_name, :guest_email)
  end

  def authenticate_user!
    unless current_user
      flash[:alert] = 'Vous devez être connecté pour poster un commentaire.'
      redirect_to new_user_session_path
    end
  end
end
