class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories, reject_if: :all_blank

  # def categories_attributes=(categories_attributes)
  #   categories_attributes.values.each do |name|
  #     category = Category.find_or_create_by(name)
  #     self.categories << category
  #   end 
  # end 
end
