public class ContactMasterhandler {
    
    public static void contactMasterHandlerUpdate(list<contact> conList){
          list<Contact_Relationship__c> cr = new list<Contact_Relationship__c>();
    for(contact c : conList){
        if(c.Contact_Relationship__c==true){
            Contact_Relationship__c cri= new Contact_Relationship__c(name = c.lastname, contact__c = c.id);
            cr.add(cri);
        }
    }
    
    insert cr;
    }
}