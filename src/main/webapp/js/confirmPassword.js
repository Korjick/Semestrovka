document.addEventListener('DOMContentLoaded', function() {
    let password = document.getElementById("inputPasswordSignUp"),
        confirm_password = document.getElementById("inputPasswordRepeatSignUp");

    function checkPassword(){
        let check = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
        if(!password.value.match(check)) {
            password.setCustomValidity("Wrong format of password. " +
                "Password should consist 6 to 20 characters which contain at least one numeric digit, one.");
        } else {
            password.setCustomValidity('');
        }
    }

    function validatePassword(){
        if(password.value !== confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Don't Match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    password.onkeyup = checkPassword;
    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
}, false);