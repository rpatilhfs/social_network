function get_cookies_array() {
    var cookies = { };
    if (document.cookie && document.cookie != '') {
        var split = document.cookie.split(';');
        for (var i = 0; i < split.length; i++) {
            var name_value = split[i].split("=");
            name_value[0] = name_value[0].replace(/^ /, '');
            cookies[decodeURIComponent(name_value[0])] = decodeURIComponent(name_value[1]);
        }
    }
    return cookies;   
}

function getCurrentTime(){
	var myDate = new Date();
	return myDate.getFullYear() + '-' + (myDate.getMonth()+1) + '-' + (myDate.getDate()) + ' ' + myDate.getHours() + ':' + myDate.getMinutes();
	
}

function checkAnyCookie(){
	var cookies = get_cookies_array();
	var cookie_email = cookies['email'];
	var remembrance_token = cookies['remembrance_token'];
	var expiry_time = cookies['expiry_time'];
	var session = cookies['social_network_session'];	
	var jquery_date = getCurrentTime();
	if (cookie_email == undefined){
		window.location.href = '/RemoveCookies';
		return false;
	}
	else{
		if (jquery_date < expiry_time){	//Expire the cookie
			window.location.href = '/RemoveCookies'; 	//return false;
		}else{
			url='/CheckCookieActiveForUser/?email='+cookie_email+'&token='+remembrance_token+'&session='+session;
			window.location.href = url;
		}
	}
}