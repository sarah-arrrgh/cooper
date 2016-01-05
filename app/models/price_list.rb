class PriceList < ActiveRecord::Base
  require 'csv'
  belongs_to :supplier
  has_many :prices
  has_many :products, through: :prices

  def import(file)

    currentSection = ""
    currentCategory = ""
    currentBrand = "" 
    CSV.foreach(file.path, headers: true) do |row|
      line_hash = row.to_hash
      if (!parse_ceres_string(row, currentSection, currentCategory, currentBrand))
        create_product_price(parse_ceres_product(line_hash)) if parse_ceres_product(line_hash)
      end
    end    
  end
  def parse_ceres_string(line_hash, currentSection, currentCategory, currentBrand)
    
      if  ((line_hash["Ceres Product Code"])&& !line_hash["Product Description"])
        currentSection = line_hash["Ceres Product Code"] 
        return true       
      end
      if  ((!line_hash["Ceres Product Code"])&& line_hash["Product Description"] && line_hash["Product Description"].upcase == line_hash["Product Description"])
        currentCategory = line_hash["Product Description"]
        return true       
      end
      if  ((!line_hash["Ceres Product Code"])&& line_hash["Product Description"] && !(line_hash["Product Description"].upcase == line_hash["Product Description"]))
        currentBrand = line_hash["Product Description"]
        return true
      end      
      return false
  end
  def parse_ceres_product(line_hash)
    if (line_hash["Ceres Product Code"])&&(line_hash["Product Description"])
      return {"product_code"=>line_hash["Ceres Product Code"],
            "description"=>line_hash["Product Description"],
            "unit"=>parse_unit(line_hash["Unit Size"]),
            "qty_outer"=>parse_qty(line_hash["Quantity"]),
            "price_per_unit"=>parse_qty(line_hash["Unit Trade Price"])}   
    end
    return nil
  end
  def parse_unit(unit_size)
    return nil if (unit_size == "")
    return unit_size.gsub(/[\d]/, '')       
  end
  def parse_qty(qty)    
    return 1 if ((qty == "Each") || (qty == "")||!qty)
    return qty.gsub(/[a-zA-Z]|\s|\$/, '').to_f
  end
  def create_product_price(product_hash)
    price = product_hash.delete("price_per_unit"){ |el| "#{el} not found" }     
    product = self.supplier.products.find_by_product_code(product_hash["product_code"])
    if !product 
      # add product
      product = self.products.new(product_hash)          
    end
    # add price
    product.prices.new(price_per_unit:price)
  end
end
