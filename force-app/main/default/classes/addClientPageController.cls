public class addClientPageController {
    
    public Client_AdVertIn__c clientAdVertIn { get; set; }
    public String accountId{ get; set; }    
    public String userRole{ get;set; }
    public String username { get; set; }
    public String firstname { get; set; }
    public String email { get; set; }   
    public String phone { get; set; }      
    public List<Client_AdVertIn__c> clientRecords { get; set; }

    public addClientPageController() {
        clientAdVertIn = new Client_AdVertIn__c();
   		accountId = ApexPages.currentPage().getParameters().get('accountId');
        Admin_AdvertIn__c[] userList = [SELECT Admin_Name__c FROM Admin_AdvertIn__c WHERE Id = 'a0S5j0000072brAEAQ' LIMIT 1];
        if (userList.size() > 0) {
            Admin_AdvertIn__c user = userList[0];
            username = user.Admin_Name__c;
        }
       
    }

    public pagereference logoutbtn() {
        pagereference goToHomePage = new pageReference('/apex/AdVentInHomePage');
        goToHomePage.getParameters().put('accountId',' ');
        return goToHomePage;
    }
        
    public PageReference registerClient() {
            
            System.debug('pw match');
            Client_AdVertIn__c newClient = new Client_AdVertIn__c();
            newClient.Client_Name__c = firstname;
            newClient.Email__c = email;
            newClient.Phone__c = phone;
            try{
                insert newClient;
                System.debug('inside try ');
                system.debug('accountId is: ' +accountId);
                System.debug('Name: ' + newClient.Client_Name__c);
                
                PageReference clientPage = new PageReference('/apex/showClientPage');
                return clientPage;
            }
            catch(exception e){
                system.debug('the error is: ' +e);
                return null;
            }
        
    }
    
    public pagereference showUser() {
        pagereference goToshowUser = new pageReference('/apex/AdminOrUserHomepage');
        return goToshowUser;
    }    
    
    public pagereference showClient() {
        pagereference goToshowClient = new pageReference('/apex/showClientPage');
        return goToshowClient;
    }    
    
    public pagereference insertAd() {
        pagereference goToinsertAd = new pageReference('/apex/insertAdPage');
        return goToinsertAd;
    }    
    
    public pagereference sendAdvertise() {
        pagereference goTosendAdvertise = new pageReference('/apex/sendAdvertisePage');
        return goTosendAdvertise;
    }    
    
    public pagereference redemption() {
        pagereference goToredemptionPage = new pageReference('/apex/redemptionPage');
        return goToredemptionPage;
    }    
    
    public pagereference redemptionRequest() {
        pagereference gotoredemptionRequestPage = new pageReference('/apex/redemptionRequestPage');
        return gotoredemptionRequestPage;
    }    
}