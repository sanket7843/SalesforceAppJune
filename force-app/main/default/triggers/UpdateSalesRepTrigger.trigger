trigger UpdateSalesRepTrigger on Account (before insert, before update) {

    set<id> ownerId = new set<id>();
    for(account acc: trigger.new){
        ownerId.add(acc.OwnerId);
    } 
    
    map<id,user> usermap = new map<id,user>([select id, name from user where id in:ownerId]);
    
    for(account acc: trigger.new){
        user ac = usermap.get(acc.OwnerId);
        acc.Sales_Rep__c = ac.name;
    }
    
    
    
}