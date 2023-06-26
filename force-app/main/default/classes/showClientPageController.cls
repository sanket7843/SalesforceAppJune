public class showClientPageController {

    public Client_AdVertIn__c clientAdVertIn { get; set; }
    public String accountId{ get; set; }
    public String username { get; set; }   
    public String email { get; set; }    
    public String password { get; set; }   
    public String confirmPassword { get; set; }    
    public String phone { get; set; }      
    public List<Client_AdVertIn__c> clientRecords { get; set; }

    
    public showClientPageController() {
        clientAdVertIn = new Client_AdVertIn__c();
        //set Defined Values
        clientRecords = [select Name, Client_Name__c, Phone__c, Email__c, Checked__c from Client_AdVertIn__c];
        Admin_AdvertIn__c[] userList = [SELECT Admin_Name__c FROM Admin_AdvertIn__c WHERE Id = 'a0S5j0000072brAEAQ' LIMIT 1];
        if (userList.size() > 0) {
            Admin_AdvertIn__c user = userList[0];
            username = user.Admin_Name__c;
        }
    }
    
    public void deleteSelected() {
        List<Client_AdVertIn__c> recordsToDelete = new List<Client_AdVertIn__c>();

        // Collect the selected records to delete
        for (Client_AdVertIn__c record : clientRecords) {
            if (record.Checked__c) {
                recordsToDelete.add(record);
            }
        }
        
        // Delete the selected records
        if (recordsToDelete.size() > 0) {
            delete recordsToDelete;
        }
        
        // Refresh the list of user records
        clientRecords = [select Name, Client_Name__c, Phone__c, Email__c, Checked__c from Client_AdVertIn__c];
    }
        
    public pagereference logoutbtn() {
        pagereference goToHomePage = new pageReference('/apex/AdVentInHomePage');
        goToHomePage.getParameters().put('accountId',' ');
        return goToHomePage;
    }
    
    public pagereference addClient() {
        pagereference gotoAddClientPage = new pageReference('/apex/addClientPage');
        return gotoAddClientPage;
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
        goTosendAdvertise.getParameters().put('accountId',accountId);
        return goTosendAdvertise;
    }    
    
    public pagereference redemption() {
        pagereference goToredemptionPage = new pageReference('/apex/redemptionPage');
        goToredemptionPage.getParameters().put('accountId',accountId);
        return goToredemptionPage;
    }    
    
    public pagereference redemptionRequest() {
        pagereference gotoredemptionRequestPage = new pageReference('/apex/redemptionRequestPage');
        gotoredemptionRequestPage.getParameters().put('accountId',accountId);
        return gotoredemptionRequestPage;
    }    
 
}