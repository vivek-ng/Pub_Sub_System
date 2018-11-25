class NotifyController < ApplicationController
     include ActionController::Live
     require 'uri'

 before_action  :set_access_control_headers

def set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
end 


    def initialize
    	@messages = []
    	$curr =0
    end
    def notify_subscribers
    	begin
    	response.headers['Content-Type'] = 'text/event-stream'
    	sse = SSE.new(response.stream)
    	while(true) do
    	if redis.llen("sub1_message") > $curr
    		new_messages = redis.rpop("sub1_message")
    		# new_messages.each do |msg|
    		# 	puts msg
    			sse.write({data: new_messages}.to_json)
    		# end
    		puts "vivek"
    	#sse.write({data: "I love Malvika"}.to_json)
    	$curr = redis.llen("sub1_message")
        end
        end
        ensure
    	sse.close
        end
    	puts params[:message]
    end

    def test
    	redis.lpush("sub1_message", params[:message])
    	#@messages.push("I love jjjjj")
    end

    def subscribe
    	  uri = URI("http://localhost:3000")
       	  conn = Faraday.new(:url => uri)
       	  message = params[:topic]
          response = conn.post '/pub_sub/subscribe' , {:topic => message , :subscriber => '3005'}
    end

    private

      def redis
      	$redis
      end

end
