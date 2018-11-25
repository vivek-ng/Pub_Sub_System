window.onload = function(){
document.getElementById('submit').addEventListener('click' , function(){
	subscribeTopic();
})

document.getElementById('submit_message').addEventListener('click' , function(){
	publishTopic();
})



function subscribeTopic(){
	let tp = document.getElementById('topic').value
	$.ajax({url: "http://localhost:3012/notify/subscribe", xhrFields: {
        withCredentials: false
    }, type: "GET" , datatype: 'jsonp' , data: { topic: tp
        }, success: function(result){
       console.log(result);
    }});

     document.getElementById('subscribed_topics').innerHTML+= "<b> topic: </b>" + tp + "<br>";
    
}


function publishTopic(){
	let tp = document.getElementById('topic_publish').value
	let message = document.getElementById('message').value
	$.ajax({url: "http://localhost:3012/pub_sub/publish", xhrFields: {
        withCredentials: false
    }, type: "GET" , datatype: 'jsonp' , data: { topic: tp,
    	message:message,
        node_number: 1
        }, success: function(result){
       console.log(result);
    }});

    document.getElementById('published_topics').innerHTML+= "<b> topic: </b>" + tp + " <b> message: </b>" + message + "<br>";
}

}