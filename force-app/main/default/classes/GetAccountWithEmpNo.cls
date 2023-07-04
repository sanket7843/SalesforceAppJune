public with sharing class GetAccountWithEmpNo {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByEmployeeNumber(Integer noOfEmp) {
        return [
            SELECT Name FROM Account WHERE numberofemployee__c >= :noOfEmp
        ];
    }
}