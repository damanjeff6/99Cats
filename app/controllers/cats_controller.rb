class CatsController < ApplicationController

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
