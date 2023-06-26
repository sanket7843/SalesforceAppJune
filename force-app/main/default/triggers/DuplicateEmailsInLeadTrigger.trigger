trigger DuplicateEmailsInLeadTrigger on Lead (before insert, before update) {

    list<string> leadOld = new list<string>();
    list<lead> leadEmail = [select email from lead where email !=null];
    
    for(lead l : leadEmail){
        leadOld.add(l.Email);
    }
    
    if(trigger.isBefore){
    if(trigger.isInsert){
    for(lead l : trigger.new){
        if(leadOld.contains(l.Email)){
            l.Email.addError('cannot create email with existing same email for insert.');
            }
        }
      }	
    
    if(trigger.isUpdate){
        for(lead l : trigger.new){
        if(leadOld.contains(l.Email) && l.Email!=trigger.oldmap.get(l.Id).email){
            l.Email.addError('cannot create email with existing same email for update.');
            }
        }
      }
    }
}