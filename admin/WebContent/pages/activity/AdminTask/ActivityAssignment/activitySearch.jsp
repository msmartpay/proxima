<%
String message =(String)request.getAttribute("message");
if(message==null){message="";}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=session.getAttribute("headerName") %></title>
<link href="css/mastercss.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="images/t.png" />
</head>
<body>

<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0">
  <tr>
    <td width="100%" valign="top" align="center"><%@ include file="/header.jsp" %></td>
  </tr>
  <tr>
    <td  align="center" width="100%" valign="top">
	<table cellpadding="0" cellspacing="0" width="90%" align="center" border="0">
        
		<tr>
          <td valign="top" align="center" class="rounded-corners" >
          <table cellpadding="0" cellspacing="0" width="100%" align="center" border="0">
		  
		   <tr>
                <td  width="100%" valign="middle" height="40" align="left" class="heading_mgs">Activity Assigment Search</td>
              </tr>
			<tr><td  colspan="10" align="center" class="dyn_mgs"><%=message%></td></tr>  		  

		  
		  <tr><td valign="top" align="center">
		  <form name="searchForm" method="post">
		  <table cellpadding="0" cellspacing="0" width="86%" align="center" border="0"  class="mydata_tabl" id="border">
		  		  
                    <tr><td  colspan="10" align="center" ></td></tr>
					<tr><td  colspan="10" align="center">&nbsp;</td></tr>
					
					   <tr>
                      
                      <td width="30%" height="35" align="right" valign="middle" style="padding-right:50px;"><strong>User ID</strong></td>
                      <td align="left" width="6%">:</td>
                      <td valign="middle" width="36%"><input type="text"   name="portalUserId"/>
                      <input type="hidden" value="assignActivity"  name="param"/></td>
                    </tr>
                    
                    
					
 <tr>
                <td  align="left"></td>
				<td align="left"></td>
				<td align="left"><input name="Submit" type="button" value="Search"  id="sms" onclick="submitForm()"/><span id="checkRecharge" style="visibility:hidden"><img src="images/loading2.gif" height="30" width="30"/></span></td>
              </tr>
			  
			   
 
			  <tr><td colspan="3" height="10"></td></tr>
			  
			  
			   <tr><td colspan="3" height="30"></td></tr>
            </table>
			
			
			
			
			</form></td></tr>
						  		  <tr><td colspan="4" height="30"></td></tr>

      </table></td>
  </tr></table>
  
  </td></tr>
  <tr>
    <td width="100%" valign="top" align="center"><%@ include file="/footer.jsp" %></td>
  </tr>
</table>
</body>
</html>

<script language="javascript" type="text/javascript">


function divoo()
{ 
document.getElementById("advance").style.display='block';
document.getElementById("adv1").style.display='none';
document.getElementById("adv2").style.display='block';
document.getElementById("sms").style.display='none';

}
function divoo2()
{ 
document.getElementById("advance").style.display='none';
document.getElementById("adv1").style.display='block';
document.getElementById("adv2").style.display='none';
document.getElementById("sms").style.display='block';
}

function submitForm(){
if(document.searchForm.portalUserId.value==null || document.searchForm.portalUserId.value=="")
{
alert("Please enter portal user id.");
return false;
}
document.getElementById("checkRecharge").style.visibility = "visible";
document.searchForm.action="activityAssignment.action";
document.searchForm.submit();
}
</script>
