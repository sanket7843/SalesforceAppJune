trigger DemoAccountTrigger on Account (after insert) {
	list<contact> conListToUpdate = new list<Contact>();
    
    for(account acc : Trigger.new){
        Contact con = new contact(lastname= acc.Name, AccountId = acc.id, email='trigger@gmail.com');
        system.debug('contact inserted for account:'+ acc.id);
        conListToUpdate.add(con);
    }
    insert conlisttoupdate;
}