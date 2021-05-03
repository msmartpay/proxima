<%@ page import="java.util.Date" %>
<%@ page import = "java.util.* "%> 
<%@ page import = "java.text.DecimalFormat "%> 
<%@ page import="java.text.*" %>
<%@ page import = "java.util.ArrayList "%>
<%@ page import = "java.util.HashMap "%>  
<%
String deleteButtonStatus="";
String buttonStatus=(String)session.getAttribute("buttonStatus");
String userType=(String)session.getAttribute("userType");
String status=(String)session.getAttribute("status");
String portalId=(String)session.getAttribute("portalId");
String advanceSearchOption="N";
int pageNumber=(Integer)session.getAttribute("pageNumber");
int noOfRecords=(Integer)session.getAttribute("noOfRecords");
int pageSize=(Integer)session.getAttribute("pageSize");

int noOfPages=noOfRecords/pageSize;
int modulus=noOfRecords%pageSize;

if(modulus != 0){
noOfPages=noOfPages+1;
}
String message=(String) request.getAttribute("message");
if(message==null)message="";

ArrayList distributorSearchList=(ArrayList)session.getAttribute("distributorSearchList");
int size=distributorSearchList.size();
String Flag="";
String Clientflag="";
String wlBlock="";
String wlStatus="";
String DsName="";
String DSBlockStatus="";
int count=0;
String editServiceUserID="";
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=session.getAttribute("headerName")%></title>

<link href="css/mastercss.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="images/t.png" />
<link href="css/stickytooltip.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="css/jquery.min.js"></script>
<script type="text/javascript" src="css/stickytooltip.js"></script>


<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<script language="javascript" type="text/javascript">

function forpopup(type,id)
{
	window.open("viewUser.action?type="+type+"&id="+id+"&viewType=Chield",'popup','width=700,height=550,left=400,top=50,screenX=300,screenY=100,resizable=no,scrollbars=no');

}



window.onload = msfg;
function clk()
{
	var checkFound = false;
	//var checkFound2=0;
	for (var counter=0; counter < document.distributorActivationForm.length; counter++) 
		{
	  	 if ((document.distributorActivationForm.elements[counter].name == "distributorIds") && (document.distributorActivationForm.elements[counter].checked == true))
		  	  {
	      			checkFound = true;
	      			//checkFound2++;
	      	  }
	   	}
 	// validation for single admin user delete
 	
	/*if(checkFound2>1)
   	{
   	   	alert("You cannot Select Multiple Users.");
   	    
   	    document.getElementById("a[i]").focus();
   	    checkFound2=1;
   	    
	    return false;
   	}*/
	if (checkFound != true) 
	{
	   alert ("Please Select Distributor.");
	 
	   document.getElementById("a[i]").focus();
	   return false;
	   
	 }
	
	
var a = document.getElementById("message");
a.style.display='block';
var w = 400;
var h = "auto";
var left = (screen.width/2)-(w/2);
//alert(left);
var top = (screen.height/2)-(200);
//alert(top);
a.style.top= top+"px";
a.style.left= left+"px";
a.style.width=w+"px";
a.style.height=h+"px";
a.style.background="#ffffff";
a.style.border="1px solid #a74312"
a.style.position="absolute";



}

function clos()
{
	
var a = document.getElementById("message");
a.style.display='none';
msfg();
}
</script>
</head>
<body>

<div id="mystickytooltip" class="stickytooltip">
<%

					if(distributorSearchList.size()>0){
					
					for(int i=0;i<distributorSearchList.size();i++){
				  
				 HashMap distributorMap=(HashMap)distributorSearchList.get(i);
%>
<div id="sticky1<%=i%>" class="atip" style="width:280px" align="center">
<table width="280px" align="center" class="mydata_tabl" bgcolor="#FFFFFF">
<!--<tr><td class="left_boldV" >View Client - Profile</td></tr>-->
<%
Flag=(String) distributorMap.get("clientFlag");

if(Flag.equalsIgnoreCase("0")){
Clientflag="TEP";
}
else if(Flag.equalsIgnoreCase("1")){
Clientflag="REP";
}
else{
Clientflag="Combo";
}
%>
<tr> <td class="left_boldV" >Company Name</td><td align="left" width="50%"><%=distributorMap.get("clientCompanyName")%></td></tr>
<tr><td class="left_boldV" >Product Type</td><td><%=Clientflag%></td></tr>
<tr><td class="left_boldV" >Domain</td><td><%=distributorMap.get("domaiName")%></td></tr>
<tr><td class="left_boldV" >Registration Date</td><td><%=distributorMap.get("wlRegistrationDate")%><%=wlStatus%></td></tr>
<!-- code Added By Manoj-->
<tr><td class="left_boldV" >Category</td><td><%=distributorMap.get("categoryName")%></td></tr>
<tr><td class="left_boldV" >Email ID</td><td><%=distributorMap.get("agentCellEmailId")%></td></tr>
<tr><td class="left_boldV" >Mobile Number</td><td><%=distributorMap.get("helpMobileNo")%></td></tr>
</table>
</div>
 <%}}%>
<!--<div class="stickystatus"></div>-->
</div>


<table cellpadding="0" cellspacing="0" width="100%" align="center" border="0">
  <tr>
    <td width="100%" valign="top" align="center"><%@ include file="/header.jsp" %></td>
  </tr>
  <tr>
    <td  align="center" width="100%" valign="top">
	<form name="distributorActivationForm" method="post">
     <table cellpadding="0" cellspacing="0" width="90%" align="center" border="0" class="newbg">
        <tr>
          <td valign="top" align="center" class="rounded-corners box_heights">
          <table cellpadding="0" cellspacing="0" width="100%" align="center" border="0" >
              <tr>
                <td valign="top" align="center" >
                <table cellpadding="0" cellspacing="0" width="100%" align="center" border="0">
                 
                    <tr>
                      <td valign="top" align="center">
                      <table cellpadding="0" cellspacing="0" width="90%" align="center" border="0"  class="form11">

                          <tr>
                            <td valign="top" align="center">
                            <div id="#">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tbody>
                                    <tr>
                                     <td height="40" align="left" valign="middle" class="heading_mgs1" >Retail User > Distributor</td>
                                    </tr>
								<tr><td  colspan="10" align="center" class="dyn_mgs"><%=message%></td></tr>
								<tr>
										<td  colspan="10" align="center" >
											<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for name/id/mobile.." title="Type in a name" />
											<a style="text-align: left;" href="distributorActivation.action?param=exportDS">Export DS</a>
										</td>
								</tr>
								<tr><td  colspan="10" align="center" style="font-size:13px; font-weight:bold;">&nbsp;</td></tr>
								<tr>
									  <td valign="top" >
									  <table cellspacing="0" cellpadding="0" width="100%" align="center" class="tbls" id="myTable">
                                        <tbody style="background:#a74312;">
                                          <%if(distributorSearchList.size()>0){
					
					%>
                                          <tr class="hd tabulardata" align="center">
                                            <td width="5%" style="border-bottom:border:1px solid #930; color:#FFF;">S.N.</td>
                                            <td width="3%" style="border-bottom:border:1px solid #930; color:#FFF;">
                                            <input type="hidden" name="size" value="<%=size%>"/>
                                                <input type="checkbox"  onchange="checkedAllCheckBoxes()" name="masterCheckBox" />
                                                </td>
                                                
                                            <td width="7%" align="center" style="border-bottom:border:1px solid #930; color:#FFF;">Client ID</td>
                                            <td width="7%" align="center" style="border-bottom:border:1px solid #930; color:#FFF;">Portal ID</td>
                                            <td width="8%" align="center" style="border-bottom:border:1px solid #930; color:#FFF;">MDS ID</td>
                                            <td width="8%" align="center" style="border-bottom:border:1px solid #930; color:#FFF;">DS ID</td>
                                         
                                            <td width="21%" align="center" style="border-bottom:border:1px solid #930; color:#FFF;">Distributor Name</td>
                                            <td width="8%" align="center" style="border-bottom:border:1px solid #930; color:#FFF;">Balance</td>
                                            <td width="8%" align="center" style="border-bottom:border:1px solid #930; color:#FFF;">Login Status</td>
											<td width="8%" align="center" style="border-right:1px solid #930;border-bottom:border:1px solid #930; color:#FFF;">Block Status</td>
                                          	<td width="8%" align="center" style="border-right:1px solid #930;border-bottom:border:1px solid #930; color:#FFF;">Pay</td>
                                          </tr>
										  <%
										  if(pageNumber==1){
											 count =0;
											 }else if(pageNumber==2){
											 count=100;
											 }else{
											 count=(pageNumber-1)*100;
											 }
										  %>
                                          <%
											for(int i=0;i<distributorSearchList.size();i++){				  
				                             HashMap distributorMap=(HashMap)distributorSearchList.get(i);
											 count=count+1;
											 editServiceUserID=(String)distributorMap.get("distributorId");
				                           %>
                                          <tr bgcolor="#ffffff" align="center" class="value_reg bords">
                                            <td style="border-bottom:1px solid #930;" height="25"><%=count%></td>
                                            <td style="border-bottom:1px solid #930;">
                                            <input type="checkbox" value="<%=distributorMap.get("distributorId")%>" name="distributorIds" id="a<%=i%>"/></td>
                                            <td style="border-bottom:1px solid #930;" align="center">
                                            <a href="#" data-tooltip="sticky1<%=i%>" style="cursor:pointer"><%=distributorMap.get("portalId")%></a></td>
                                            <td style="border-bottom:1px solid #930;" align="center"><%=distributorMap.get("mdPortalID")%></td>
                                            <td style="border-bottom:1px solid #930;" align="center">
											<a href="mdsProfile.action?param=viewMdsProfile&mdId=<%=distributorMap.get("mdId")%>" target="_parent">
											<%=distributorMap.get("mdId")%></a>
                                            </td>
                                           
                                            <td style="border-bottom:1px solid #930;" align="center">
                                            <a href="distributorProfile.action?param=viewDistributorProfile&distributorId=<%=distributorMap.get("distributorId")%>" target="_parent"><%=distributorMap.get("distributorId")%></a>
                                            </td>
                                           
                                            <%
											DsName=(String)distributorMap.get("distributorName");
											if(DsName==null) {DsName="";}else{DsName=DsName;}%>
											<td style="border-bottom:1px solid #930;" align="center" ><%=DsName%></td>
											<td style="border-bottom:1px solid #930;" align="center" ><%=distributorMap.get("distributorBalance")%></td>
											<td style="border-bottom:1px solid #930;" align="center" ><%=distributorMap.get("loginStatus")%></td>
                                            <%
											DSBlockStatus=(String)distributorMap.get("distributorBlockStatus");
											if(DSBlockStatus==null) {DSBlockStatus="";}else{DSBlockStatus=DSBlockStatus;}%>
											<td style="border-bottom:1px solid #930;border-right:1px solid #930;" align="center" ><%=DSBlockStatus%></td>
											<td style="border-bottom:1px solid #930;border-right:1px solid #930;" align="center">
											<input type="button" onclick="forpopup('DS','<%=distributorMap.get("distributorId") %>')" value="Pay Now" />
											</td>
                                          </tr>
                                          <%}}%>
                                        </tbody>
                                      </table></td>
                                    </tr>
                                    <tr>
									<td align="center">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr><td height="7px"></td></tr>
 
  <tr>
        <td align="right" height="25" valign="middle"  class="logintxt">
        <a href="javascript:submitGetPage()" style="text-decoration:none;"><input class="cls_btn" style="width:90px; float:left;" type="button" value="Edit Service" /> </a>
		<%
		if(!buttonStatus.equalsIgnoreCase("deactive")){%>
		<a href="javascript:deactivateDistributor();") style="text-decoration:none;"><input class="cls_btn" type="button" value="Deactivate" /> </a>
		<%}%>&nbsp;
		<%
		if(!buttonStatus.equalsIgnoreCase("Activate")){%>
		<a href="javascript:activateDistributor();") style="text-decoration:none;"><input class="cls_btn" type="button" value="Activate" /></a>
		<%}%>&nbsp;&nbsp;
		
		<%if(!buttonStatus.equalsIgnoreCase("PartiallyActive")){%>
		<a style="cursor:pointer"   onclick="clk();" ><!--Partially Activate--></a><%}%>
		
		<%if(!buttonStatus.equalsIgnoreCase("blocked")){%>
		<a style="cursor:pointer;text-decoration:none;"  href="javascript:blockDistributor();"><input class="cls_btn" type="button" value="Block" /></a>
		<%}%>&nbsp;
		<%if(!buttonStatus.equalsIgnoreCase("unblocked")){%>
		<a style="cursor:pointer;text-decoration:none;"  href="javascript:unblockDistributor();"><input class="cls_btn" type="button" value="Unblock" /></a>
		<%}%><% 
		
		
		if(noOfRecords==1 && !(deleteButtonStatus.equalsIgnoreCase("Inactive")))
		{}else{%>
		<!--<a href="javascript:deleteDistributor();">Flush/Delete/Archive</a>--><%}%></td>  </tr>
		
</table></td>
                                    </tr>
									
									<%
									if(advanceSearchOption.equals("N")){
									%>
                                    <tr>
                                      <td height="26" valign="bottom" align="center" class="hh1" ><a href="#">&lt;&lt;</a>&nbsp;
									  
									 <%  if(noOfPages==1 || pageNumber==1){
									  } 
									
									else{%>
									
									  <a href="distributorActivation.action?param=searchUserType&portalId=<%=portalId%>&userType=<%=userType%>&advanceSearchOption=<%=advanceSearchOption%>&status=<%=status%>&pageNumber=<%=pageNumber-1%>">Previous</a>
									  <%}%>
									  <%
									  for(int i=1;i<=noOfPages;i++){ 
									  %>
									 &nbsp;
									 
									 <%if(pageNumber==i){%>
									<a  style="color:#930" href="distributorActivation.action?param=searchUserType&portalId=<%=portalId%>&userType=<%=userType%>&advanceSearchOption=<%=advanceSearchOption%>&status=<%=status%>&pageNumber=<%=i%>"><%=i%></a>&nbsp;|&nbsp;
									  <%
									  }
									  
									  else{%>
									  <a href="distributorActivation.action?param=searchUserType&portalId=<%=portalId%>&userType=<%=userType%>&advanceSearchOption=<%=advanceSearchOption%>&status=<%=status%>&pageNumber=<%=i%>"><%=i%></a>
									  <%}}%>
									  &nbsp;<%
									  if(pageNumber==noOfPages || noOfPages==1){} else{
									  %><a href="distributorActivation.action?param=searchUserType&portalId=<%=portalId%>&userType=<%=userType%>&advanceSearchOption=<%=advanceSearchOption%>&status=<%=status%>&pageNumber=<%=pageNumber+1%>">Next</a><%}%>&nbsp;<a href="#">&gt;&gt;</a></td>
                                    </tr>
									
									<%} if(advanceSearchOption.equals("Y")){
									
									String panNo=(String)session.getAttribute("panNo");
			                        String dateOfBirth=(String)session.getAttribute("dateOfBirth");
			                        String pincode=(String)session.getAttribute("pincode");
			                        String firstName=(String)session.getAttribute("firstName");
			                        String lastName=(String)session.getAttribute("lastName");
			                        String alternateMobileNo=(String)session.getAttribute("alternateMobileNo");
			                        String state=(String)session.getAttribute("state");
			                        String city=(String)session.getAttribute("city");
			                        String district=(String)session.getAttribute("district");
			                        String fatherName=(String)session.getAttribute("fatherName");
			                        String motherName=(String)session.getAttribute("motherName");
									
									
									
									
									%>
									
									<tr>
                                      <td height="26" valign="bottom" align="center" class="hh1" ><a href="#">&lt;&lt;</a>&nbsp;
									  
									 <%  if(noOfPages==1 || pageNumber==1){
									  } 
									
									else{%>
									
									  <a href="distributorActivation.action?param=searchUserType&userType=<%=userType%>&advanceSearchOption=<%=advanceSearchOption%>&pincode=<%=pincode%>&pageNumber=<%=pageNumber-1%>&firstName=<%=firstName%>&lastName=<%=lastName%>&alternateMobileNo=<%=alternateMobileNo%>&state=<%=state%>&district=<%=district%>&city=<%=city%>&fatherName=<%=fatherName%>&motherName=<%=motherName%>">>Previous</a>
									  <%}
									  for(int i=1;i<=noOfPages;i++){ 
									  if(pageNumber==i){%>
									  <a style="color:#930" href="distributorActivation.action?param=searchUserType&userType=<%=userType%>&advanceSearchOption=<%=advanceSearchOption%>&pincode=<%=pincode%>&pageNumber=<%=i%>&firstName=<%=firstName%>&lastName=<%=lastName%>&alternateMobileNo=<%=alternateMobileNo%>&state=<%=state%>&district=<%=district%>&city=<%=city%>&fatherName=<%=fatherName%>&motherName=<%=motherName%>"><%=i%></a>&nbsp;|&nbsp;<%}
									  else{%>
									  <a href="distributorActivation.action?param=searchUserType&userType=<%=userType%>&advanceSearchOption=<%=advanceSearchOption%>&pincode=<%=pincode%>&pageNumber=<%=i%>&firstName=<%=firstName%>&lastName=<%=lastName%>&alternateMobileNo=<%=alternateMobileNo%>&state=<%=state%>&district=<%=district%>&city=<%=city%>&fatherName=<%=fatherName%>&motherName=<%=motherName%>"><%=i%></a>
									
									  
									  <%
									  }}
									  if(pageNumber==noOfPages || noOfPages==1){} else{
					 %><a href="distributorActivation.action?param=searchUserType&userType=<%=userType%>&advanceSearchOption=<%=advanceSearchOption%>&pincode=<%=pincode%>&pageNumber=<%=pageNumber+1%>&firstName=<%=firstName%>&lastName=<%=lastName%>&alternateMobileNo=<%=alternateMobileNo%>&state=<%=state%>&district=<%=district%>&city=<%=city%>&fatherName=<%=fatherName%>&motherName=<%=motherName%>">Next</a><%}%>&nbsp;<a href="#">&gt;&gt;</a></td>
                                    </tr>
									
									<%}%>
                                  </tbody>
                                </table>
                              </div></td>
                          </tr>
                          <tr>
                            <td valign="top" align="center">
							
							<!--start of popup-->
							<div id="message" style="display:none">
                <h2>Partially Activate<img src="images/logout11.png" height="20" width="20" onclick="clos();"/></h2>
<br/>
 <table align="center" bgcolor="#fff">
<td align="right">Auto Deactivation Date</td>
<td align="left" valign="middle">
<input name="dateOfActivation" type="text" class="style3" id="dateOfActivation" size="15" readonly="readonly"  />
                                        <span class="Trebuchet_b" style="position:fixed;"><img src="images/cal.png" alt="Calendar" width="15" height="17" align="absmiddle" onclick="displayCalendar(document.distributorActivationForm.dateOfActivation,'yyyy-mm-dd',this)"  /></span></td></tr>
</table>
<p><span><input type="button" value="Submit"  id="button" onclick="partiallyActivateDistributor();"/></span></p>

</div>
<!--end of popup-->
</td>
                          </tr>
                          <tr>
                            <td valign="top" align="center"></td>
                          </tr>
                          <tr>
                            <td colspan="5" height="20"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td colspan="4" height="30"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
	  
	  </form></td>
  </tr>
    <tr>
    <td width="100%" height="160" valign="top" align="center"></td>
  </tr>
  <tr>
    <td width="100%" valign="top" align="center"><%@ include file="/footer.jsp" %></td>
  </tr>
</table>

</body>
</html>

<script type="text/javascript">
function submitGetPage()
{
	var checkFound = false;
	for (var counter=0; counter < document.agentActivationForm.length; counter++) 
		{
	  	 if ((document.agentActivationForm.elements[counter].name == "agentIds") && (document.agentActivationForm.elements[counter].checked == true))
		  	  {
	      			checkFound = true;
	      	  }
	   	}
	if (checkFound != true) 
	{
	   alert ("Please Select the User.");
	   
	   document.getElementById("a[i]").focus();
	 
	   return false;
	   
	 }
	else
	{
		document.agentActivationForm.action="editServiceMgt.action?param=getEditServicePage&userType=DS";
 		document.agentActivationForm.submit();
	}

}

function activateDistributor(){
	var checkFound = false;
	for (var counter=0; counter < document.distributorActivationForm.length; counter++) 
		{
	  	 if ((document.distributorActivationForm.elements[counter].name == "distributorIds") && (document.distributorActivationForm.elements[counter].checked == true))
		  	  {
	      			checkFound = true;
	      	  }
	   	}
	if (checkFound != true) 
	{
	   alert ("Please Select the User.");
	  
	   document.getElementById("a[i]").focus();
	   return false;
	   
	 }


var hh=confirm("This Action will Activate the User.");


if (hh==true)
{
 document.distributorActivationForm.action="distributorActivation.action?param=activateDistributor";
 document.distributorActivationForm.submit();
}
else
{
confirm("You have Cancelled the Process.");
}




}

function checkedAllCheckBoxes(){

var masterCheckBox=document.distributorActivationForm.masterCheckBox.checked;

var size=document.distributorActivationForm.size.value;



if(masterCheckBox){

for(var i=0; i<size; i++){


document.getElementById("a"+i).checked=true;
}
}

else{
for(var i=0; i<size; i++){
document.getElementById("a"+i).checked=false;
}
}

}


function deactivateDistributor(){
	var checkFound = false;
	for (var counter=0; counter < document.distributorActivationForm.length; counter++) 
		{
	  	 if ((document.distributorActivationForm.elements[counter].name == "distributorIds") && (document.distributorActivationForm.elements[counter].checked == true))
		  	  {
	      			checkFound = true;
	      	  }
	   	}
	if (checkFound != true) 
	{
	   alert ("Please Select the User.");
	  
	   document.getElementById("a[i]").focus();
	   return false;
	   
	 }

	var hh=confirm("This Action will Deactivate the User.");
if (hh==true)
{
 document.distributorActivationForm.action="distributorActivation.action?param=deactivateDistributor";
 document.distributorActivationForm.submit();
}
else
{
confirm("You have Cancelled the Process.");
}

}

function partiallyActivateDistributor(){
	

var hh=confirm("This Action will Partially Activate the User.");
if (hh==true)
{
document.distributorActivationForm.action="distributorActivation.action?param=partiallyActivateDistributor";
 document.distributorActivationForm.submit();
}

}

function blockDistributor(){
	var checkFound = false;
	for (var counter=0; counter < document.distributorActivationForm.length; counter++) 
		{
	  	 if ((document.distributorActivationForm.elements[counter].name == "distributorIds") && (document.distributorActivationForm.elements[counter].checked == true))
		  	  {
	      			checkFound = true;
	      	  }
	   	}
	if (checkFound != true) 
	{
	   alert ("Please Select the User.");
	 
	   document.getElementById("a[i]").focus();
	   return false;
	   
	 }
	var hh=confirm("This Action will Block the User.");
if (hh==true)
{
 document.distributorActivationForm.action="distributorActivation.action?param=blockDistributor";
 document.distributorActivationForm.submit();
}
else
{
confirm("You have Cancelled the Process.");
}


}

function unblockDistributor(){
	var checkFound = false;
	for (var counter=0; counter < document.distributorActivationForm.length; counter++) 
		{
	  	 if ((document.distributorActivationForm.elements[counter].name == "distributorIds") && (document.distributorActivationForm.elements[counter].checked == true))
		  	  {
	      			checkFound = true;
	      	  }
	   	}
	if (checkFound != true) 
	{
	   alert ("Please Select the User.");
	
	  document.getElementById("a[i]").focus();
	   return false;
	   
	 }
	var hh=confirm("This Action will Unblock the User.");
if (hh==true)
{
 document.distributorActivationForm.action="distributorActivation.action?param=unblockDistributor";
 document.distributorActivationForm.submit();
}
else
{
confirm("You have Cancelled the Process.");
}


}

function deleteDistributor()
{
	var checkFound1 = false;
	//var checkFound2=0;
	for (var counter=0; counter < document.distributorActivationForm.length; counter++) 
		{
	  	 if ((document.distributorActivationForm.elements[counter].name == "distributorIds") && (document.distributorActivationForm.elements[counter].checked == true))
		  	  {
	      			checkFound1 = true;
	      			//checkFound2++;
	      	  }
	   	}
 	// validation for single admin user delete
 	
 /*  	if(checkFound2>1)
   	{
   	   	alert("You cannot Select Multiple Users.");
   	    
   	    document.getElementById("a[i]").focus();
   	    checkFound2=1;
   	    
	    return false;
   	}*/
	if (checkFound1 != true) 
	{
	   alert ("Please Select the User.");
	
	  document.getElementById("a[i]").focus();
	   return false;
	 }
 
var hh=confirm("This Action will Delete the User.");
if (hh==true)
{
 /*document.distributorActivationForm.action="distributorActivation.action?param=deleteDistributor";
 document.distributorActivationForm.submit();*/
}
else
{
confirm("You have Cancelled the Process.");
}


}

var message="No right-click allowed";

function clickIE() {if (document.all) {alert(message);return false;}}
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) {
if (e.which==2||e.which==3) {alert(message);return false;}}}
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}

document.oncontextmenu=new Function("return false")

</script>
<script>
		function myFunction() {
		  var input, filter, table, tr, td, i, txtValue;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		  for (i = 0; i < tr.length; i++) {
		    
		    td = tr[i].getElementsByTagName("td")[5];
		    if (td) {
		      txtValue = td.textContent || td.innerText;
		      if (txtValue.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		    	  td = tr[i].getElementsByTagName("td")[6];
				    if (td) {
				      txtValue = td.textContent || td.innerText;
				      if (txtValue.toUpperCase().indexOf(filter) > -1) {
				        tr[i].style.display = "";
				      } else {
				    	  td = tr[i].getElementsByTagName("td")[7];
						    if (td) {
						      txtValue = td.textContent || td.innerText;
						      if (txtValue.toUpperCase().indexOf(filter) > -1) {
						        tr[i].style.display = "";
						      } else {
						        tr[i].style.display = "none";
						      }
						    }
				      }
				    }
		      }
		    }
		    
		    
		  }
		}
</script>
