public with sharing class ContactTriggerHandler {
    public static void afterInsertHandler(List<Contact> newContacts) {
         Set<Id> accountIds = new Set<Id>();
            for(Contact con : newContacts){
                if(String.isNotBlank(con.AccountId)){
                    //write automation logic
                    accountIds.add(con.AccountId);
                }
            }
     
           AccountContactService.updateActiveContatcs(accountIds);

    }
    public static void afterUpdateHandler(List<Contact> newContacts, Map<Id, Contact> oldContactsMap) {
     Set<Id> accountIds = new Set<Id>();
            for(Contact con : newContacts){
                if(String.isNotBlank(con.AccountId) && oldContactsMap.get(con.Id).Active__c != con.Active__c){
                    //write automation logic
                    accountIds.add(con.AccountId);
                   }   else if(oldContactsMap.get(con.Id).AccountId != con.AccountId){
                        accountIds.add(con.AccountId);
                        accountIds.add(oldContactsMap.get(con.Id).AccountId);    
                    }
                }

           AccountContactService.updateActiveContatcs(accountIds);
    }

 public static void afterDeleteHandler(List<Contact> oldContacts) {
         Set<Id> accountIds = new Set<Id>();
            for(Contact con : oldContacts){
                if(String.isNotBlank(con.AccountId)){
                    //write automation logic
                    accountIds.add(con.AccountId);
                }
            }
     
           AccountContactService.updateActiveContatcs(accountIds);

    }

     public static void afterUndeleteHandler(List<Contact> newContacts) {
         Set<Id> accountIds = new Set<Id>();
            for(Contact con : newContacts){
                if(String.isNotBlank(con.AccountId)){
                    //write automation logic
                    accountIds.add(con.AccountId);
                }
            }
     
           AccountContactService.updateActiveContatcs(accountIds);

    }

}