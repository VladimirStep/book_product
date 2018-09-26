class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update]

  def index
    @books = Book.includes(:authors).all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book created!'
    else
      flash.now[:alert] = 'Error creating a book!'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book updated!'
    else
      flash.now[:alert] = 'Error updating a book!'
      render :edit
    end
  end

  def report
    @books = Book.released_in(2018)
  end

  private

  def book_params
    params.require(:book).permit(:title, :release_date, :base_price,
                                 :currency, :format, author_ids: [])
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
