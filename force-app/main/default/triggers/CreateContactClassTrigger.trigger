trigger CreateContactClassTrigger on Account (after insert) {
    if(trigger.isInsert){
        CreateContactUtility.CreateContact(Trigger.new);
    }
}