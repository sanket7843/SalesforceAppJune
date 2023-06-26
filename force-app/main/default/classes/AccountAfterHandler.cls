@isTest
private class AccountAfterHandler {
@isTest
    static void testMe9(){
        integer totalAccount = [select count() from account];
        integer totalContact = [select count() from contact];
        Account acc = new account(name='TestAccount', phone='1234567890');
        
        test.startTest();
        insert acc;
        test.stopTest();
        
        contact c = [select lastname, phone from contact where accountid=:acc.Id limit 1];
        
        system.assertEquals(acc.Phone, c.phone);
        system.assertEquals(acc.name, c.lastname);
        
        integer newTotalAccount = [select count() from account];
        integer newTotalContact = [select count() from contact];
        
        system.assertEquals(totalAccount+1, newTotalAccount);
        system.assertEquals(totalContact+1, newTotalAccount);
        
        
    }
}