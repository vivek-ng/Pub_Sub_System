class PubSubController < ApplicationController

   protect_from_forgery with: :null_session
  require 'uri'

  before_action  :set_access_control_headers

def set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
end 

  def publish
  	puts "#{request.port}"
  	topic = params[:topic]
  	message = params[:message]
  	node_number = params[:node]

    subscriber_list = redis.lrange(topic , 0 , -1)

    if !subscriber_list.empty?
      subscriber_list.each do |sub|
        redis.lpush("dist_node#{sub}_messages" , message)
      end
    end

  	# make sure that the requests in the distributed system ends after all peers are visited !!!!!
  	# if redis.get(topic) == true
  	# 	uri = URI("http://localhost:3010")
  	# 	response = conn.post '/notify/test' , {:message => message}
   #  end

   #  if node_number < 2
  	# 	node_number+=1
  	# 	response2 = conn.post 'pub_sub/publish' , {:message =>message , :topic => topic , :node_number =>node_number}
   #  end
  # 	subscribers = redis.lrange(topic , 0 , -1)
  # 	puts subscribers.empty?
  # 	if !subscribers.empty?
  # 		 subscribers.each do |sub|
  #      	       uri = URI("http://docker.for.mac.localhost:#{sub}")
  #      	  conn = Faraday.new(:url => uri)
  #         response = conn.post '/notify/test' , {:message => message}
  # 	end
  # end

  end

  def subscribe
  	#subscriber = params[:subscriber]
  	topic = params[:topic]
  	redis.set(topic , true)
  end

  private

  def redis
  	$redis
  end

end
