trigger PreventAccountFromDeletionTrigger on Account (before delete) {

    //get all the account ID
    list<id> accId = new list<id>();
    for(account acc:trigger.new){
        accId.add(acc.Id);
    }
    
    //get all the contact id with associated ID 
    map<id,account> accCon = new map<id,account> ([select id, (select lastname from contacts) from account where Id IN :accID]);
    
    for(account acc: trigger.new){
        if(acccon.get(acc.id).contacts.size()> 0){
            acc.adderror('Cannot delete account with active contact');
        }
    }
    
}