class ImportCsv < ApplicationRecord
    # CSVデータのパスを引数として受け取り、インポート処理を実行
    # 実行コマンド| ImportCsv.import('db/csv_data/csv_data_test.csv')
    def self.import(path)
        Book.delete_all
        CSV.foreach(path, headers: true) do |row|
            Book.create(
                isbn_code: row["isbn_code"],
                title: row["title"],
                author: row["author"],
                publisher: row["publisher"],
                shelf_id: 1
            )
        end
    end
end

# class ImportCsv < ApplicationRecord
#     # CSVデータのパスを引数として受け取り、インポート処理を実行
#     def self.books_data
#         # インポートするファイルのパスを取得
#         path = File.join Rails.root, "db/csv_data/csv_data_test.csv"
#         # インポートするデータを格納するための配列
#         list = []
#         # CSVファイルからインポートするデータを取得し配列に格納
#         CSV.foreach(path, headers: true) do |row|
#             list << {
#                 isbn_code: row["isbn_code"],
#                 title: row["title"],
#                 author: row["author"],
#                 publisher: row["publisher"]
#             }
#         end
#         puts "インポート処理を開始"
#         # インポートができなかった場合の例外処理
#         begin
#             Book.create!(list)
#             puts "インポート完了!!"
#         rescue ActiveModel::UnknownAttributeError => invalid
#             puts "インポートに失敗：UnknownAttributeError"
#         end
#     end
# end