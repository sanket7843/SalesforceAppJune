public class myExtensionController {
    private Account acc;
    
    public myExtensionController(ApexPages.StandardController sc){
        this.acc = (Account)sc.getRecord();
    }
    
    public string getGreeting(){
        return 'Hello '+acc.name+ ': '+acc.Id;
    }
}