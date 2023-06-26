public class MyPage_Controller {

    public PageReference gotoLink(){
        PageReference pr = new PageReference('https://www.google.com');
        return pr;
    }
    
}