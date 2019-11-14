class ApplicationController < ActionController::Base
    before_action :set_search

    def set_search
        @search = Book.ransack(params[:q])
        @search_books = @search.result
    end
end

# ここを参考に。
# https://qiita.com/fukudakumi/items/58e3b5d9a776d98a62de