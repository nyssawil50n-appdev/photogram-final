Rails.application.routes.draw do

  # Routes for the Company account:

  # SIGN UP FORM
  get("/company_sign_up", { :controller => "company_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_company", { :controller => "company_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_company_profile", { :controller => "company_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_company", { :controller => "company_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_company_account", { :controller => "company_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/company_sign_in", { :controller => "company_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/company_verify_credentials", { :controller => "company_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/company_sign_out", { :controller => "company_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Intern account:

  # SIGN UP FORM
  get("/intern_sign_up", { :controller => "intern_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_intern", { :controller => "intern_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_intern_profile", { :controller => "intern_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_intern", { :controller => "intern_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_intern_account", { :controller => "intern_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/intern_sign_in", { :controller => "intern_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/intern_verify_credentials", { :controller => "intern_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/intern_sign_out", { :controller => "intern_authentication", :action => "destroy_cookies" })
             
  #------------------------------
  get("/intern_data", { :controller => "student_data", :action => "index" })
  get("/startup_data", { :controller => "company_data", :action => "index" })

  
  #homepage
  get("/", { :controller => "home", :action => "index" })

  #get("/hi", { :controller => "intern_authentication", :action => "sayhi" })

end
