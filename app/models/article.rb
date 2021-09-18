class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user # campo adicional
  has_many :has_categories
  has_many :categories, through: :has_categories
  attr_accessor :category_elements

  def save_categories
    # category_elements 1,2,3,4
    # Convertir en arreglo 1,2,3,4 => [1,2,3,4]
    categories_array = category_elements.split(",")
    # Iterar el arreglo
	categories_array.each do |category_id|
		# Crear HasCategory HasCategory<article_id: 1, category_id:2>
		HasCategory.create(article: self, category_id: category_id)
	end
  end
end
