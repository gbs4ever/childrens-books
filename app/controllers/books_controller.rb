class BooksController < ApplicationController

  # GET: /books 200
  get "/books" do
   
    if logged_in?
    @books =Book.all
    erb :"/books/index.html"
    else redirect to "/users"
    end
  end
  
  # GET: /books/new 200
   get "/books/new" do
    if  logged_in?
      erb :"/books/new.html"
    else redirect to "/users" 
    end
  end

  # POST: /books
  post "/books" do
   if logged_in?
   
    current_user.books.build(params).save
    #var = Book.create(params)
    #var.update(user: current_user)
    redirect "/books"
    else 
    redirect to "/users" 
    end
  end
  # GET: /books/5
  get "/books/:id" do
    
    @book = Book.find(params[:id])
    erb :"/books/show.html"
  end

  # GET: /books/5/edit
  get "/books/:id/edit" do
  @book = Book.find(params[:id])
    if logged_in? && current_user == @book.user
    erb :"/books/edit.html"
    else 
    redirect to "/users" 
    end
  end

  # PATCH: /books/5
  patch "/books/:id" do
    var = Book.find(params[:id])
     if logged_in? && current_user == var.user
    params.delete("_method")
    var.update(params)
    redirect "/books/#{var.id}"
     else
    redirect to "/users" 
    end
  end

  # DELETE: /books/5/delete
  delete "/books/:id" do
   var = Book.find_by(params[:id])
   if logged_in? && current_user == var.user
   var.delete
    redirect "/books"
   else
    redirect to "/users" 
  end
end



  




end
