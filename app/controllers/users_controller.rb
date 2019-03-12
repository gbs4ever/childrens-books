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
    if user.save
      redirect "/users/login"
    else
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
    redirect "/users"
   end
 end
    get "/logout" do
      session.clear
      redirect "/users"
    end




  # GET: /users/5 200
 get "/users/:id" do
  @user = User.find_by(params[:id])
  # want to get users books to display as a list index type with 
  #each book  and a link to that page so we need href and book id 
    if !!session[:user_id]
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
