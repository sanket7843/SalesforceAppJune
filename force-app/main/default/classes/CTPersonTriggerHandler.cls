public with sharing class CTPersonTriggerHandler {
    
     public static void beforeInsert(List<Person__c> newRecords){
        for(Person__c person : newRecords){
            //todo: update health status to green
                person.Health_Status__c = 'Green';
            // todo: generate unique token for person records 
                person.token__c = CTPersonController.getToken(person.Mobile__c);
            }
        }

    public static void beforeUpdate(List<Person__c> newRecords, Map<Id, Person__c> oldRecordsMap){
        for(Person__c person : newRecords){
            //todo: update date after health status update
            if(person.Health_Status__c != oldRecordsMap.get(person.Id).Health_Status__c){
                person.Status_Update_Date__c = Date.today();
            }
        }
    }
}