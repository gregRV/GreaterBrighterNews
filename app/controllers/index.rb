get '/' do
  @post = Post.all
  @name = current_user.name if logged_in?
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


get "/users/:id/profile" do |id|
  @user = User.find(id)
  # p @user.posts
  # p user.post
  # @posts = Post.find_by_user_id(id)
  # p @posts
  erb :user_profile
end

#-------Post--------
post "/post" do
  # option 1
  @post = current_user.posts.create(params[:post])
  # option 2
  # @post = Post.create(params[:post])
  # @post.user = current_user
  # @post.save
  # option 3 (see view)
  redirect '/'
end

get "/show_post/:id" do |id|
@post = Post.find(id)
erb :show_post, {layout: false}
end

#-------COMMENTS------

post "/comment/:id" do |id|
  p params[:comment]
 @comment = current_user.comments.new(comment: params[:comment])
 @post = Post.find(id)
 @comment.post_id = @post.id
 @comment.save

 redirect "/show_post/#{id}"
end

