class HomeController < ApplicationController
	before_action :get_report, only: [:report_by_category, :report_pdf]

  def index
  	redirect_to dine_tables_path
  end

  def report_by_category
  	get_report
  end

  def report_pdf
  	get_report
  	render :pdf => "Report", :template => 'home/report_pdf.pdf', layout: false
  end

  private

  def get_report
  	@orders = Order.by_category(params['category'], params['date'])
  	@total_day_price = @orders.map(&:total_price).compact.sum if @orders.length
  end
end
