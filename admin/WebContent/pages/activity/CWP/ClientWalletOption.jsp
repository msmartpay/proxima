<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=session.getAttribute("headerName")%></title>
<link href="css/mastercss.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="images/t.png" />
<%@ page import = "java.util.* "%> 
</head>
<body>

<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0">
  <!--header-->
  <tr>
    <td width="100%" valign="top" align="center"><%@ include file="/header.jsp" %></td>
  </tr>
  <!--header-->
<%

String mds=(String)adminServiceDetailsMap.get("mdsRegistartion");

String loginType=(String)session.getAttribute("loginType");
System.out.println("loginType is.....,...."+loginType);

%>
  <tr>
    <td valign="top" align="center" height="400" class="top_padding"><table cellpadding="0" cellspacing="0" width="90%" align="center" border="0" >
        <tr>
          <td valign="top" align="center" class="rounded-corners" ><table cellpadding="0" cellspacing="0" width="100%" align="center" border="0">
              <tr>
                <td  width="100%" valign="bottom" height="40" align="left" class="heading_mgs" >Super Admin</td>
              </tr>
              <tr>
                <td colspan="4" height="20"></td>
              </tr>
              <tr>
                <td valign="top" align="center"><form  name="ActivityUserForm" method="post">
                    <table cellpadding="0" cellspacing="0" width="83%" align="center" border="0"  class="mydata_tabl" id="border">
                      <tr>
                        <td height="30" colspan="4"></td>
                      </tr>
                      <tr>
                        
                        
                        
                        <td width="34%" align="left" valign="middle"></td>
                      </tr>
					  <tr>
					  <td colspan="4"><div id="c0" style="display:none"></div></td>
                      </tr>

					  <tr>
					  <td colspan="4"><div id="c1" style="display:none"></div></td>
                      </tr>

					  <tr>
					  <td colspan="4"><div id="c2" style="display:none"></div></td>
                      </tr>
					  <td colspan="4">
					  <table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" class="mydata_tabl">
                                        <tr>
                        <td width="30%" height="35" align="right" valign="middle" ><strong>Select</strong></td>
                        <td align="left" width="6%">:</td>
                        <td valign="middle" width="36%"><select name="selectActivityType" >
                            <option value="select">Select</option>
							<option value="creatClient">Create Client</option>
							<option value="cwu">Client wallet Update</option>
                            <option value="view">View</option>
							
                               
                          </Select></td>
                        <td width="34%" align="left" valign="middle"></td>
                      </tr>
                                        </tr>
										 
                                      </table>
					  
					  </td>
                      </tr>
 
					  
                      <tr>
                        <td></td>
                        <td></td>
                        <td align="left" height="50" ><input name="Submit" type="button" value="Continue" class="cls_btn" onclick="submitForm()"/></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td colspan="4" height="20"></td>
                      </tr>
                    </table>
                  </form></td>
              </tr>
              <tr>
                <td colspan="4" height="30"></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <!--footer-->
  <tr>
    <td width="100%" valign="top" align="center"><%@ include file="/footer.jsp" %></td>
  </tr>
  <!--footer-->
</table>
</body>
</html>
<script type="text/javascript">
// code for risk dropdown 




function submitForm()
{
var selectActivityType = document.ActivityUserForm.selectActivityType.value;
if(selectActivityType=="select")
{
alert("Please select value.");
return false;
}
if(selectActivityType=="creatClient"){
	
  document.ActivityUserForm.action="cwpActivity.action?param=createClient";
  document.ActivityUserForm.submit();
  
}	
if(selectActivityType=="view"){
	
  document.ActivityUserForm.action="cwpActivity.action?param=viewUpdate";
  document.ActivityUserForm.submit();
  
}
if(selectActivityType=="cwu"){
	
  document.ActivityUserForm.action="cwpActivity.action?param=getPage";
  document.ActivityUserForm.submit();
  
}
}


</script>
<script language="JavaScript">



var message="No right-click allowed";
///////////////////////////////////
function clickIE() {if (document.all) {alert(message);return false;}}
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) {
if (e.which==2||e.which==3) {alert(message);return false;}}}
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}

document.oncontextmenu=new Function("return false")

</script>
