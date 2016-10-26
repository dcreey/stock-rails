class CompanyController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @companies = Company.get_all(params[:name]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 20, :page => params[:page])
  end

  def sort_column
    Company.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end