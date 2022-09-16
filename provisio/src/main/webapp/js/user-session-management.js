

function isValidUser() {
    // 1st Check if we have an authenticated user in sessionStorage
    if (sessionStorage.getItem("username") !== null && sessionStorage.getItem("isAuthenticated") === "true") {
	 console.log("if: ${username}", "${authenticated}")
        console.log("username: " + sessionStorage.getItem("username") + " authenticated: " + sessionStorage.getItem("isAuthenticated"));
        return true;
    } 
    // 2nd Check if we have a newly authenticated user
    else if ("${username}" !== null && "${authenticated}" === "true") {
        console.log("else if: ${username}", "${authenticated}")
        sessionStorage.setItem("userId", "${userId}");
        sessionStorage.setItem("username", "${username}");
        sessionStorage.setItem("isAuthenticated", "${authenticated}");
        return true;
    } else {
        console.log("User not authenticated.")
        console.log(username, isAuthenticated)
        return false;
    }
}
isAuthed = isValidUser();
console.log("isAuthed: ", isAuthed)
// if authed set username and authenticated status
if (isAuthed) {
	userId = sessionStorage.getItem("userId");
  	username = sessionStorage.getItem("username");
  	isAuthenticated = sessionStorage.getItem("isAuthenticated")
  	handleNavigationDisplay(isAuthed)
} else {
	handleNavigationDisplay(isAuthed)
}

function handleNavigationDisplay(isAuthed) {
	// show the appropriate tabs based on if user is authenticated or not.
	console.log("handleNavigation: isAuthed:", isAuthed)
	if (isAuthed === true) {
		// show
		document.getElementById("rewards-tab").setAttribute('style', 'display:block !important');
		document.getElementById("summary-tab").setAttribute('style', 'display:block !important');
		document.getElementById("logout-tab").setAttribute('style', 'display:block !important');
		// hide
		document.getElementById("register-tab").setAttribute('style', 'display:none !important');
		document.getElementById("login-tab").setAttribute('style', 'display:none !important');
	} else {
		// hide
		document.getElementById("rewards-tab").setAttribute('style', 'display:none !important');
		document.getElementById("summary-tab").setAttribute('style', 'display:none !important');
		document.getElementById("logout-tab").setAttribute('style', 'display:none !important');
		// show
		document.getElementById("register-tab").setAttribute('style', 'display:block !important');
		document.getElementById("login-tab").setAttribute('style', 'display:block !important');
	}
}

