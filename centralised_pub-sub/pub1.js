window.onload = function(){
document.getElementById('submit').addEventListener('click' , function(){
	subscribeTopic();
})

function subscribeTopic(){
	let tp = document.getElementById('topic').value
	$.ajax({url: "http://localhost:3005/notify/subscribe", xhrFields: {
        withCredentials: false
    }, type: "GET" , datatype: 'jsonp' , data: { topic: tp
        }, success: function(result){
       console.log(result);
    }});

     document.getElementById('subscribed_topics').innerHTML+= "<b> topic: </b>" + tp + "<br>";
    
}
}