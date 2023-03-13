class InternAuthenticationController < ApplicationController
  # Uncomment line 3 in this file and line 5 in ApplicationController if you want to force interns to sign in before any other actions.
  #skip_before_action(:force_intern_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "intern_authentication/sign_in.html.erb" })
  end

  def create_cookie
    intern = Intern.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if intern != nil
      are_they_legit = intern.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/intern_sign_in", { :alert => "Incorrect password." })
      else
        session[:intern_id] = intern.id
      
        redirect_to("/startup_data", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/intern_sign_in", { :alert => "No intern with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "intern_authentication/sign_up.html.erb" })
  end

  def create
    @intern = Intern.new
    @intern.email = params.fetch("query_email")
    @intern.password = params.fetch("query_password")
    @intern.password_confirmation = params.fetch("query_password_confirmation")
    @intern.firstname = params.fetch("query_firstname")
    @intern.lastname = params.fetch("query_lastname")
    @intern.year = params.fetch("query_year")
    @intern.major = params.fetch("query_major")
    @intern.university = params.fetch("query_university")

    save_status = @intern.save

    if save_status == true
      session[:intern_id] = @intern.id
   
      redirect_to("/", { :notice => "Intern account created successfully."})
    else
      redirect_to("/intern_sign_up", { :alert => @intern.errors.full_messages.to_sentence })
    end
  end
    
  def edit_profile_form
    render({ :template => "intern_authentication/edit_profile.html.erb" })
  end

  def update
    @intern = @current_intern
    @intern.email = params.fetch("query_email")
    @intern.password = params.fetch("query_password")
    @intern.password_confirmation = params.fetch("query_password_confirmation")
    @intern.firstname = params.fetch("query_firstname")
    @intern.lastname = params.fetch("query_lastname")
    @intern.year = params.fetch("query_year")
    @intern.major = params.fetch("query_major")
    @intern.university = params.fetch("query_university")
    
    if @intern.valid?
      @intern.save

      redirect_to("/", { :notice => "Intern account updated successfully."})
    else
      render({ :template => "intern_authentication/edit_profile_with_errors.html.erb" , :alert => @intern.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_intern.destroy
    reset_session
    
    redirect_to("/", { :notice => "Intern account cancelled" })
  end

  def index
    render({ :template => "studentdata/show.html.erb" })
  end




end
