trigger assignment11Trigger on Account (before insert, after insert) {

    if(trigger.isAfter){
    
    //get the totalproduct for all the account objcet        
    list<account> totalProduct = [select id, Quantity__c from account where Working_in__c ='ASIA'];
        if(totalProduct.size()>0){
    		list<opportunity> opp = [select id, TotalOpportunityQuantity, accountid from opportunity where StageName = 'Closed Won' 
                                     AND accountId in :totalProduct];
       	
	
	//get the total product in decimal        
    decimal totalProductDigit=0;
    for(opportunity op : opp){
        
        }
     }
}
}