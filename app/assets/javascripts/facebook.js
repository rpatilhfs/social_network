  window.fbAsyncInit = function() {
    FB.init({
      appId      : '327554610669430', // App ID
      channelUrl : '//http://localhost:3000/', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });

    // Additional initialization code here
  };

  // Load the SDK Asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_US/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));
   
  function sign_out(){
    FB.logout(function(response) {
      // user is now logged out 
      window.location='/SignOut'    
    });
  }
   