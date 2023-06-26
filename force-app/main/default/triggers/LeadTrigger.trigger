trigger LeadTrigger on Lead (before update, after update) {
    
    System.debug('Trigger size: ' + Trigger.size);
    System.debug('Execution Status: ' + Trigger.isExecuting);
    System.debug('Operation Type: ' + Trigger.OperationType);
    
    
    for(Lead leadRecord : Trigger.new){
        if(Trigger.isBefore && String.isBlank(leadRecord.LeadSource)){
            LeadRecord.LeadSource = 'Other';
        }
        
        if((leadRecord.status == 'Closed - Converted' || leadRecord.status == 'Closed - Not Converted') && 
           		Trigger.oldMap.get(leadRecord.Id).status == 'Open - Not Contacted') {
            leadRecord.Status.addError('You cannot directly close an open record');
        }
    }
}