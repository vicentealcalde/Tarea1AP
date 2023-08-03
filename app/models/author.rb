class Author < ApplicationRecord
    has_many :books, dependent: :destroy
    def number_of_published_books
        books.count
      end
    
    def average_score
        total_reviews = books.joins(:reviews).pluck(:score)
        return 0 if total_reviews.empty?

        total_reviews.sum.to_f / total_reviews.size
    end

    def total_sales
        books.joins(:sales).sum(:number_of_sales)
    end
end
