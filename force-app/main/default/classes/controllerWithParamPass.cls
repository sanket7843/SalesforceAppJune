public class controllerWithParamPass {

    Account account {get;set;}
    
    public string getname(){
        return 'Hello';
    }
    
    public account getAccount(){
        if(account==null)
            account = [select name from account where id= :ApexPages.currentPage().getParameters().get('id')];
            return account;
        
    }
    
    public PageReference save(){
        update account;
        PageReference secondPage = page.mySecondPage;
        secondPage.setRedirect(true);
        secondPage.getParameters().put('id', account.id);
        return secondPage;
    }
    
    public pagereference gotoSecondPage(){
        PageReference sp = page.mySecondPage;
        sp.setRedirect(true);
        sp.getParameters().put('id',account.id);
        return sp;
    }
    
}