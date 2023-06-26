public with sharing class CTPersonController {

    public static String getToken(String mobileNo){
        blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);

        //get string value
        return EncodingUtil.base64Encode(hash);
    }

    /**
     * return a list of person limit 100
     * @return List[Person__c]
     */
    public static List<Person__c> getRecentHealthChanges(){
        List<Person__c> people = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
        FROM Person__c 
            ORDER BY Status_Update_Date__c 
            DESC NULLS LAST 
            LIMIT 100];
        return people;
    }    

    /**
     * Search a person by name, mobile, token 
     * @return List<Person__c> 
     */
    public static List<Person__c> searchPeople(String searchTerm){
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
            FROM Person__c 
            WHERE Name LIKE :searchTerm 
                OR Mobile__c LIKE :searchTerm 
                OR Token__c LIKE :searchTerm 
            ORDER BY Status_Update_Date__c DESC NULLS LAST];
    }

    /**
     * Search a person by Id
     * @return Person__c 
     */
    public static Person__c getPersonById(String personId){
        List<Person__c> people = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
                FROM Person__c 
                WHERE Id =:personId];

        if( people != null && people.size() >0 ){
            return people[0];
        }
        return null;
    }

    public static Map<String, Integer> getHealthStatusCount(){
        Map<String, Integer> healthCountMap = new Map<String, Integer>();
        for( AggregateResult ar : [SELECT Health_Status__c, Count(id) total 
                                    FROM Person__c 
                                    GROUP BY Health_Status__c]
            ){
                String healthStatus = string.valueOf(ar.get('Health_Status__c'));
                Integer count = Integer.valueOf(ar.get('total'));
                healthCountMap.put(healthStatus, count);
            }    
            return healthCountMap;
    }

}