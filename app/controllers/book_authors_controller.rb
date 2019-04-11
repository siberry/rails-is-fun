class BookAuthorsController < ApplicationController
  def destroy
    @book = BookAuthor.find(params[:id]).book
    BookAuthor.find(params[:id]).destroy
  #  @books = Book.all
    redirect_to @book
  end

end
