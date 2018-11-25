window.onload = function(){
document.getElementById('submit').addEventListener('click' , function(){
	subscribeTopic();
})

function subscribeTopic(){
	let tp = document.getElementById('topic').value
	let message = document.getElementById('message').value
	$.ajax({url: "http://localhost:3003/publish/notifications", xhrFields: {
        withCredentials: false
    }, type: "GET" , datatype: 'jsonp' , data: { topic: tp,
    	message:message
        }, success: function(result){
       console.log(result);
    }});

    document.getElementById('published_topics').innerHTML+= "<b> topic: </b>" + tp + " <b> message: </b>" + message + "<br>";
    
}
}