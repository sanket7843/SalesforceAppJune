trigger OpporUpdateTrigger on Opportunity (before update) {
    
    for(opportunity opp:trigger.new){
        if(opp.StageName=='Closed Won' && trigger.oldmap.get(opp.Id).StageName != 'Closed Won'){
            opp.CloseDate=date.today();
            opp.Type='New Customer';
        }
    }
    
}