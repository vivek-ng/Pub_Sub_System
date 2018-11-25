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
    	@flag = false
    end
    def notify_subscribers
    	begin
    	response.headers['Content-Type'] = 'text/event-stream'
    	sse = SSE.new(response.stream)
    	while(true) do
    	while(@flag) do
    	end
    	@flag = true
    	if redis.llen("sub2_message") > $curr
    		new_messages = redis.rpop("sub2_message")
    			sse.write({data: new_messages}.to_json)
    		puts "vivek"
    	$curr = redis.llen("sub2_message")
        end
        @flag = false
        end
    rescue Exception => e
    	puts e.message
        ensure
        @flag = false
        puts "yehaaaa"
    	sse.close
        end
    	puts params[:message]
    end

    def test
    	while(@flag) do
    	end
    	@flag = true
    	redis.lpush("sub2_message", params[:message])
    	@flag = false
    	#@messages.push("I love jjjjj")
    end

    def subscribe
    	  uri = URI("http://localhost:3000")
       	  conn = Faraday.new(:url => uri)
       	  message = params[:topic]
          response = conn.post '/pub_sub/subscribe' , {:topic => message , :subscriber => '3004'}
    end

    private

      def redis
      	$redis
      end

end
