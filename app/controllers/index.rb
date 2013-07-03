get '/' do
	@user = User.all
  # render home page
 #TODO: Show all users if user is signed in
 @post = Post.all
 @name = current_user.name

  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
	@user = User.authenticate(params[:email],params[:password])
	p @user
	if @user
		session[:user_id] = @user.id
		redirect '/'
	else
		erb :sign_in
	end
end

delete '/sessions/:id' do
  session.clear
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
	user	= User.new(params[:user])
	if user.save
		session[:user_id] = user.id
		redirect '/'
	else
		####error messages
		erb :sign_up
	end
  # sign-up a new user
end

get "/" do
end

#-------Post--------
post "/post" do
  @post = Post.create(params[:post])
  redirect '/'
end



