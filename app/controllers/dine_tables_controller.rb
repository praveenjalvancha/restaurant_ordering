class DineTablesController < ApplicationController
  before_action :set_dine_table, only: [:show, :edit, :update, :destroy]
  before_action :set_status
  before_action :authenticate_user!, except: [:index]

  # GET /dine_tables
  # GET /dine_tables.json
  def index
    @dine_tables = DineTable.includes(:table_current_order)
  end

  # GET /dine_tables/1
  # GET /dine_tables/1.json
  def show
    category = params['category'] == "All" ? nil : params['category']
    @menu_items = MenuItem.available_items(category)
    @waiters = Waiter.all.map{|emp| [emp.name, emp.id]}
  end

  # GET /dine_tables/new
  def new
    @dine_table = DineTable.new
  end

  # GET /dine_tables/1/edit
  def edit
  end

  def send_to_kitchen
    selected_items =  params['items']
    table_id = params['table_id']
    member_count = params['member_count']
    table = DineTable.find_by_id(table_id)
    if table.status == "Available" 
      result = MenuItem.is_exist_all_items selected_items
      selected_items = result[:orderd_items]
      if result[:is_exist_all]
        if selected_items.length > 0
          order = Order.create(dine_table_id: table_id, order_state: 'Not Settled', category: params['category'], waiter_id: params['waiter'].to_i)
          TableCurrentOrder.create(order_id: order.id, dine_table_id: table_id)
          selected_items.each do |item|
            selected_item = MenuItem.find(item)
            OrderItem.create(selected_item.attributes.slice("name", "category", "price").merge({order_id: order.id}))
          end
          if table
            table.update(status: 'Not Available')
          end
        else
          data = {message: "Please select atleaset one Item", code: 0}
        end
      end
      data = {message: "Order Placed successfully", order_id: order.id, code: 1}
    else
      data = {message: "Table is occupied already", code: 0}
    end
    respond_to do |format|
      format.json { render json: data, status: :ok }
    end
  end

  # POST /dine_tables
  # POST /dine_tables.json
  def create
    @dine_table = DineTable.new(dine_table_params)

    respond_to do |format|
      if @dine_table.save
        format.html { redirect_to dine_tables_path, notice: 'Dine table was successfully created.' }
        format.json { render :show, status: :created, location: @dine_table }
      else
        format.html { render :new }
        format.json { render json: @dine_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dine_tables/1
  # PATCH/PUT /dine_tables/1.json
  def update
    respond_to do |format|
      if @dine_table.update(dine_table_params) && current_order = !@dine_table.table_current_order
        format.html { redirect_to dine_tables_path, notice: 'Dine table was successfully updated.' }
        format.json { render :new, status: :ok, location: @dine_table }
      else
        @dine_table.errors.messages.merge({error: 'order not settled'}) if current_order
        format.html { render :edit, notice: 'Dine table not updated' }
        format.json { render json: @dine_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dine_tables/1
  # DELETE /dine_tables/1.json
  def destroy
    @dine_table.destroy
    respond_to do |format|
      format.html { redirect_to dine_tables_url, notice: 'Dine table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dine_table
      @dine_table = DineTable.find(params[:id])
    end

    def set_status
      @states = DineTable::STATUS
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dine_table_params
      params.require(:dine_table).permit(:table_number, :status, :capacity)
    end
end
