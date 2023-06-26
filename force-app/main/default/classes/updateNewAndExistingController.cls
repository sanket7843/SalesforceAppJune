public class updateNewAndExistingController {

    public final Account account{get; private set;}
    
    public updateNewAndExistingController(){
        Id id = Apexpages.currentPage().getParameters().get('id');
        
        account = (id==null) ? new Account() :
            [select id, name, phone from account where id=:id];
    }
    
    public pagereference save(){
        try{
            upsert account;
        }
        catch(system.DmlException e){
            ApexPages.addMessages(e);
            return null;
        }
        PageReference pf = new ApexPages.StandardController(Account).view();
        return pf;
    }
     	
}