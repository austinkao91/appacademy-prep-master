class TagsController < ApplicationController
  include TagsHelper
  before_filter :require_login, only: [:destroy]
  def show
    @tag = Tag.find(params[:id])
  end
  
  def index
    @tag = Tag.all
  end
  
  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to article_path(@tag.article)
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to article_path(@tag.article)
  end

end
