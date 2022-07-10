trigger AccountAddressTrigger on Account (before insert, before update) {
    for (Account a : Trigger.new) {
        if (a.Match_Billing_Address__c==TRUE){
            a.ShippingPostalCode = a.BillingPostalCode;
        } // end if
    } //end for
} // end trigger