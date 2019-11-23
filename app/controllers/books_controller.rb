class BooksController < ApplicationController

    def index
        # @books = Book.all
        @q = Book.ransack(params[:q])
        # @books = @q.result
        @books = @q.result.page(params[:page])
        # @bshelf = @books.shelf.shelf_name
        # @books.shelf_id = "aaa"
        # @books = Book.page(params[:page]).per(20)
    end

    def show
        @book = Book.find(params[:id])
        # @shelf = @book.shelf_name
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        respond_to do |format|
            if @book.update(book_params)
                format.html { redirect_to @book, notice: 'Book was successfully updated.' }
                format.json { render :show, status: :ok, location: @book }
            else
                format.html { render :edit }
                format.json { render json: @book.errors, status: :unprocessable_entity }
            end
        end
    end

    def new
        @book = Book.new
    end

    def create
        book = Book.new(book_params)
        book.save!
        redirect_to books_path, notice: "書籍「#{book.title}」を登録しました。"
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        respond_to do |format|
            format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
    def search
        # @q = Book.search(search_params)
        # @q = Book.search(params)
        @q = Book.ransack(params[:q])
        @books = @q.result(distinct: true)
    end

    private

        def book_params
            params.require(:book).permit(:isbn_code, :title, :author, :publisher, :shelf_id)
        end

        # def search_params
        #     # params.require(:book).permit!
        #     params.require(:book).permit(:title)
        # end
end
