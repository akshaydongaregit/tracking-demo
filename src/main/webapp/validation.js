
function isNumber(evt) {
                     var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if ( iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
            return false;

        return true;


    }   

function isString(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if ((iKeyCode < 65 || iKeyCode > 90 ) && (iKeyCode < 97 || iKeyCode > 123) && iKeyCode != 32 && iKeyCode!=8)
            return false;

        return true;
    }    
function isFloat(evt) {
              var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 43 || iKeyCode > 57))
            return false;

        return true;

    }    

function isAlpha(evt) {
              var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode > 32 && (iKeyCode < 65 || iKeyCode > 90) &&
        (iKeyCode < 97 || iKeyCode > 122) && iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
            return false;

        return true;

    }    
function ValidateEmail(mail)   
{  
 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(myform.email.value))  
  {  
    return (true)  
  }  
    alert("You have entered an invalid email address!")  
    return (false)  
}  


function isContact(evt) {
                     var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if ( iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
            return false;

        return true;


    }
