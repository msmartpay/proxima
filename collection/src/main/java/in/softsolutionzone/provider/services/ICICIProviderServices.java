package in.softsolutionzone.provider.services;

import org.json.JSONObject;

import in.softsolutionzone.payout.model.ICICIClientRegistrationResponseModel;
import in.softsolutionzone.payout.model.ICICIClientRegistrationStatusResponseModel;
import in.softsolutionzone.payout.model.PayoutRequestModel;

public interface ICICIProviderServices {
	
	JSONObject payouts(PayoutRequestModel payoutRequestModel, String UNIQUEID);
	
	ICICIClientRegistrationResponseModel registration( String UNIQUEID);
	
	ICICIClientRegistrationStatusResponseModel registrationStatus( String UNIQUEID);

	JSONObject transactionStatus(String UNIQUEID);

	JSONObject getStatement(String fromDate, String toDate);

	JSONObject balanceheck();

}