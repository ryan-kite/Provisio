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
		out.print("Ready to get booking? Try signing in.");
	}
} catch (Exception e) {
	System.out.println("Exception getting user session data: " + e);
}

%>
<input type="text" id="has-username" value="<%= username %> hidden">
<input type="text" id="has-userid" value="<%= userId %> hidden">
<input type="text" id="has-auth" value="<%= authenticated %> hidden">


<script type="text/javascript">
let username = null;
let isAuthenticated = null;
let isAuthed = null;
let userId = null;

hasAuth = document.getElementById("lookup-tab").value;
if (hasAuth === 'true') {
	console.log("user is authenticated from JSP Session")
	username = <%= username %>
	userId = <%= userId %>
	isAuthenticated =  <%= authenticated %>
	
} else {
	console.log("user is NOT authenticated from JSP Session")
	sessionStorage.clear();
}
</script>

