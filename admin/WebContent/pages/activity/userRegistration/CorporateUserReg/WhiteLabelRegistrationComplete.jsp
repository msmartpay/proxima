
<%
String message=(String)request.getAttribute("message");
if(message==null){
message="";
}
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.HashMap"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=session.getAttribute("headerName")%></title>
<link href="css/mastercss.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="images/t.png" />

<%
HashMap map=(HashMap) request.getAttribute("PortalUserRegDetailsMap");
%>


</head>
<body>
<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0">
  <tr>
    <td width="100%" valign="top" align="center"><%@ include file="/header.jsp" %></td>
  </tr>
  <tr>
    <td  align="center" width="100%" valign="top">
    <table cellpadding="0" cellspacing="0" width="90%" align="center" border="0" class="newbg">
        <tr>
          <td valign="top" align="center" class="rounded-corners">
          <table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" >
              <tr>
                <td  width="100%" valign="middle" height="40" align="left" class="heading_mgs">
                <strong>User Details - Portal Admin</strong>
                </td>
              </tr>
              <tr>
                <td width="100%" align="center"><div class="accordion" style="padding:20px;" id="border">
				
				<form name="registration" method="post" enctype="multipart/form-data">
                    <table class="mydata_tabl form11" width="100%"  cellspacing="0" cellpadding="0" align="center"  >
                      <tr>
                        <td><!--<h3 align="center" style="background:#993300; color:#FFF;">Product Details</h3>
                          <h4>-->
                            <table width="100%"  cellspacing="0" cellpadding="0" align="center" class="mydata_tabl">
							
							<tr><td  colspan="10" align="center" class="dyn_mgs"><%=message%></td></tr>
							<tr><td  colspan="10" align="center">&nbsp;</td></tr>
							   
                              <tr>
                                <td width="15%"></td>
                                <td width="33%" height="30" align="left">Client Id</td>
                                <td width="5%" align="left">:</td>
                                <td width="46%" align="left">
                                
                                     <%=map.get("clientID")%>
                                   
                                  </td>
                              </tr>
                              
                              	<tr>
                              <td></td>
                              <td height="30" align="left">Portal Id</td>
                              <td  align="left">:</td>
                              <td  align="left">
                             <%=map.get("UserID")%>
                                </td>
							</tr>
                            
                            
                              <tr>
                                <td></td>
                                <td  align="left" height="30">Website URL </td>
                                <td  align="left">:</td>
                                <td align="left"><%=map.get("domainName")%> </td>
                              </tr>
                           
							  <tr>
                                <td></td>
                                <td  align="left" height="30">Agent Login URL</td>
                                <td  align="left">:</td>
                                <td align="left">
								<%=map.get("AgentLoginUrl")%>
                                 
                                 </td>
                              </tr>
                              
                              <tr>
                                <td></td>
                                <td  align="left" height="30">Distributor Login URL</td>
                                <td  align="left">:</td>
                                <td align="left">
                                    <%=map.get("DSLoginUrl")%>
                                     </td>
                              </tr>
                              
                              <tr>
                                <td></td>
                                <td  align="left" height="30">Master Distributor Login URL</td>
                                <td  align="left">:</td>
                                <td align="left">
                                 <%=map.get("MDLoginUrl")%>
                                     </td>
                              </tr>
                              
                              <tr>
                                <td></td>
                                <td  align="left" height="30">Company Name</td>
                                <td  align="left">:</td>
                                <td align="left">
								<%=map.get("CompanyName")%>
                                     </td>
                              </tr>
                             
                            </table>
                           </td>
                      </tr>
                      
                    </table>
					</form>
                  </div></td>
              </tr>
              <tr>
                <td height="20"></td>
              </tr>
			  <tr>
                <td height="95"></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td width="100%" valign="top" align="center"><%@ include file="/footer.jsp" %></td>
  </tr>
</table>
<script type="text/javascript">
var tooltipObj = new DHTMLgoodies_formTooltip();
tooltipObj.setTooltipPosition('right');
tooltipObj.setPageBgColor('#EEEEEE');
tooltipObj.setTooltipCornerSize(15);
tooltipObj.initFormFieldTooltip();
</script>
</body>
</html>
<style type="text/css">
.accordion {
	width: 1000px;
}
.accordion h3 {
	border:#a74312 solid 1px; 
	padding: 7px 15px;
	margin: 0; font-size:14px; font-weight:bold; font-family:Calibri; color:#a74312;
	

}

.accordion h4 {
	
}
</style>


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
