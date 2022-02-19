class Post < ApplicationRecord
 validates :title, presence: true
 validates :content, length: {minimum: 250 }
 validates :summary, length: {maximum: 250 }
 validates :category, inclusion: ["Fiction", "Non-Fiction"]

 validate :title_is_clickbait

 def title_is_clickbait
  unless self.title && self.title.match(/Won't Believe|Secret|Top \d+|Guess/)
   errors.add(:title, "is not clickbaity")
  end
 end
end
