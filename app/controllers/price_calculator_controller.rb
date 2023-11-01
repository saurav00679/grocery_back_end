class PriceCalculatorController < ApplicationController

  def getItems
    render json: {items: Item.select(:id, :name,:image_url).all}
  end

  def getPrice
    render json: {prices: Item.select(:id, :name,:unit_price, :sales_price, :min_sales_unit).all}
  end

  def totalCost
    item_quantity = params["quantity"]

    total_cost = 0.00
    savings = 0.00
    item_details = []

    item_quantity.each do |key, value|
      next if value == 0
      item_price = PriceCalculatorHelper.price_of_item(key, value.to_i)
      item_details << {item: key, quantity: value, cost: item_price[:price].round(2), key: SecureRandom.uuid}

      total_cost += item_price[:price]
      savings += item_price[:savings]
    end

    data = {
      item_details: item_details,
      total_cost: total_cost.round(2),
      savings: savings.round(2)
    }

    render json: data
  end
end
