<%@page import="com.common.CommonDetailDao"%>
<%@ page import="java.util.*" %>


<% 

CommonDetailDao CommonDetailDao=new CommonDetailDao();
String ServerName=request.getServerName();
System.out.println("Server Name is :"+ServerName);
ServerName=ServerName.replaceAll("ds.","");
ServerName=ServerName.trim();

 if(ServerName.equals("localhost")){

	 ServerName="msmartpay.in";

 }

HashMap hashmap=CommonDetailDao.getDynamicDetails(ServerName);

String page_title=(String)hashmap.get("distributor_page_title");
session.setAttribute("hashmap",hashmap);
String LoginMessage=(String)request.getAttribute("Loginmessage");
String TickerMessage=(String)hashmap.get("TickerMessage");
String Client_Id=(String)hashmap.get("Client_Id");
session.setAttribute("Client_Id",Client_Id);
session.setAttribute("page_title",page_title);
String  accessallowed="allowed";
if(hashmap.get("bannerStatus")==null)
	session.setAttribute("bannerStatus","N");
else
	session.setAttribute("bannerStatus",hashmap.get("bannerStatus"));


  if(page_title==null || page_title.equals("null") ){
    accessallowed="notallowed";
    }

if(TickerMessage==null)
	{
session.setAttribute("TickerMessage","");
    }
	else{
  session.setAttribute("TickerMessage",TickerMessage);
	}
if(LoginMessage==null)
	{
session.setAttribute("securepagemessage","");
    }
	else{
  session.setAttribute("securepagemessage",LoginMessage);
	}
%>
</head>

<%
if(accessallowed.equals("allowed")){

%>

<title><%=page_title%></title>



<frameset rows="100%,*" frameborder=0 border=0 framespacing=0 >

<frame frameborder=0 src="Login.jsp" scrolling=auto name="Main" marginwidth=30 marginheight=0 noresize>

</frameset>






<NOFRAMES>
<P>
This information on this site is displayed in frames.<BR>
Either your browser does not support frames, or frame viewing is disabled on your browser.
</P>
</NOFRAMES>

	   <%
}
	   else {%>
<HTML>
 <HEAD>
  <TITLE> access blocked</TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
 </HEAD>

 <BODY>

 Access not allowed 
  
 </BODY>
</HTML>


<%}%>




