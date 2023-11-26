module PriceCalculatorHelper
  def self.price_of_item(item, quantity)
    item_price = Item.select(:id, :unit_price, :sales_price, :min_sales_unit, :image_url).where(name: item).first

    sale_price = item_price[:sales_price]
    min_sales_unit = item_price[:min_sales_unit]
    unit_price = item_price[:unit_price]

    cost_without_sales = quantity * unit_price

    unless sale_price && min_sales_unit <= quantity
      return { price: cost_without_sales, savings: 0, image_url: item_price[:image_url] }
    end

    normal_price_units = quantity % min_sales_unit
    sales_price_units = (quantity - normal_price_units) / min_sales_unit

    total_cost = normal_price_units * unit_price + sales_price_units * sale_price

    puts(item_price[:image_url])

    return { price: total_cost, savings: cost_without_sales - total_cost, image_url: item_price[:image_url]}
  end
end
