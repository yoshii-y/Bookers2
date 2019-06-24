class BooksController < ApplicationController

  def top
  end

  def index
    @books=Book.all
    @book=Book.new
    @user=User.find_by(id: current_user.id)
  end
  
  def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  
  if @book.save
    flash[:notice] = "successfully"
    redirect_to books_path
  else
    render books_path
  end
  
  
    # book=Book.new(book_params)
    # book.save
    # flash[:notice] = "successfully"
    # redirect_to "/books/#{book.id}"

  
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path
  end
  
  private
    def book_params
      params.require(:book).permit(:title, :opinion)
    end  
end
