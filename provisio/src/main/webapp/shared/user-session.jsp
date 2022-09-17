<!--  JSP Session-->
<%
// SET USER DATA VARS
String username=null;
String userId=null;
String authenticated=null;

// TRY AND GET USER SESSION DATA 
// ELSE WE DON'T HAVE IT 
// SO CLEAR BROWSER LOCALSESSION STORAGE TOO 	
try {
	username=(String)session.getAttribute("username");
	if (username != null && username != "") {
		username=(String)session.getAttribute("username");
		userId=(String)session.getAttribute("userId");
		authenticated=(String)session.getAttribute("authenticated");
		
	} else {	
		out.print("<div class='alert alert-info text-left'> <a class='text-dark' href='/login.jsp'>Login to get booking!</a></div>");
	}
} catch (Exception e) {
	System.out.println("Exception getting user session data: " + e);
}

%>
<input type="text" id="has-username" value="<%= username %>" hidden="true">
<input type="text" id="has-userid" value="<%= userId %> " hidden="true">
<input type="text" id="has-auth" value="<%= authenticated %>" hidden="true">


<script type="text/javascript">
let username = null;
let isAuthenticated = null;
let isAuthed = null;
let userId = null;

hasAuth = document.getElementById("has-auth").value;
console.log("has-auth: ", hasAuth)
if (hasAuth === 'true') {
	console.log("user is authenticated from JSP Session")
	username = "<%= username %>";
	userId = "<%= userId %>";
	isAuthenticated =  "<%= authenticated %>"
	
} else {
	console.log("user is NOT authenticated from JSP Session")
	sessionStorage.clear();
}
</script>

