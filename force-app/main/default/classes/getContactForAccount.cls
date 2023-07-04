public with sharing class getContactForAccount {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactForAccount(Id accountId) {
        return [
            SELECT FirstName, LastName, Email, AccountId
            FROM Contact
            WHERE AccountId = :accountId
        ];
    }
}
 