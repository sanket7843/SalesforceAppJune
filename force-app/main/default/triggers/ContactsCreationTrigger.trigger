trigger ContactsCreationTrigger on Account (after insert) {

    list<contact> conList = new list<contact>();
    for(account acc:trigger.new){
        for(integer i=0;i<=acc.NumberofLocations__c;i++){
            contact con = new contact(lastname ='Test Trigger');
            conlist.add(con);
        }
    }
    insert conlist;
    
}