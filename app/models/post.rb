class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  # accepts_nested_attributes_for :categories => does not solve duplication

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |name|
      category = Category.find_or_create_by(name)
      if !self.categories.include?(category)
        # self.categories << category => this is in-efficient and not ideal
        self.post_categories.build(category: category)
      end 
    end 
  end 
end