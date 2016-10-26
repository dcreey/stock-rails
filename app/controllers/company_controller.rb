class CompanyController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    params[:name] ||= session[:company_search_name]
    #save product_type to session for future requests
    session[:company_search_name] = params[:name]
    @companies = Company.includes(:exchange).get_all(params[:name]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 20, :page => params[:page])
  end

  def get_history
    stock = StockHistory.new
    @history = stock.get_by_symbol(params[:id])
    respond_to do |format|
      format.json do
        render :json => @history
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