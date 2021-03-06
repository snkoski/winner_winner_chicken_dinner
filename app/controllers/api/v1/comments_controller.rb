class Api::V1::CommentsController < ApplicationController
  before_action :find_comment, only: [:update, :show]
  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    @comment
    render json: @comment
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      render json: @comment, status: :accepted
    else
      render json: { errors: @comment.errors.full_message }, status: :unprocessible_entity
    end
  end

  def create
    @comment = Comment.create(comment_params)
  end

  private

  def comment_params
    params.permit(:user_id, :post_id, :content)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
