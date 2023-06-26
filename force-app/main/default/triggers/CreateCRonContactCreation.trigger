trigger CreateCRonContactCreation on Contact (after insert, after update) {

    if(trigger.isAfter){
        ContactMasterhandler.contactMasterHandlerUpdate(trigger.new);
    }
    
  
    
}