class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w[Fiction Non-Fiction]}
    validate :title_to_be_true_facts

    def title_to_be_true_facts
        if title && !title.include?("Won't Believe" || "Secret" || "Top[number]" || "Guess")
           errors.add(:title, "Title must be clickbaitable")
        end
    end
end


