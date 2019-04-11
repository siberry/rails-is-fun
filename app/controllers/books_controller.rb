class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @authors_to_add = Author.all.select {|author| !@book.authors.include?(author)}
    @book_authors = BookAuthor.where(book_id: params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @author_to_add = Author.find(params[:book][:author_ids])
    @book.authors << @author_to_add
    redirect_to @book
  end
end
