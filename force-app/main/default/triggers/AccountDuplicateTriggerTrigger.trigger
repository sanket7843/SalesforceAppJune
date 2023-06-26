trigger AccountDuplicateTriggerTrigger on Account (before insert, before update) {

    
    for(account acc : trigger.new){
        Account accList = [select id, name from account where name =: acc.Name limit 1];
        if(acc.Name != accList.name){
            acc.addError('Cannot create an account with same name');
        }
    }
}