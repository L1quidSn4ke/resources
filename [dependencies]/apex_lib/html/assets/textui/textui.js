window.addEventListener('message', function(event) {
    if (event.data.type == "open") {
        
        var color = '#2196f3'
        if(event.data.color == 'error') {
            color = '#f44336'
        } else if(event.data.color == 'info' || event.data.color == null ) {
            color = '#2196f3'
        } else if(event.data.color == 'success') {
            color = '#4caf50'
        } else if(event.data.color == 'classic') {
            color = '#87da22'
        }                     

        $("#textui").show().removeClass("slide-out").addClass("textui")
        $("#text").css('border-color' , color)
        $("#text").html(event.data.text)
    } else if (event.data.type == "close") {
        $("#textui").removeClass("textui").addClass("slide-out")
    } else {
        $("#textui").hide()
    }
});