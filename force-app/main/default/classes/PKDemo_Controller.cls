public class PKDemo_Controller {
    /*
	*  Method: insertNewContact
	*  Description: This method is used to insert a new Contact with a related Account
	*  Author: Martin Torres	
	*/
    @AuraEnabled
    public static void insertNewContact(String contactName, String contactLastName, String accountName) {
        Account newAccountObj = new Account();
        newAccountObj.Name = accountName;
        
        try {
            insert newAccountObj;
            
            Contact newContactObj = new Contact();
            newContactObj.LastName = contactLastName;
            newContactObj.FirstName = contactName;
            newContactObj.AccountId = newAccountObj.Id;
            insert newContactObj;
        } catch (Exception e) {
            System.debug('Error description: ' + e.getMessage());
            System.debug('Error description additional: ' + e.getMessage());
        }
    }
}