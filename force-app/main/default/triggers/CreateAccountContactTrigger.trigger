trigger CreateAccountContactTrigger on Account (after insert) {

    list<contact> conList = new List<contact>();
    
    for(account acc : trigger.new){
        if(acc.Industry=='Banking'){
            contact con = new Contact(lastname= acc.Name, phone=acc.Phone);
        	conlist.add(con);
        }
    }
    
    insert conlist;
    
}