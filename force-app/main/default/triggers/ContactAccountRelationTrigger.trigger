trigger ContactAccountRelationTrigger on Contact (before insert) {

    for(contact con : trigger.new){
        if(con.accountId!=null){
            account acc = [select phone from account where id =:con.AccountId];
            con.Phone = acc.Phone;
        }
    }
}