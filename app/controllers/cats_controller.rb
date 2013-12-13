class CatsController < ApplicationController
  before_filter :require_current_user
  before_filter :require_user_to_be_owner, :only => [ :edit, :update ]

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    params[:cat][:user_id] = current_user.id
    @cat = Cat.new(params[:cat])

    if @cat.save
      redirect_to cat_url(@cat)
    else
      @error_messages = @cat.errors.full_messages
      render :new
    end
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.update_attributes(params[:cat])
      redirect_to cat_url(@cat)
    else
      @error_messages = @cat.errors.full_messages
      render :edit
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end
end
