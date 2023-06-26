public class ContactSearch {

    public static List<Contact> searchForContacts(String lastname, String mailingPostalCode){
        
        List<Contact> contactList = [select ID, Name from Contact where LastName =: lastname and MailingPostalCode=: mailingPostalCode];
        return contactList;
        
    }
    
}