// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


// Focus on FirstTextbox
function onFocusFirstTextbox(){  $('input[tabindex=1]').focus(); }

// Email Validate
function validateEmail(elementValue){  
  var emailPattern =/^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})/;
  //var emailPattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  //var emailPattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  //alert(elementValue);
  return emailPattern.test(elementValue);
}

// DateForamt Validate
function validateDateFormat(elementValue){  
  var dtRegex = new RegExp(/\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/);
  return dtRegex.test(elementValue);
}

function NullEmptyLengthCount(element){
	return (element != null && element != "" && element.length != 0)? true : false;
}

function showErrorMessageBlockForWholeEmptyBoxes(alertMessage){
	$("#error_explanation_javascript").show();
	$("#error_message_block").append(alertMessage);	
}

function emptyErrorBox(){
	$("#error_message_block").text("");	
	$("#error_explanation_javascript").hide();	
}