function validateMD(form) {

var c=document.update.checkpartial.value;

var boxesTicked1 = "";

for (i = document.getElementsByName('checkpartial').length - 1; i >= 0; i--)
{
if (document.getElementsByName('checkpartial')[i].checked)
 {
boxesTicked1 = boxesTicked1 + document.getElementsByName('checkpartial')[i].value + "\n"
}}
if (boxesTicked1 <1 ) 
{
alert("Please Select Atleast One Agent");
return boxesTicked1;
}
else
{

var namelist = "";
with(document.update) {
for(var i = 0; i < checkpartial.length; i++){
if(checkpartial[i].checked) {
namelist = checkpartial[i].value;

var split=namelist.split("&");

var IdNo = split[4];
var WLComm;
var RTComm;
var DSComm;
var AgentComm;
var WLCharge;
var RTCharge;
var DSCharge;
var AgentCharge;

if(IdNo=="0"){
	RTComm=document.getElementById("RM_AVIVAComm").value;
RTComm=RTComm.replace(/^\s+|\s+$/, '');
if(RTComm==""){
alert("Please enter  Commission for Aviva Insurance ");
document.getElementById("RM_AVIVAComm").focus();
return false;
}
if (isNaN(RTComm)){ 
alert( "- Please enter your quantity as a number for Aviva Insurance commission ");
document.getElementById("RM_AVIVAComm").focus();
return false;
 } 	
if(Number(RTComm)<0){
alert( "- Please enter your quantity as a positive number for Aviva Insurance commission   ");
document.getElementById("RM_AVIVAComm").focus();
return false;
}	
	
RTCharge=document.getElementById("RM_AVIVACharge").value;
RTCharge=RTCharge.replace(/^\s+|\s+$/, '');
if(RTCharge==""){
alert("Please enter  Commission for Aviva Insurance Charge  ");
document.getElementById("RM_AVIVACharge").focus();
return false;
}
if (isNaN(RTCharge)){ 
alert( "- Please enter your quantity as a number for Aviva Insurance Charge");
document.getElementById("RM_AVIVACharge").focus();
return false;
 } 	
if(Number(RTCharge)<0){
alert( "- Please enter your quantity as a positive number for Aviva Insurance Charge");
document.getElementById("RM_AVIVACharge").focus();
return false;
}	
 WLComm=Number(document.getElementById ( "CM_AVIVAComm" ).textContent);
 WLCharge=Number(document.getElementById ( "CM_AVIVACharge" ).textContent);
 
 RTComm=Number(document.getElementById("RM_AVIVAComm").value);
  
 RTCharge=Number(document.getElementById("RM_AVIVACharge").value);

 var DSComm=document.getElementById("DS_AVIVAComm").value;

 var DSCharge=document.getElementById("DS_AVIVACharge").value;

 var AgentComm=document.getElementById("Agent_AVIVAComm").value;

 var AgentCharge=document.getElementById("Agent_AVIVACharge").value;

var totalComm=Number(DSComm)+Number(RTComm)+Number(AgentComm);

var limitComm=Number(WLComm)-Number(DSComm)-Number(AgentComm);

var totalCharge=Number(DSCharge)+Number(RTCharge)+Number(AgentCharge);
 
var limitCharge=Number(WLCharge)-Number(DSCharge)-Number(AgentCharge);


if(WLComm<totalComm){
alert("Commision for Aviva Insurance   is not permitted to set  more than "+limitComm.toFixed(2))
document.getElementById("RM_AVIVAComm").focus();
return false;
}
if(WLCharge<totalCharge){
alert("Charge for Aviva Insurance   is not permitted to set  more than "+limitCharge.toFixed(2))
document.getElementById("RM_AVIVACharge").focus();
return false;
}
}


if(IdNo=="1"){
	RTComm=document.getElementById("RM_BhartiAxa_Comm").value;
RTComm=RTComm.replace(/^\s+|\s+$/, '');
if(RTComm==""){
alert("Please enter  Commission for Bharti Axa Life Insurance ");
document.getElementById("RM_BhartiAxa_Comm").focus();
return false;
}
if (isNaN(RTComm)){ 
alert( "- Please enter your quantity as a number for Bharti Axa Life Insurance commission ");
document.getElementById("RM_BhartiAxa_Comm").focus();
return false;
 } 	
if(Number(RTComm)<0){
alert( "- Please enter your quantity as a positive number for Bharti Axa Life Insurance commission   ");
document.getElementById("RM_BhartiAxa_Comm").focus();
return false;
}	
	
RTCharge=document.getElementById("RM_BhartiAxa_Charge").value;
RTCharge=RTCharge.replace(/^\s+|\s+$/, '');
if(RTCharge==""){
alert("Please enter  Commission for Bharti Axa Life Insurance Charge  ");
document.getElementById("RM_BhartiAxa_Charge").focus();
return false;
}
if (isNaN(RTCharge)){ 
alert( "- Please enter your quantity as a number for Bharti Axa Life Insurance Charge");
document.getElementById("RM_BhartiAxa_Charge").focus();
return false;
 } 	
if(Number(RTCharge)<0){
alert( "- Please enter your quantity as a positive number for Bharti Axa Life Insurance Charge");
document.getElementById("RM_BhartiAxa_Charge").focus();
return false;
}	
 WLComm=Number(document.getElementById ( "CM_BhartiAxaComm" ).textContent);
 WLCharge=Number(document.getElementById ( "CM_BhartiAxaCharge" ).textContent);
 
 RTComm=Number(document.getElementById("RM_BhartiAxaComm").value);
  
 RTCharge=Number(document.getElementById("RM_BhartiAxaCharge").value);

 var DSComm=document.getElementById("DS_BhartiAxaComm").value;

 var DSCharge=document.getElementById("DS_BhartiAxaCharge").value;

 var AgentComm=document.getElementById("Agent_BhartiAxaComm").value;

 var AgentCharge=document.getElementById("Agent_BhartiAxaCharge").value;

var totalComm=Number(DSComm)+Number(RTComm)+Number(AgentComm);

var limitComm=Number(WLComm)-Number(DSComm)-Number(AgentComm);

var totalCharge=Number(DSCharge)+Number(RTCharge)+Number(AgentCharge);
 
var limitCharge=Number(WLCharge)-Number(DSCharge)-Number(AgentCharge);


if(WLComm<totalComm){
alert("Commision for Bharti Axa Life Insurance   is not permitted to set  more than "+limitComm.toFixed(2))
document.getElementById("RM_BhartiAxa_Comm").focus();
return false;
}
if(WLCharge<totalCharge){
alert("Charge for Bharti Axa Life Insurance   is not permitted to set  more than "+limitCharge.toFixed(2))
document.getElementById("RM_BhartiAxa_Charge").focus();
return false;
}
}


if(IdNo=="2"){
	RTComm=document.getElementById("RM_BSunLifeComm").value;
RTComm=RTComm.replace(/^\s+|\s+$/, '');
if(RTComm==""){
alert("Please enter  Commission for Birla Sun Life - life Insurancee ");
document.getElementById("RM_BSunLifeComm").focus();
return false;
}
if (isNaN(RTComm)){ 
alert( "- Please enter your quantity as a number for Birla Sun Life - life Insurancee commission ");
document.getElementById("RM_BSunLifeComm").focus();
return false;
 } 	
if(Number(RTComm)<0){
alert( "- Please enter your quantity as a positive number for Birla Sun Life - life Insurancee commission   ");
document.getElementById("RM_BSunLifeComm").focus();
return false;
}	
	
RTCharge=document.getElementById("RM_BSunLifeCharge").value;
RTCharge=RTCharge.replace(/^\s+|\s+$/, '');
if(RTCharge==""){
alert("Please enter  Commission for Birla Sun Life - life Insurancee Charge  ");
document.getElementById("RM_BSunLifeCharge").focus();
return false;
}
if (isNaN(RTCharge)){ 
alert( "- Please enter your quantity as a number for Birla Sun Life - life Insurancee Charge");
document.getElementById("RM_BSunLifeCharge").focus();
return false;
 } 	
if(Number(RTCharge)<0){
alert( "- Please enter your quantity as a positive number for Birla Sun Life - life Insurancee Charge");
document.getElementById("RM_BSunLifeCharge").focus();
return false;
}	
 WLComm=Number(document.getElementById ( "CM_BSunLifeComm" ).textContent);
 WLCharge=Number(document.getElementById ( "CM_BSunLifeCharge" ).textContent);
 RTComm=Number(document.getElementById("RM_BSunLifeComm").value);
 RTCharge=Number(document.getElementById("RM_BSunLifeCharge").value);
 var DSComm=document.getElementById("DS_BSunLifeComm").value;
 var DSCharge=document.getElementById("DS_BSunLifeCharge").value;
 var AgentComm=document.getElementById("Agent_BSunLifeComm").value;
 var AgentCharge=document.getElementById("Agent_BSunLifeCharge").value;

var totalComm=Number(DSComm)+Number(RTComm)+Number(AgentComm);
var limitComm=Number(WLComm)-Number(DSComm)-Number(AgentComm);
var totalCharge=Number(DSCharge)+Number(RTCharge)+Number(AgentCharge);
var limitCharge=Number(WLCharge)-Number(DSCharge)-Number(AgentCharge);

if(WLComm<totalComm){
alert("Commision for Birla Sun Life - life Insuranceeis not permitted to set  more than "+limitComm.toFixed(2))
document.getElementById("RM_BSunLifeComm").focus();
return false;
}
if(WLCharge<totalCharge){
alert("Charge for Birla Sun Life - life Insurancee is not permitted to set  more than "+limitCharge.toFixed(2))
document.getElementById("RM_BSunLifeCharge").focus();
return false;
}
}

if(IdNo=="3"){
	RTComm=document.getElementById("RM_DLFComm").value;
RTComm=RTComm.replace(/^\s+|\s+$/, '');
if(RTComm==""){
alert("Please enter  Commission for DLF Pramerica - life Insurance ");
document.getElementById("RM_DLFComm").focus();
return false;
}
if (isNaN(RTComm)){ 
alert( "- Please enter your quantity as a number for DLF Pramerica - life Insurance commission ");
document.getElementById("RM_DLFComm").focus();
return false;
 } 	
if(Number(RTComm)<0){
alert( "- Please enter your quantity as a positive number for DLF Pramerica - life Insurance commission   ");
document.getElementById("RM_DLFComm").focus();
return false;
}	
	
RTCharge=document.getElementById("RM_DLFCharge").value;
RTCharge=RTCharge.replace(/^\s+|\s+$/, '');
if(RTCharge==""){
alert("Please enter  Commission for DLF Pramerica - life Insurance Charge  ");
document.getElementById("RM_DLFCharge").focus();
return false;
}
if (isNaN(RTCharge)){ 
alert( "- Please enter your quantity as a number for DLF Pramerica - life Insurance Charge");
document.getElementById("RM_DLFCharge").focus();
return false;
 } 	
if(Number(RTCharge)<0){
alert( "- Please enter your quantity as a positive number for DLF Pramerica - life Insurance Charge");
document.getElementById("RM_DLFCharge").focus();
return false;
}	
WLComm=Number(document.getElementById ( "CM_DLFComm" ).textContent);
 WLCharge=Number(document.getElementById ( "CM_DLFCharge" ).textContent);
 RTComm=Number(document.getElementById("RM_DLFComm").value);
 RTCharge=Number(document.getElementById("RM_DLFCharge").value);
 var DSComm=document.getElementById("DS_DLFComm").value;
 var DSCharge=document.getElementById("DS_DLFCharge").value;
 var AgentComm=document.getElementById("Agent_DLFComm").value;
 var AgentCharge=document.getElementById("Agent_DLFCharge").value;

var totalComm=Number(DSComm)+Number(RTComm)+Number(AgentComm);
var limitComm=Number(WLComm)-Number(DSComm)-Number(AgentComm);
var totalCharge=Number(DSCharge)+Number(RTCharge)+Number(AgentCharge);
var limitCharge=Number(WLCharge)-Number(DSCharge)-Number(AgentCharge);

if(WLComm<totalComm){
alert("Commision for ADLF Pramerica - life Insurance is not permitted to set  more than "+limitComm.toFixed(2))
document.getElementById("RM_DLFComm").focus();
return false;
}
if(WLCharge<totalCharge){
alert("Charge for DLF Pramerica - life Insurance is not permitted to set  more than "+limitCharge.toFixed(2))
document.getElementById("RM_DLFCharge").focus();
return false;
}
}


if(IdNo=="4"){
	RTComm=document.getElementById("RM_HDFCComm").value;
RTComm=RTComm.replace(/^\s+|\s+$/, '');
if(RTComm==""){
alert("Please enter  Commission for HDFC Insurance premium");
document.getElementById("RM_HDFCComm").focus();
return false;
}
if (isNaN(RTComm)){ 
alert( "- Please enter your quantity as a number for HDFC Insurance premium commission ");
document.getElementById("RM_HDFCComm").focus();
return false;
 } 	
if(Number(RTComm)<0){
alert( "- Please enter your quantity as a positive number for HDFC Insurance premium commission   ");
document.getElementById("RM_HDFCComm").focus();
return false;
}	
	
RTCharge=document.getElementById("RM_HDFCCharge").value;
RTCharge=RTCharge.replace(/^\s+|\s+$/, '');
if(RTCharge==""){
alert("Please enter  Commission for HDFC Insurance premium Charge  ");
document.getElementById("RM_HDFCCharge").focus();
return false;
}
if (isNaN(RTCharge)){ 
alert( "- Please enter your quantity as a number for HDFC Insurance premium Charge");
document.getElementById("RM_HDFCCharge").focus();
return false;
 } 	
if(Number(RTCharge)<0){
alert( "- Please enter your quantity as a positive number for HDFC Insurance premium Charge");
document.getElementById("RM_HDFCCharge").focus();
return false;
}	
 WLComm=Number(document.getElementById ( "CM_HDFCComm" ).textContent);
 WLCharge=Number(document.getElementById ( "CM_HDFCCharge" ).textContent);
 RTComm=Number(document.getElementById("RM_HDFCComm").value);
 RTCharge=Number(document.getElementById("RM_HDFCCharge").value);
 var DSComm=document.getElementById("DS_HDFCComm").value;
 var DSCharge=document.getElementById("DS_HDFCCharge").value;
 var AgentComm=document.getElementById("Agent_HDFCComm").value;
 var AgentCharge=document.getElementById("Agent_HDFCCharge").value;

var totalComm=Number(DSComm)+Number(RTComm)+Number(AgentComm);
var limitComm=Number(WLComm)-Number(DSComm)-Number(AgentComm);
var totalCharge=Number(DSCharge)+Number(RTCharge)+Number(AgentCharge);
var limitCharge=Number(WLCharge)-Number(DSCharge)-Number(AgentCharge);

if(WLComm<totalComm){
alert("Commision for HDFC Insurance premium is not permitted to set  more than "+limitComm.toFixed(2))
document.getElementById("RM_HDFCComm").focus();
return false;
}
if(WLCharge<totalCharge){
alert("Charge for HDFC Insurance premium is not permitted to set  more than "+limitCharge.toFixed(2))
document.getElementById("RM_HDFCCharge").focus();
return false;
}
}


if(IdNo=="5"){
		RTComm=document.getElementById("RM_ICICIComm").value;
RTComm=RTComm.replace(/^\s+|\s+$/, '');
if(RTComm==""){
alert("Please enter  Commission for ICICI PRUDENTIAL Life Insurance");
document.getElementById("RM_ICICIComm").focus();
return false;
}
if (isNaN(RTComm)){ 
alert( "- Please enter your quantity as a number for ICICI PRUDENTIAL Life Insurance commission ");
document.getElementById("RM_ICICIComm").focus();
return false;
 } 	
if(Number(RTComm)<0){
alert( "- Please enter your quantity as a positive number for ICICI PRUDENTIAL Life Insurance commission   ");
document.getElementById("RM_ICICIComm").focus();
return false;
}	
	
RTCharge=document.getElementById("RM_ICICICharge").value;
RTCharge=RTCharge.replace(/^\s+|\s+$/, '');
if(RTCharge==""){
alert("Please enter  Commission for ICICI PRUDENTIAL Life Insurance Charge  ");
document.getElementById("RM_ICICICharge").focus();
return false;
}
if (isNaN(RTCharge)){ 
alert( "- Please enter your quantity as a number for ICICI PRUDENTIAL Life Insurance Charge");
document.getElementById("RM_ICICICharge").focus();
return false;
 } 	
if(Number(RTCharge)<0){
alert( "- Please enter your quantity as a positive number for ICICI PRUDENTIAL Life Insurance Charge");
document.getElementById("RM_ICICICharge").focus();
return false;
}
 WLComm=Number(document.getElementById ( "CM_ICICIComm" ).textContent);
 WLCharge=Number(document.getElementById ( "CM_ICICICharge" ).textContent);
 RTComm=Number(document.getElementById("RM_ICICIComm").value);
 RTCharge=Number(document.getElementById("RM_ICICICharge").value);
 var DSComm=document.getElementById("DS_ICICIComm").value;
 var DSCharge=document.getElementById("DS_ICICICharge").value;
 var AgentComm=document.getElementById("Agent_ICICIComm").value;
 var AgentCharge=document.getElementById("Agent_ICICICharge").value;
var totalComm=Number(DSComm)+Number(RTComm)+Number(AgentComm);
var limitComm=Number(WLComm)-Number(DSComm)-Number(AgentComm);
var totalCharge=Number(DSCharge)+Number(RTCharge)+Number(AgentCharge);
var limitCharge=Number(WLCharge)-Number(DSCharge)-Number(AgentCharge);

if(WLComm<totalComm){
alert("Commision for ICICI PRUDENTIAL Life Insurance is not permitted to set  more than "+limitComm.toFixed(2))
document.getElementById("RM_ICICIComm").focus();
return false;
}
if(WLCharge<totalCharge){
alert("Charge for ICICI PRUDENTIAL Life Insurance is not permitted to set  more than "+limitCharge.toFixed(2))
document.getElementById("RM_ICICICharge").focus();
return false;
}
}

if(IdNo=="6"){
		RTComm=document.getElementById("RM_VYSHYAComm").value;
RTComm=RTComm.replace(/^\s+|\s+$/, '');
if(RTComm==""){
alert("Please enter  Commission for ING Vyasa Life insurance");
document.getElementById("RM_VYSHYAComm").focus();
return false;
}
if (isNaN(RTComm)){ 
alert( "- Please enter your quantity as a number for ING Vyasa Life insurance commission ");
document.getElementById("RM_VYSHYAComm").focus();
return false;
 } 	
if(Number(RTComm)<0){
alert( "- Please enter your quantity as a positive number for ING Vyasa Life insurance commission   ");
document.getElementById("RM_VYSHYAComm").focus();
return false;
}	
	
RTCharge=document.getElementById("RM_VYSHYACharge").value;
RTCharge=RTCharge.replace(/^\s+|\s+$/, '');
if(RTCharge==""){
alert("Please enter  Commission for ING Vyasa Life insurance Charge  ");
document.getElementById("RM_VYSHYACharge").focus();
return false;
}
if (isNaN(RTCharge)){ 
alert( "- Please enter your quantity as a number forING Vyasa Life insurance Charge");
document.getElementById("RM_VYSHYACharge").focus();
return false;
 } 	
if(Number(RTCharge)<0){
alert( "- Please enter your quantity as a positive number for ING Vyasa Life insurance Charge");
document.getElementById("RM_VYSHYACharge").focus();
return false;
}	
 WLComm=Number(document.getElementById ( "CM_VYSHYAComm" ).textContent);
 WLCharge=Number(document.getElementById ( "CM_VYSHYACharge" ).textContent);
 RTComm=Number(document.getElementById("RM_VYSHYAComm").value);
 RTCharge=Number(document.getElementById("RM_VYSHYACharge").value);
 var DSComm=document.getElementById("DS_VYSHYAComm").value;
 var DSCharge=document.getElementById("DS_VYSHYACharge").value;
 var AgentComm=document.getElementById("Agent_VYSHYAComm").value;
 var AgentCharge=document.getElementById("Agent_VYSHYACharge").value;

var totalComm=Number(DSComm)+Number(RTComm)+Number(AgentComm);
var limitComm=Number(WLComm)-Number(DSComm)-Number(AgentComm);
var totalCharge=Number(DSCharge)+Number(RTCharge)+Number(AgentCharge);
var limitCharge=Number(WLCharge)-Number(DSCharge)-Number(AgentCharge);

if(WLComm<totalComm){
alert("Commision for ING Vyasa Life insurance is not permitted to set  more than "+limitComm.toFixed(2))
document.getElementById("RM_VYSHYAComm").focus();
return false;
}
if(WLCharge<totalCharge){
alert("Charge for ING Vyasa Life insurance is not permitted to set  more than "+limitCharge.toFixed(2))
document.getElementById("RM_VYSHYACharge").focus();
return false;
}
}
if(IdNo=="7"){
	RTComm=document.getElementById("RM_LicComm").value;
RTComm=RTComm.replace(/^\s+|\s+$/, '');
if(RTComm==""){
alert("Please enter  Commission for Lic");
document.getElementById("RM_LicComm").focus();
return false;
}
if (isNaN(RTComm)){ 
alert( "- Please enter your quantity as a number for Lic commission ");
document.getElementById("RM_LicComm").focus();
return false;
 } 	
if(Number(RTComm)<0){
alert( "- Please enter your quantity as a positive number for Lic commission   ");
document.getElementById("RM_LicComm").focus();
return false;
}	
	
RTCharge=document.getElementById("RM_LicCharge").value;
RTCharge=RTCharge.replace(/^\s+|\s+$/, '');
if(RTCharge==""){
alert("Please enter  Commission for Lic Charge  ");
document.getElementById("RM_LicCharge").focus();
return false;
}
if (isNaN(RTCharge)){ 
alert( "- Please enter your quantity as a number for Lic Charge");
document.getElementById("RM_LicCharge").focus();
return false;
 } 	
if(Number(RTCharge)<0){
alert( "- Please enter your quantity as a positive number for ILic Charge");
document.getElementById("RM_LicCharge").focus();
return false;
}		
 WLComm=Number(document.getElementById ( "CM_LicComm" ).textContent);
 WLCharge=Number(document.getElementById ( "CM_LicCharge" ).textContent);
 RTComm=Number(document.getElementById("RM_LicComm").value);
 RTCharge=Number(document.getElementById("RM_LicCharge").value);
 var DSComm=document.getElementById("DS_LicComm").value;
 var DSCharge=document.getElementById("DS_LicCharge").value;
 var AgentComm=document.getElementById("Agent_LicComm").value;
 var AgentCharge=document.getElementById("Agent_LicCharge").value;

var totalComm=Number(DSComm)+Number(RTComm)+Number(AgentComm);
var limitComm=Number(WLComm)-Number(DSComm)-Number(AgentComm);
var totalCharge=Number(DSCharge)+Number(RTCharge)+Number(AgentCharge);
var limitCharge=Number(WLCharge)-Number(DSCharge)-Number(AgentCharge);

if(WLComm<totalComm){
alert("Commision for Lic is not permitted to set  more than "+limitComm.toFixed(2))
document.getElementById("RM_LicComm").focus();
return false;
}
if(WLCharge<totalCharge){
alert("Charge for Lic is not permitted to set  more than "+limitCharge.toFixed(2))
document.getElementById("RM_LicCharge").focus();
return false;
}
}

if(IdNo=="8"){
		RTComm=document.getElementById("RM_MaxNewYorkComm").value;
RTComm=RTComm.replace(/^\s+|\s+$/, '');
if(RTComm==""){
alert("Please enter  Commission for MaxNewYork");
document.getElementById("RM_MaxNewYorkComm").focus();
return false;
}
if (isNaN(RTComm)){ 
alert( "- Please enter your quantity as a number for MaxNewYork commission ");
document.getElementById("RM_MaxNewYorkComm").focus();
return false;
 } 	
if(Number(RTComm)<0){
alert( "- Please enter your quantity as a positive number for MaxNewYork commission   ");
document.getElementById("RM_MaxNewYorkComm").focus();
return false;
}	
	
RTCharge=document.getElementById("RM_MaxNewYorkCharge").value;
RTCharge=RTCharge.replace(/^\s+|\s+$/, '');
if(RTCharge==""){
alert("Please enter  Commission for MaxNewYork Charge  ");
document.getElementById("RM_MaxNewYorkCharge").focus();
return false;
}
if (isNaN(RTCharge)){ 
alert( "- Please enter your quantity as a number for MaxNewYork Charge");
document.getElementById("RM_MaxNewYorkCharge").focus();
return false;
 } 	
if(Number(RTCharge)<0){
alert( "- Please enter your quantity as a positive number for IMaxNewYork Charge");
document.getElementById("RM_MaxNewYorkCharge").focus();
return false;
}	
WLComm=Number(document.getElementById ( "CM_MaxNewYorkComm" ).textContent);
 WLCharge=Number(document.getElementById ( "CM_MaxNewYorkCharge" ).textContent);
 RTComm=Number(document.getElementById("RM_MaxNewYorkComm").value);
 RTCharge=Number(document.getElementById("RM_MaxNewYorkCharge").value);
 var DSComm=document.getElementById("DS_MaxNewYorkComm").value;
 var DSCharge=document.getElementById("DS_MaxNewYorkCharge").value;
 var AgentComm=document.getElementById("Agent_MaxNewYorkComm").value;
 var AgentCharge=document.getElementById("Agent_MaxNewYorkCharge").value;

var totalComm=Number(DSComm)+Number(RTComm)+Number(AgentComm);
var limitComm=Number(WLComm)-Number(DSComm)-Number(AgentComm);
var totalCharge=Number(DSCharge)+Number(RTCharge)+Number(AgentCharge);
var limitCharge=Number(WLCharge)-Number(DSCharge)-Number(AgentCharge);

if(WLComm<totalComm){
alert("Commision for Airtel  Service Recharge is not permitted to set  more than "+limitComm.toFixed(2))
document.getElementById("RM_MaxNewYorkComm").focus();
return false;
}
if(WLCharge<totalCharge){
alert("Charge for TATA  Service Recharge is not permitted to set  more than "+limitCharge.toFixed(2))
document.getElementById("RM_MaxNewYorkCharge").focus();
return false;
}
}

if(IdNo=="9"){
			RTComm=document.getElementById("RM_METLIFEComm").value;
RTComm=RTComm.replace(/^\s+|\s+$/, '');
if(RTComm==""){
alert("Please enter  Commission for METLIFE");
document.getElementById("RM_METLIFEComm").focus();
return false;
}
if (isNaN(RTComm)){ 
alert( "- Please enter your quantity as a number for METLIFE commission ");
document.getElementById("RM_METLIFEComm").focus();
return false;
 } 	
if(Number(RTComm)<0){
alert( "- Please enter your quantity as a positive number for METLIFE commission   ");
document.getElementById("RM_METLIFEComm").focus();
return false;
}	
	
RTCharge=document.getElementById("RM_METLIFECharge").value;
RTCharge=RTCharge.replace(/^\s+|\s+$/, '');
if(RTCharge==""){
alert("Please enter  Commission for METLIFE Charge  ");
document.getElementById("RM_METLIFECharge").focus();
return false;
}
if (isNaN(RTCharge)){ 
alert( "- Please enter your quantity as a number for METLIFE Charge");
document.getElementById("RM_METLIFECharge").focus();
return false;
 } 	
if(Number(RTCharge)<0){
alert( "- Please enter your quantity as a positive number for IMETLIFE Charge");
document.getElementById("RM_METLIFECharge").focus();
return false;
}
 WLComm=Number(document.getElementById ( "CM_METLIFEComm" ).textContent);
 WLCharge=Number(document.getElementById ( "CM_METLIFECharge" ).textContent);
 RTComm=Number(document.getElementById("RM_METLIFEComm").value);
 RTCharge=Number(document.getElementById("RM_METLIFECharge").value);
 var DSComm=document.getElementById("DS_METLIFEComm").value;
 var DSCharge=document.getElementById("DS_METLIFECharge").value;
 var AgentComm=document.getElementById("Agent_METLIFEComm").value;
 var AgentCharge=document.getElementById("Agent_METLIFECharge").value;

var totalComm=Number(DSComm)+Number(RTComm)+Number(AgentComm);
var limitComm=Number(WLComm)-Number(DSComm)-Number(AgentComm);
var totalCharge=Number(DSCharge)+Number(RTCharge)+Number(AgentCharge);
var limitCharge=Number(WLCharge)-Number(DSCharge)-Number(AgentCharge);

if(WLComm<totalComm){
alert("Commision for Airtel  Service Recharge is not permitted to set  more than "+limitComm.toFixed(2))
document.getElementById("RM_METLIFEComm").focus();
return false;
}
if(WLCharge<totalCharge){
alert("Charge for TATA  Service Recharge is not permitted to set  more than "+limitCharge.toFixed(2))
document.getElementById("RM_METLIFECharge").focus();
return false;
}
}

if(IdNo=="10"){
RTComm=document.getElementById("RM_TATAAIGComm").value;
RTComm=RTComm.replace(/^\s+|\s+$/, '');
if(RTComm==""){
alert("Please enter  Commission for TATAAIG");
document.getElementById("RM_TATAAIGComm").focus();
return false;
}
if (isNaN(RTComm)){ 
alert( "- Please enter your quantity as a number for TATAAIG commission ");
document.getElementById("RM_TATAAIGComm").focus();
return false;
 } 	
if(Number(RTComm)<0){
alert( "- Please enter your quantity as a positive number for TATAAIG commission   ");
document.getElementById("RM_TATAAIGComm").focus();
return false;
}	
	
RTCharge=document.getElementById("RM_TATAAIGCharge").value;
RTCharge=RTCharge.replace(/^\s+|\s+$/, '');
if(RTCharge==""){
alert("Please enter  Commission for TATAAIG Charge  ");
document.getElementById("RM_TATAAIGCharge").focus();
return false;
}
if (isNaN(RTCharge)){ 
alert( "- Please enter your quantity as a number for TATAAIG Charge");
document.getElementById("RM_TATAAIGCharge").focus();
return false;
 } 	
if(Number(RTCharge)<0){
alert( "- Please enter your quantity as a positive number for ITATAAIG Charge");
document.getElementById("RM_TATAAIGCharge").focus();
return false;
}
WLComm=Number(document.getElementById ( "CM_TATAAIGComm" ).textContent);
 WLCharge=Number(document.getElementById ( "CM_TATAAIGCharge" ).textContent);
 RTComm=Number(document.getElementById("RM_TATAAIGComm").value);
 RTCharge=Number(document.getElementById("RM_TATAAIGCharge").value);
 var DSComm=document.getElementById("DS_TATAAIGComm").value;
 var DSCharge=document.getElementById("DS_TATAAIGCharge").value;
 var AgentComm=document.getElementById("Agent_TATAAIGComm").value;
 var AgentCharge=document.getElementById("Agent_TATAAIGCharge").value;

var totalComm=Number(DSComm)+Number(RTComm)+Number(AgentComm);
var limitComm=Number(WLComm)-Number(DSComm)-Number(AgentComm);
var totalCharge=Number(DSCharge)+Number(RTCharge)+Number(AgentCharge);
var limitCharge=Number(WLCharge)-Number(DSCharge)-Number(AgentCharge);

if(WLComm<totalComm){
alert("Commision for Airtel  Service Recharge is not permitted to set  more than "+limitComm.toFixed(2))
document.getElementById("RM_TATAAIGComm").focus();
return false;
}
if(WLCharge<totalCharge){
alert("Charge for TATA  Service Recharge is not permitted to set  more than "+limitCharge.toFixed(2))
document.getElementById("RM_TATAAIGCharge").focus();
return false;
}
}
}
}
}
}
var criteria=document.update.PayPremiumMDCommCriteria.value;
var user=document.getElementById("userTypeForComm").value;


if(criteria=="PayPremiumMD")
{
document.update.action="UpdateMDPayPremiumWithMDID.action";
document.update.submit();
}	
if(criteria=="clientID")
{
document.update.action="UpdateMDPayPremiumWithClientId.action";
document.update.submit();
}
}