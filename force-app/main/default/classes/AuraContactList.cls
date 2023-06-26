public class AuraContactList {

	@AuraEnabled
	public static List<Contact> getContactList() {
        
        List<Contact> conList = [select FirstName, LastName from Contact limit 10];
        return conList;
        
    }
}