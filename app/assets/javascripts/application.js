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
function validateEmail(elementValue, message_div){  
  var emailPattern =/^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})/;
  //return emailPattern.test(elementValue);
  //alert('validateEmail');
  if (emailPattern.test(elementValue) == FALSE ){
	ShowError(ERROR_MSG_VALID_EMAIL_ADDRESS, message_div);
  }
}

// DateForamt Validate
function validateDateFormat(elementValue){  
  var dtRegex = new RegExp(/\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/);
  return dtRegex.test(elementValue);
}


function NullEmptyLengthCount(element, message_div){
	//alert('NullEmptyLengthCount');
	if ((element != null && element != "" && element.length != 0) == FALSE ){
		ShowError(ERROR_MSG_EMPTY_TEXTBOXES, message_div);
	}
}

function ShowError(message, message_div){
	// Form DIV
	//alert("MESSAGE:"+message);
	if (message_div == ALERT_MESSAGE_BOX_FORM_DIV){
		emptyErrorBox();
    	showErrorMessageBlockForWholeEmptyBoxes(message);
	}
	// MODAL BOX
	if (message_div == ALERT_MESSAGE_BOX_MODAL_DIV){
		emptyErrorBoxForModal();
    	showErrorMessageBlockForModal(message);
	}
	//onFocusFirstTextbox();
	//alert('show-end');
	//for (i=0;i<2;i++){
		//if (i==1){
			//alert(i);
	  //  	break;
	    	//
	    //}
	//}
	//return false;
}


function showErrorMessageBlockForWholeEmptyBoxes(alertMessage){
	$("#error_explanation_javascript").show();
	$("#error_message_block").append(alertMessage);	
}

function emptyErrorBox(){
	$("#error_message_block").text("");	
	$("#error_explanation_javascript").hide();	
}

function showErrorMessageBlockForModal(alertMessage){
	$("#error_explanation_javascript_modal").show();
	$("#error_message_block_modal").append(alertMessage);
}

function emptyErrorBoxForModal(){
	$("#error_message_block_modal").text("");	
	$("#error_explanation_javascript_modal").hide();	
}