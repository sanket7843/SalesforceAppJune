public class sendAdvertisePageController {
    
    public Ad__c clientAdVertIn { get; set; }
    public String userId{ get; set; }
    public String username { get; set; }   
    public String balancePoint { get; set; }    
    public String adId{ get; set; }   
    public String adName { get; set; }    
    public String AvailableClicks { get; set; }      
    public List<User_AdVertIn__c> userRecords { get; set; }
    public List<Ad__c> adRecords { get; set; }
    
    public sendAdvertisePageController() {
        //initlize the data for User
        userRecords = [SELECT Id, Name, First_Name__c, Total_Points_Balance__c,selected__c, Selected_Send_User_new__c FROM User_AdVertIn__c];
        
        //initlize the data for Ads
        adRecords = [SELECT Id, Name, Ad_Name__c, No_Of_Clicks__c,Selected_Send_Ad_new__c FROM Ad__c];
        
        //get the admin name
        Admin_AdvertIn__c[] userList = [SELECT Admin_Name__c FROM Admin_AdvertIn__c WHERE Id = 'a0S5j0000072brAEAQ' LIMIT 1];
        if (userList.size() > 0) {
            Admin_AdvertIn__c user = userList[0];
            username = user.Admin_Name__c;
        }
    }
    
    public void sendAd() {
        
        //list of all the selected ads
        List<Ad__c> adsToAllot = new List<Ad__c>();
        
        //list of all the users selected
        List<User_AdVertIn__c> contactsToAlotAds = new List<User_AdVertIn__c>();
        
        // Collect the ads records to alot
        for (Ad__c adRecord : adRecords) {
            if (adRecord.Selected_Send_Ad_new__c) {
                adsToAllot.add(adRecord);
            }
        }
          // Collect the contacts to allot the ads
        for (User_AdVertIn__c userRecord : userRecords) {
            if (userRecord.Selected_Send_User_new__c) {
                contactsToAlotAds.add(userRecord);
            }
        }
        
        
        
        // Delete the selected records
        //     if (recordsToDelete.size() > 0) {
        //          delete recordsToDelete;
        //     }
        
        // Refresh the list of user records
        //     clientRecords = [select Name, Client_Name__c, Phone__c, Email__c, Checked__c from Client_AdVertIn__c];
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