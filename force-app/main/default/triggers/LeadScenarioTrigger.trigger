trigger LeadScenarioTrigger on Lead (before insert) {

    for(lead l:trigger.new){
        if(l.LeadSource =='Web'){
            l.rating ='cold';
        }
        else{
            l.rating ='hot';
        }
    }
    
}