class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(params.require(:author).permit(:name, :birth_year))
    if @author.valid?
      redirect_to @author
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:name, :birth_year))
      @author.save
      redirect_to @author
    else
      render :edit
    end
  end

  def destroy
    Author.find(params[:id]).destroy
    redirect_to authors_path
  end
end
