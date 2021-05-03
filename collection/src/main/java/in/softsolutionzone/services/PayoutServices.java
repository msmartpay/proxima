package in.softsolutionzone.services;

import org.springframework.http.ResponseEntity;

import in.softsolutionzone.payout.model.PayoutRequestModel;

public interface PayoutServices {
	
	ResponseEntity<?> payouts(PayoutRequestModel payoutRequestModel);
	ResponseEntity<?> registration();
	ResponseEntity<?> registrationStatus(String URN);
	ResponseEntity<?> transactionStatus(String UNIQUEID);
	ResponseEntity<?> getStatement(String fromDate, String toDate);
	ResponseEntity<?> getBalance();
}
