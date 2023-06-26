trigger CaseOriginTrigger on Case (before insert) {

    for(Case cs : trigger.new){
        if(cs.Origin == 'Email'){
            cs.Status='New' ;
            cs.Priority = 'Medium';
        }
    }
    
}