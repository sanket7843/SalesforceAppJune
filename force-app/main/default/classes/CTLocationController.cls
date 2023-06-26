public with sharing class CTLocationController {
    
    /**
     * get 100 location records 
     * @return List<Location__c>
     */
    public static List<Location__c> getRecentStatusChanges(){
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
        FROM Location__c 
            ORDER BY Status_Update_Date__c 
            DESC NULLS LAST 
            LIMIT 100];
    }

    /**
     * search location by name, pincode, address
     * @return List<Location__c>
     */
    public static List<Location__c> searchLocations(String searchTerm){
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
            FROM Location__c 
            WHERE Name LIKE :searchTerm 
                OR Pincode__c LIKE :searchTerm
                OR Address__c LIKE :searchTerm
            ORDER BY Status_Update_Date__c 
            DESC NULLS LAST];
    }

    /**
     * search a     location by Id
     * @return Location__c
     */
    public static Location__c getLocationById(String locationId){
        List<Location__c> location = [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c 
                FROM Location__c 
                WHERE Id =:locationId];
        if(location != null && location.size()>0){
            return location[0];
        }
        return null;
    }

    public static Map<String, Integer> getStatusCount(){
        Map<String, Integer> healthCountMap = new Map<String, Integer>();
        for( AggregateResult ar : [SELECT Status__c, Count(id) total 
                                    FROM Location__c 
                                    GROUP BY Status__c]
            ){
                String Status = String.valueOf(ar.get('Status__c'));
                Integer count = Integer.valueOf(ar.get('total'));
                healthCountMap.put(Status, count);
            }    
            return healthCountMap;
    }
}