package com.msmart.dmr;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

import com.common.PropertyFile;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class DMRApi {
	
	Logger logger=Logger.getLogger(DMRApi.class);

	public HashMap<String, Object> getFindSender(String SenderId,String key,String agentId) {

		HashMap<String, Object> slimitMap=null;
		JSONObject jsonobj=null;
		HashMap<String, Object> findsenderMap=null;
		HashMap<String, Object> sdMap=null;
		findsenderMap=new HashMap<>();
		try {
			ArrayList<HashMap<String, Object>> BeneList=new ArrayList<>();

			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", SenderId);
			logger.info("request:"+fsJson);

			jsonobj =callApi("FindSender", fsJson);


			logger.info("DMRApi.getFindSender()"+jsonobj.toString());

			String status=jsonobj.getString("Status");
			if("0".equalsIgnoreCase(status)){

				JSONArray BeneListArray=jsonobj.getJSONArray("BeneList");
				if(BeneListArray!=null && BeneListArray.length()>0)
				{
					for (int i = 0; i < BeneListArray.length(); i++) {

						JSONObject object=BeneListArray.getJSONObject(i);
						HashMap<String, Object> BeneListMap=new HashMap<>();
						BeneListMap.put("RecipientId", object.get("RecipientId"));
						BeneListMap.put("RecipientIdType", object.get("RecipientIdType"));
						BeneListMap.put("BeneName", object.get("BeneName"));
						BeneListMap.put("Account", object.get("Account"));
						BeneListMap.put("Ifsc", object.get("Ifsc"));
						BeneListMap.put("BankName", object.get("BankName"));
						BeneListMap.put("BeneMobile", object.get("BeneMobile"));
						BeneListMap.put("IMPS", object.get("IMPS"));
						BeneListMap.put("NEFT", object.get("NEFT"));
						BeneListMap.put("Channel", object.get("Channel"));
						BeneList.add(BeneListMap);

					}

				}

				JSONObject SenderLimitDetails=jsonobj.getJSONObject("SenderLimitDetails");
				if(SenderLimitDetails!=null)
				{
					slimitMap=new HashMap<>();

					slimitMap.put("KycStatus", SenderLimitDetails.get("KycStatus"));
					slimitMap.put("SenderLimit", SenderLimitDetails.get("SenderLimit"));
					slimitMap.put("UsedLimit", SenderLimitDetails.get("UsedLimit"));
					slimitMap.put("AvailableLimit", SenderLimitDetails.get("AvailableLimit"));
				}
				JSONObject SenderDetails=jsonobj.getJSONObject("SenderDetails");
				if(SenderDetails!=null)
				{
					sdMap=new HashMap<>();

					sdMap.put("SenderId", SenderDetails.get("SenderId"));
					sdMap.put("Name", SenderDetails.get("Name"));
				}
				
				findsenderMap.put("BeneList", BeneList);
				findsenderMap.put("slimitMap", slimitMap);
				findsenderMap.put("sdMap", sdMap);
				findsenderMap.put("Status", jsonobj.getString("Status"));
				findsenderMap.put("message", jsonobj.getString("message"));



			}
			else if("2".equalsIgnoreCase(status)) {
				
				findsenderMap.put("Status", jsonobj.getString("Status"));
				findsenderMap.put("message", jsonobj.getString("message"));
				
				JSONObject SenderDetails=jsonobj.getJSONObject("SenderDetails");
				if(SenderDetails!=null)
				{
					sdMap=new HashMap<>();

					sdMap.put("SenderId", SenderDetails.get("SenderId"));
					sdMap.put("Name", SenderDetails.get("Name"));
				}
				
				findsenderMap.put("sdMap", sdMap);

			}else if("3".equalsIgnoreCase(status)) {
				findsenderMap.put("Status", jsonobj.getString("Status"));
				findsenderMap.put("message", jsonobj.getString("message"));

			}else{
				findsenderMap.put("Status", jsonobj.getString("Status"));
				findsenderMap.put("message", jsonobj.getString("message"));
			}

			logger.info("findsender : "+jsonobj.toString());

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return findsenderMap;
	}

	public HashMap<String, Object> getRegisterSender(String SenderId,String SenderName,String Address,String DOB,String tranKey,String agentId) {

		JSONObject jsonobj=null;
		String message=null;
		HashMap<String, Object> hashMap=new HashMap<>();;
		try {

			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", tranKey);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", SenderId);
			fsJson.put("SenderName", SenderName);
			fsJson.put("Pincode", Address);
			fsJson.put("DOB", DOB);
			
			logger.info("request:"+fsJson);
			jsonobj =callApi("RegisterSender", fsJson);

			if(jsonobj!=null){
				logger.info("DMRApi.getRegisterSender()"+jsonobj.toString());
				logger.info("DMRApi.request"+jsonobj.toString());
				message=jsonobj.getString("message");
				String status=jsonobj.getString("Status");
				hashMap.put("Status", status);
				hashMap.put("message", message);
			}else{
				hashMap.put("Status", "1");
				hashMap.put("message", "Technical Failure");
			}

			logger.info("findsender : "+jsonobj.toString());

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return hashMap;
	}
	public JSONObject getverifySender(String SenderId,String SenderName,String Address,String DOB, String otp,String key,String agentId) {

		JSONObject jsonobj=null;
		
		try {

			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", SenderId);
			fsJson.put("SenderName", SenderName);
			fsJson.put("Pincode", Address);
			fsJson.put("DOB", DOB);
			fsJson.put("OTP", otp);
			logger.info("request:"+fsJson);
			jsonobj =callApi("VerifySender", fsJson);

			logger.info("DMRApi.Response"+jsonobj.toString());


		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return jsonobj;
	}

	public JSONObject registerRessendOTP(String senderId,String key,String agentId) {

		JSONObject jsonobj=null;
		try {


			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", senderId);
			logger.info("request:"+fsJson);
			
			jsonobj =callApi("ReSendOTPRegisterSender", fsJson);

			

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return jsonobj;
	}
	
	public ArrayList<HashMap<String, Object>> getBankList(String senderId,String key,String agentId) {

		JSONObject jsonobj=null;
		ArrayList<HashMap<String, Object>> arrayList=new ArrayList<>();
		try {


			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", senderId);
			logger.info("request:"+fsJson);
			jsonobj =callApi("GetBankList", fsJson);

			logger.info("DMRApi.getRegisterSender()"+jsonobj.toString());
			logger.info("DMRApi.request"+jsonobj.toString());

			String status=jsonobj.getString("Status");
			if("0".equalsIgnoreCase(status)){

				JSONArray bankArry=jsonobj.getJSONArray("BankList");
				if(bankArry!=null && bankArry.length()>0)
				{
					for (int j = 0; j < bankArry.length(); j++) {
						JSONObject jsonObject=bankArry.getJSONObject(j);
						HashMap<String, Object> hashMap=new HashMap<>();
						hashMap.put("bname", jsonObject.get("bname"));
						hashMap.put("bcode", jsonObject.get("bcode"));
						hashMap.put("ifscCode", jsonObject.get("ifscCode"));
						arrayList.add(hashMap);
					}

				}

			}
			else {

			}
			logger.info("findsender : "+jsonobj.toString());

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return arrayList;
	}
	public HashMap<String, Object> getaddEbne(String senderId, String bankcode, String bankAccount, String BankName, String iFSC,String REQUEST_ID,String key,String agentId) {

		JSONObject jsonobj=null;
		HashMap<String, Object> hashMap=null;
		try {


			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", senderId);
			fsJson.put("BankAccount", bankAccount);
			fsJson.put("BankCode", bankcode);
			fsJson.put("BankName", BankName);
			fsJson.put("IFSC", iFSC);
			fsJson.put("REQUEST_ID", REQUEST_ID);
			/*	fsJson.put("beneName", beneName);*/
			logger.info("request:"+fsJson);
			jsonobj =callApi("AccountVerifyByBankAccountIFSC", fsJson);
			/*logger.info("DMRApi.getaddEbne()"+jsonobj.toString());*/

			logger.info("DMRApi.request"+jsonobj.toString());

			String status=jsonobj.getString("Status");
			if("0".equalsIgnoreCase(status)){
				hashMap=new HashMap<>();
				hashMap.put("AccountNo", jsonobj.get("AccountNo"));
				hashMap.put("BankName", jsonobj.get("BankName"));
				hashMap.put("BeneName", jsonobj.get("BeneName"));
				hashMap.put("TxnId", jsonobj.get("TxnId"));
				hashMap.put("IFSC", jsonobj.get("IFSC"));
				hashMap.put("SenderId",senderId);
				hashMap.put("message",jsonobj.get("message"));

			}
			else {
				hashMap=new HashMap<>();
				hashMap.put("message",jsonobj.get("message"));
				

			}
			hashMap.put("Status",status);
			logger.info("findsender : "+jsonobj.toString());

		} catch (Exception e) {

			e.printStackTrace();
			hashMap=new HashMap<>();
			hashMap.put("message","Technical failure.");
			hashMap.put("Status","1");
			return null;
		}
		return hashMap;
	}

	public JSONObject confirmaddbene(String senderId, String bankAccount, String beneName, String iFSC,
			String BeneMobile,String bankcode,String key,String agentId,String BankName) {

		JSONObject jsonobj=null;
		try {



			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", senderId);
			fsJson.put("BankAccount", bankAccount);
			fsJson.put("BeneName", beneName);
			fsJson.put("IFSC", iFSC);
			fsJson.put("BeneMobile", BeneMobile);
			fsJson.put("BankCode", bankcode);
			fsJson.put("BankName", BankName);
			fsJson.put("varify", "N");
			/*	fsJson.put("REQUEST_ID", REQUEST_ID);
			 */
			logger.info("request:"+fsJson);
			jsonobj =callApi("AddBeneAfterVerify", fsJson);

			logger.info("DMRApi.request"+jsonobj.toString());


		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return jsonobj;
	}
	public JSONObject getInitiateTransaction(String senderId, String senderName, String beneMobile,
			String beneAccount, String beneName, String iFSC, String txnType,
			String bankName, String txnAmount, String remark, String RecipientId,String REQUEST_ID,String key,String agentId) {

		JSONObject jsonobj=null;
		try {



			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", senderId);
			fsJson.put("SenderName", senderName);
			fsJson.put("BeneMobile", beneMobile);
			fsJson.put("BeneAccount", beneAccount);
			fsJson.put("BeneName", beneName);
			fsJson.put("Ifsc", iFSC);
			fsJson.put("TxnType", txnType);
			fsJson.put("TxnAmount", txnAmount);
			fsJson.put("Remark", remark);
			fsJson.put("BankName", bankName);
			fsJson.put("RecipientId", RecipientId);
			fsJson.put("REQUEST_ID", REQUEST_ID);

			logger.info("request:"+fsJson);
			MoneyTransferDao dao=new MoneyTransferDao();
			dao.insertEKOLogs("EKO", REQUEST_ID, fsJson.toString(), agentId);
			
			jsonobj =callApi("InitiateTransaction", fsJson);
			if(jsonobj!=null)
				dao.updateEKOLogs(REQUEST_ID, jsonobj.toString(), agentId);


			return jsonobj;
		} catch (Exception e) {

			e.printStackTrace();
			return jsonobj;
		}
	}

	public ArrayList<HashMap<String, Object>> getSenderHistory(String senderId,String key,String agentId) {

		JSONObject jsonobj=null;
		ArrayList<HashMap<String, Object>>senderList=new ArrayList<>();
		HashMap<String, Object>initiateMap=null;
		JSONObject jsonObject=null;
		try {



			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", senderId);
			logger.info("request:"+fsJson);
			jsonobj =callApi("SenderHistory", fsJson);

			/*logger.info("DMRApi.request"+jsonobj.toString());*/

			String status=jsonobj.getString("Status");
			if("0".equalsIgnoreCase(status)){

				JSONArray array=jsonobj.getJSONArray("Statement");
				if(array!=null && array.length()>0)
				{
					for (int j = 0; j < array.length(); j++) {


						jsonObject=array.getJSONObject(j);
						initiateMap=new HashMap<>();
						initiateMap.put("SenderId", jsonObject.getString("SenderId"));
						initiateMap.put("TranNo", jsonObject.getString("TranNo"));
						initiateMap.put("Dot", jsonObject.getString("Dot"));
						initiateMap.put("Tot", jsonObject.getString("Tot"));
						initiateMap.put("Amount", jsonObject.getString("Amount"));
						initiateMap.put("BankrefId", jsonObject.getString("BankrefId"));
						initiateMap.put("BeneName", jsonObject.getString("BeneName"));
						initiateMap.put("BeneBankName", jsonObject.getString("BeneBankName"));
						initiateMap.put("BeneBankIfsc", jsonObject.getString("BeneBankIfsc"));
						initiateMap.put("BeneAccount", jsonObject.getString("BeneAccount"));
						initiateMap.put("TransactionType", jsonObject.getString("TransactionType"));
						initiateMap.put("Status", jsonObject.getString("Status"));
						senderList.add(initiateMap);
					}
					return senderList;
				}

			}
			else {


			}

			logger.info("findsender : "+jsonobj.toString());

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return senderList;
	}
	
	public JSONObject getBankDetails(String senderId, String bankcode,String key,String agentId) {

		JSONObject jsonobj=null,response=null;
		try {


			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", senderId);
			fsJson.put("BankCode", bankcode);
			fsJson.put("IFSC", "");
			logger.info("request:"+fsJson);
			jsonobj =callApi("BankDetails", fsJson);
			logger.info("DMRApi.getBankDetails()"+jsonobj.toString());

			logger.info("DMRApi.request"+jsonobj.toString());

			String message=jsonobj.getString("message");
			String status=jsonobj.getString("Status");
			response=new JSONObject();
			if("0".equalsIgnoreCase(status)){
				
				String isverificationavailable= jsonobj.getString("isverificationavailable");
				String availableChannels= jsonobj.getString("available_channels");
				String ifsc_status= jsonobj.getString("ifsc_status");
				response.put("isverificationavailable",isverificationavailable);
				response.put("availableChannels",availableChannels);
				response.put("ifsc_status",ifsc_status);
				response.put("Status","0");
				
			}else{
				response.put("Status","1");
			}
			response.put("message", message);
			logger.info("findsender : "+jsonobj.toString());

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return response;
	}

	public JSONObject deleteBene(String senderId,String beneId,String key,String agentId) {

		JSONObject jsonobj=null;
		try {


			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", senderId);
			fsJson.put("BeneficiaryId", beneId);
			logger.info("request:"+fsJson);
			
			jsonobj =callApi("DeleteBene", fsJson);

			

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return jsonobj;
	}

	public JSONObject liveStatus(String senderId,String tranRefId,String key,String agentId) {

		JSONObject jsonobj=null;
		try {


			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", senderId);
			fsJson.put("TransactionRefNo", tranRefId);
			logger.info("request:"+fsJson);
			
			jsonobj =callApi("TransStatus", fsJson);

			

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return jsonobj;
	}
	
	public JSONObject getRefundOTP(String senderId,String tranRefId,String key,String agentId) {

		JSONObject jsonobj=null;
		try {


			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", senderId);
			fsJson.put("TransactionRefNo", tranRefId);
			logger.info("request:"+fsJson);
			
			jsonobj =callApi("RefundTransaction", fsJson);

			

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return jsonobj;
	}
	
	public JSONObject confirmRefund(String senderId,String tranRefId,String otp,String key,String agentId) {

		JSONObject jsonobj=null;
		try {


			JSONObject fsJson=new JSONObject();
			fsJson.put("Key", key);
			fsJson.put("AgentID", agentId);
			fsJson.put("SenderId", senderId);
			fsJson.put("TransactionRefNo", tranRefId);
			fsJson.put("OTP", otp);
			logger.info("request:"+fsJson);
			
			jsonobj =callApi("RefundDMRConfirm", fsJson);

			

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return jsonobj;
	}


	public JSONObject callApi(String url,JSONObject obj) {

		JSONObject jsonobj;
		try {

			String output;
			Client client = Client.create();

			String finalUrl=PropertyFile.MRA_VENUS_URL+url;
			logger.info("URL : "+finalUrl);
			WebResource webResource = client.resource(finalUrl);

			ClientResponse response = webResource.type("application/json").post(ClientResponse.class, obj==null?obj:obj.toString());

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			logger.info("Output from Server .... \n");  
			output = response.getEntity(String.class);
			jsonobj =new  JSONObject(output);

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
		return jsonobj;
	}








}