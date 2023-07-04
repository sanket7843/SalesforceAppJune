public with sharing class getAccountsList {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByEmployeeNumber(Integer numberOfEmployees) {
            return [
                SELECT Name FROM Account WHERE numberofemployee__c >= :numberOfEmployees
            ];
    }
}