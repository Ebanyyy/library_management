require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'sinatra/flash'

require_relative 'models/book'
require_relative 'models/review'
require_relative 'models/user'

enable :sessions
register Sinatra::Flash


get '/' do 
	erb :index
end

get '/add_book' do
	erb :add_book
end

post '/add_book' do 
	@book = Book.create(title: params[:title], author: params[:author])
	if @book.save
		erb :book 
	else
		erb :index
	end
end

get '/books' do 
	@books = Book.all
	erb :books
end

get '/books' do 
	@books = Book.order(created_at: :asc)
	erb :books
end

post '/book' do 
	@book = Book.create(title: params[:title], author: params[:author])

	if @book.save
		erb :book
	else 
		erb :index 
	end
end

get '/books/:id' do 
	@book = Book.find(params[:id])
	erb :book
end

post '/books/edit/:id' do
	@book = Book.find(params[:id])
	erb :edit
end

post '/books/update/:id' do
	@book = Book.find(params[:id])
	@book.update(title: params[:title], author: params[:author])
	erb :book
end

post '/books/delete/:id' do 
	@book = Book.find(params[:id])

	if @book.destroy
		redirect '/books'
	else
		redirect '/'
	end
end

post '/books/review/:id' do 
	@book = Book.find(params[:id])
	erb :review
end

post '/books/add_review/:id' do 
	@book = Book.find(params[:id])
	@book.reviews.create(name: params[:name], rating: params[:rating])
	erb :book 
end

get '/register' do 
	erb :register
end

post '/register' do 
	@user = User.create(user_name: params[:username], 
						password: params[:password])	

	if @user.save
		redirect '/login'
	else
		redirect '/register' 
	end
end

get '/login' do 
	erb :login 
end

post '/login' do 
	@user = User.find_by(user_name: params[:username])
	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		erb :add_book
	else
		erb :login
	end
end

post '/login' do 
	if current_user
		flash[:message] = "You have logged in"
		redirect '/'
	else
		erb :login
	end
end	

def current_user
	@current_user ||= User.find_by(id: session[:user_id])
end

def user_signer_in?
	!current_user.nil?
end

get '/logout' do 
	erb :index
end

post '/logout' do 
	session[:user_id] = nil
	redirect '/login'
end

