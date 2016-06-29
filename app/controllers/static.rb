get '/' do
	@urls = Url.all
  	erb :"static/index"
end

post '/urls' do
	@url = Url.find_by(original: params[:original])

	if @url
		@msg= "#{@url.errors.full_messages.join(" ")}"
		@urls = Url.all
		erb :"static/index"
	else 
		@url = Url.new(original: params[:original])

		if @url.save 
			@msg= "succesfully created"
			@urls = Url.all
			erb :"static/index"
		else
			@msg = "unsuccessful"
			@urls = Url.all
			erb :"static/index"
		end
	end
		#Url.create(orginal: params[:fattycrab], short_url: Url.shorten)
	#redirect '/'
end

get '/:shorten' do
	@url = Url.find_by(shorten: params[:shorten])
	redirect "http://" +@url.original
end

#get '/derp' do
#	erb :"static/derp"
#end


