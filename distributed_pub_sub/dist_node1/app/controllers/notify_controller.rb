class NotifyController < ApplicationController

include ActionController::Live
     require 'uri'

before_action  :set_access_control_headers

def set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
end 

  def initialize
    	$curr =0
  end

  def send_events
  	begin
    	response.headers['Content-Type'] = 'text/event-stream'
    	sse = SSE.new(response.stream)
    	while(true) do
    	if redis.llen("dist_node1_messages") > $curr
    		new_messages = redis.rpop("dist_node1_messages")
    			sse.write({data: new_messages}.to_json)
    		puts "vivek"
    	$curr = redis.llen("dist_node1_messages")
        end
        end
        ensure
    	sse.close
        end
    	#puts params[:message]
  end

   def test
   	redis.lpush("dist_node1_messages", params[:message])
   end

   def subscribe
   	  		# uri = URI("http://localhost:3012")
        #   conn = Faraday.new(:url => uri)
        #   topic = params[:topic]
   	  		# response2 = conn.get 'pub_sub/subscribe' , {:topic => topic}
           redis.lpush(params[:topic] , 1)

   end

   private 

   def redis
   	$redis
   end

end
