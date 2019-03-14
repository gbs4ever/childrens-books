class UsersController < ApplicationController
  

  #GET: /users  200
  get "/users" do
   erb :"/users/index.html"
  end

  # GET: /users/new   200
  get "/users/signup" do
    erb :"/users/signup.html"
  end

  # POST: /users    200
  post "/users" do
    user = User.new(params)
  if User.find_by_email(params[:email])
    flash.next[:warning] = "Your login already exsist, Please log in."
    redirect "/users/login"
  elsif  user.save
   flash[:info] = " Sign up success , please login in "
      redirect "/users/login"
    else  
      flash.next[:error] = "Please fill out all fields."
      redirect "/users"
    end
  end
  
  #GET: /users/login  200
  get "/users/login" do
		erb :"/users/login.html"
	end

  # POST: /users    200
  post "/login" do
    user = User.find_by(:email => params[:email])
   if user  && user.authenticate(params[:password])
     session[:user_id] = user.id
     
     redirect "/users/#{user.id}"
     
   else
    flash.next[:error] = "User login faliure."
    redirect "/users"
   end
 end
    get "/logout" do
     
      session.destroy
      redirect "/users"
    end




  # GET: /users/5 200
 get "/users/:id" do
  @user = User.find(params[:id])

  
    if logged_in? && current_user == @user
     
    erb :"/users/show.html"
    else
    redirect "/users"
    end
  end
  




  #add later 
  # GET: /users/5/edit
  #get "/users/:id/edit" do
   # erb :"/users/edit.html"
  #end

  # PATCH: /users/5
  #patch "/users/:id" do
   # redirect "/users/:id"
  #end

  # DELETE: /users/5/delete
  #delete "/users/:id/delete" do
   # redirect "/users"
  #end
end
