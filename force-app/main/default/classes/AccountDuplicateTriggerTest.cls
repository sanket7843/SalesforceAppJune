@istest
public class AccountDuplicateTriggerTest{
  @istest
    static void myTest(){
      Boolean result =false;
      Account a = new Account();
      a.Name= 'Learnfrenzy1';
      a.Rating='Warm';
      insert a;
  
      try{
      Account a1=new account();
      a1.Name= 'Learnfrenzy';
      a1.Rating='Warm';
      insert a1;
      }
      catch(DMLException ex)
      {
      result=true;
      system.assert(result);
          system.debug('error is: '+ex);
      }
  }
 }