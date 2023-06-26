public with sharing class CTLocationTracingController {
    /**
     * Get all visitor Ids for locationid
     * @param locationId
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> getVisitors(String LocationId){
        return [SELECT Id, Person__c, Location__c, Visit_Date__c, Person__r.Health_Status__c, Person__r.Token__c 
                    FROM Location_Tracing__c
                    WHERE Id =: LocationId
                    ORDER BY Visit_Date__c];
    }

    /**
     * Get all location for personIds
     * @param PersonIds
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> getLocationsByPersonIds(Set<Id> PersonIds){

        return [SELECT Id, Person__c, Location__c
        FROM Location_Tracing__c
        WHERE Person__c IN :PersonIds
        AND Visit_Date__c = LAST_N_DAYS:10];

    }

    /**
     * Get all visitor Ids for locations
     * @param locationIds
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){

        return [SELECT Id, Person__c, Location__c
        FROM Location_Tracing__c
        WHERE Location__c IN :locationIds
        AND Person__r.Health_Status__c = 'Green'
        AND Visit_Date__c = LAST_N_DAYS:10];

    }

    
    /**
     * Get all duplicates
     * @param Location_Tracing__c
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> newLocationTraces) {
        //store the locationId
        Set<Id> locationIds = new Set<Id>();
        //store the personId
        Set<Id> personIds = new Set<Id>();

        for(Location_Tracing__c traces : newLocationTraces) {
            locationIds.add(traces.Location__c);
            personIds.add(traces.Person__c);
        }
        //map of id and set of id
        Map<Id, Set<Id>> mapOfExistingRecords = new Map<Id, Set<Id>>();

        //query existing records
        List<Location_Tracing__c> existingRecords = [SELECT Id, Person__c, Location__c FROM Location_Tracing__c
                                                    WHERE Location__c IN: locationIds AND Person__c IN: personIds];
        //list of duplicate records
        List<Location_Tracing__c> duplicates = new List<Location_Tracing__c>();
        if( existingRecords != null && existingRecords.size()> 0 ) {
            for(Location_Tracing__c trace : existingRecords){
                String locationId = trace.Location__c;
                string personId = trace.Person__c;
                if(! mapOfExistingRecords.containsKey(locationId)){
                    mapOfExistingRecords.put(locationId, new Set<Id>());
                }
                //add person ids to map set
                mapOfExistingRecords.get(locationId).add(personId);
            }

            for (Location_Tracing__c trace : newLocationTraces) {
                //first check for location id
                //if location found in map then search for person id in set

                if(mapOfExistingRecords.containsKey(trace.Location__c) 
                && mapOfExistingRecords.get(trace.Location__c).contains(trace.Person__c)){
                    duplicates.add(trace);
                }
            }

        }

        return duplicates;


    }
}