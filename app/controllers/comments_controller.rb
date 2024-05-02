class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @gossip, notice: 'Commentaire ajouté avec succès.'
    else
      flash[:alert] = 'Vous devez être connecté pour poster un commentaire.'
      redirect_to new_user_session_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(params[:gossip_id]), notice: 'Le commentaire a été supprimé avec succès.'
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to gossip_path(@comment.gossip)
    else
      render 'edit'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :guest_name, :guest_email)
  end
end
