public class ContactAndLeadSearch {

    public static List<List< SObject>> searchContactsAndLeads(String lastname){
        List<List< SObject>> contactLeadList = [FIND :lastname IN ALL FIELDS RETURNING Contact(Name), Lead(Name)];
        return contactLeadList;
    }
    
}