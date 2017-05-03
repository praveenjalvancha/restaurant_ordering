class OrdersController < ApplicationController
  def index
  	@orders = Order.all.reverse
  end

  def show
		@order = Order.find_by_id(params['id'].to_i)
    if !@order
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Order not found' }
        format.json { head :no_content }
      end
    else
      @order_items = @order.order_items
    end
  end

  def update
    # Settle
  	order = Order.find_by_id(params['id'])
  	order.dine_table.update(status: 'Available')
  	order.update(order_state: 'Settled', total_price: order.total_items_price)
    open_table = TableCurrentOrder.find_by_order_id(order.id)
    open_table.delete if open_table
  	redirect_to root_path
  end
end
