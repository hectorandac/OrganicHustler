class Product < ApplicationRecord
  has_many :sizes
  has_many :logos
  has_many :colors
  has_many :presets
  has_many :emblems
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :styles
  has_and_belongs_to_many :materials
  has_and_belongs_to_many :brands
  has_one :product_image

  def taxes
    TaxBand.find self.tax_band_id
  end

  def self.find_by_category(title)
    Category.find_by_title(title).products
  end

  def self.get_all_images(id)
    colors = Color.where(product_id: id)
    images = []
    colors.each do |color|
      color.product_images.each do |pictures|
        images.push [pictures.picture(:thumb), pictures.picture]
      end
    end
    images
  end

  def self.get_all_sizes(id)
    sizes = (Product.find id).sizes
    sizes
  end

end
