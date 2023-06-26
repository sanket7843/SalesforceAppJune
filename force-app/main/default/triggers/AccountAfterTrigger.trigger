trigger AccountAfterTrigger on Account (after insert) {

    list<Contact> conList = new list<Contact>();
    
    for(Account acc : trigger.new){
        Contact con = new Contact (lastname=acc.Name, phone=acc.Phone, AccountId=acc.id);
        conlist.add(con);
    }
    
    insert conList;
    
}