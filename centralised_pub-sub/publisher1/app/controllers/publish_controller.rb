class PublishController < ApplicationController
	  protect_from_forgery with: :null_session

	require 'uri'
	def notifications
		message = params[:message]
		topic = params[:topic]
		 uri = URI("http://localhost:3000")
       	  conn = Faraday.new(:url => uri)
          response = conn.post '/pub_sub/publish' , {:topic => topic , :message => message}
	end
end
