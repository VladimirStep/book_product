module Api
  module V1
    class BooksController < ApiController
      def index
        books = Book.includes(:authors).all
        render json: books
      end

      def show
        book = Book.find(params[:id])
        render json: book, serializer: BookDetailsSerializer
      end

      def create
        book = Book.new(book_params)
        if book.save
          head :no_content
        else
          render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def book_params
        params.require(:book).permit(:title, :release_date, :base_price,
                                     :currency, :format, author_ids: [])
      end
    end
  end
end