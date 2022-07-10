public class OlderAccountsUtility {
    public static void updateOlderAccounts(){
        // Get the 5 oldest accounts
        Account[] oldAccounts = [ SELECT id, Description FROM Account ORDER BY CreatedDate ASC LIMIT 5];
        
        // Loop through and update the Description field
        for (Account acct : oldAccounts) {
            acct.Description = 'Heritage Account';
        } 
        
        // Save changes
        update oldAccounts;
    }
}