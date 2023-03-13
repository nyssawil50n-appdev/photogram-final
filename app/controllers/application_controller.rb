class ApplicationController < ActionController::Base
  before_action(:load_current_company)
  
  # Uncomment line 5 in this file and line 3 in CompanyAuthenticationController if you want to force companies to sign in before any other actions.
  #before_action(:force_company_sign_in)
  
  def load_current_company
    the_id = session[:company_id]
    
    @current_company = Company.where({ :id => the_id }).first
  end
  
  def force_company_sign_in
    if @current_company == nil
      redirect_to("/company_sign_in", { :notice => "You have to sign in first." })
    end
  end

  before_action(:load_current_intern)
  
  # Uncomment line 5 in this file and line 3 in InternAuthenticationController if you want to force interns to sign in before any other actions.
  #before_action(:force_intern_sign_in)
  
  def load_current_intern
    the_id = session[:intern_id]
    
    @current_intern = Intern.where({ :id => the_id }).first
  end
  
  def force_intern_sign_in
    if @current_intern == nil
      redirect_to("/intern_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
