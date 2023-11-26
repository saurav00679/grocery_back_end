class OrdersController < ApplicationController
  def create
    order = params["details"]
    Order.create!(details: order["item_details"], price: order["total_cost"], savings: order["savings"])

    render json: { order: params["details"]}
  end

  def getOrders
    render json: { orders: Order.all }
  end
end
