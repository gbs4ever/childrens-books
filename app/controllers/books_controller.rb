class BooksController < ApplicationController

  # GET: /books
  get "/books" do
   @books =Book.all
  erb :"/books/index.html"
  end

  # GET: /books/new
  get "/books/new" do
    erb :"/books/new.html"
  end

  # POST: /books
  post "/books" do
  Book.create(params)
  redirect "/books"
  end

  # GET: /books/5
  get "/books/:id" do
    @book = Book.find_by(params[:id])
    erb :"/books/show.html"
  end

  # GET: /books/5/edit
  get "/books/:id/edit" do

  @book = Book.find_by(params[:id])
  erb :"/books/edit.html"
  end

  # PATCH: /books/5
  patch "/books/:id" do
    var = Book.find_by(params[:id])
    params.delete("_method")
    var.update(params)
    redirect "/books/#{var.id}"
  end

  # DELETE: /books/5/delete
  delete "/books/:id" do
   
   Book.find_by(params[:id]).delete
    redirect "/books"
  end
end
