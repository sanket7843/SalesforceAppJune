public with sharing class CreateContactUtility {
    public static void CreateContact(List<Account> accList){
        List<Contact> conList = new List<contact> ();
        if(accList.size() > 0 && accList != null){
        for(Account acc : acclist){
            Contact con = new Contact(lastname = acc.Name+'2', accountId = acc.Id, email='trigger@trigger.com');
            conList.add(con);
        }
            }
        insert conList;
    } 
}