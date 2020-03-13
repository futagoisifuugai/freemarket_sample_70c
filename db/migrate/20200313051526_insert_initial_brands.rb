class InsertInitialBrands < ActiveRecord::Migration[5.2]
  def change
    brands = ["ナイキ", "シャネル", "asos", "アディダス"]
    brands.each do |brand|
      Brand.create(name: brand)
    end
  end
end



