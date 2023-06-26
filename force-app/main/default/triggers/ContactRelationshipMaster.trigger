trigger ContactRelationshipMaster on Contact_Relationship__c (before update) {

    set<id> ownerId = new set<id>();
    
    for(Contact_Relationship__c c: trigger.new){
            ownerId.add(c.OwnerId);
        }
    
    map<id,string> userData = new map<id,string>();
    
    list<user> userName = new list<user>([select id, name from user where id in :ownerId]);
    
    for(user u : userName){
        userData.put(u.id, u.name);
    }
    
    if(userName.size()>0 && username !=null){
        for(Contact_Relationship__c cr : trigger.new){
            cr.Owner_Name__c = userData.get(cr.OwnerId);
        }
    }
    
    
    
}