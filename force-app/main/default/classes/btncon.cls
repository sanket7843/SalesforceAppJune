public with sharing class btncon {
    
    public string greeting{set; get;}
    private Contact cc;
    
    public btncon(Apexpages.StandardController sc){
        this.cc = (contact)sc.getRecord();
    }
    
    public pageReference doSomething(){
        greeting = 'Hello '+cc.Id;
        return null;
    }

}