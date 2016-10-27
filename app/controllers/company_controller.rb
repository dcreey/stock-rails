class CompanyController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    params[:name] ||= session[:company_search_name]
    #save product_type to session for future requests
    session[:company_search_name] = params[:name]
    @companies = Company.includes(:exchange).get_all(params[:name]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 20, :page => params[:page])
  end

  # api endpoint - exposes yahoo_api history search
  # symbol is required
  # returns list of last 30 days of stock information
  def get_history
    stock = StockHistory.new
    @history = stock.get_by_symbol(params[:symbol])
    respond_to do |format|
      if @history.nil?
        format.json do
          render :json => 'Invalid Data - Symbol Required', :status => 400
        end
      elsif @history.size == 0
         format.json do
           render :json => "No History Found For #{params[:symbol]}", :status => 404
         end
       else
        format.json do
          render :json => @history
        end
      end
      format.html { render :get_history }
    end
  end

  def sort_column
    Company.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end