function validateLogin() {
    const username = document.forms[0]["username"].value;
    const password = document.forms[0]["password"].value;
    if (username.length < 5 || username.length > 20) {
        alert("Username must be between 5 and 20 characters.");
        return false;
    }
    if (password.length === 0) {
        alert("Password is required.");
        return false;
    }
    return true;
}

function validateRegister() {
    const username = document.forms[0]["username"].value;
    const password = document.forms[0]["password"].value;
    const confirmPassword = document.forms[0]["confirmPassword"].value;
    if (username.length < 5 || username.length > 20) {
        alert("Username must be between 5 and 20 characters.");
        return false;
    }
    if (password.length === 0) {
        alert("Password is required.");
        return false;
    }
    if (password !== confirmPassword) {
        alert("Passwords do not match.");
        return false;
    }
    const termsChecked = document.forms[0]["terms"].checked;
    if (!termsChecked) {
        alert("You must agree to the terms and conditions.");
        return false;
    }
    return true;
}
/**
 * 
 */