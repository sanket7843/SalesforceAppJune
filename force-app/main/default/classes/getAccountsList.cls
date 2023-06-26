public with sharing class getAccountsList {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountByEmployee(Integer numberOfEmployee) {
            return [
                SELECT Name 
                FROM Account
                WHERE numberofemployee__c >= :numberOfEmployee
            ];
    }
}