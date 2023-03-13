class StudentDataController < ApplicationController
  def index
    @intern = Intern.all
    render({ :template => "studentdata/index.html.erb" })
  end
end
