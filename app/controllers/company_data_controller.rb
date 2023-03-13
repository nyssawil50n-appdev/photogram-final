class CompanyDataController < ApplicationController
  def index
    @company = Company.all
    render({ :template => "companydata/index.html.erb" })
  end
end
