public class AdminOrUserHomepageController {
    
    public User_AdVertIn__c userAdVertIn { get; set; }
    public String ll {get;set;}
    public String accountId{ get; set; }    
    public String userRole{ get;set; }
    public String username { get; set; }    
    public String lastname { get; set; }    
    public String address { get; set; }    
    public String isAdmin { get; set; }    
    public String country { get; set; }    
    public String secretQuestion { get; set; }    
    public String secretAnswer { get; set; }    
    public Date dob { get; set; }    
    public String email { get; set; }    
    public String password { get; set; }   
    public String confirmPassword { get; set; }    
    public String phone { get; set; }      
    public List<User_AdVertIn__c> userRecords { get; set; }

    
    public AdminOrUserHomepageController() {
        userAdVertIn = new User_AdVertIn__c();
       accountId = ApexPages.currentPage().getParameters().get('accountId');
        //set Defined Values
        userRecords = [select Name, First_Name__c, Phone__c, Email__c, selected__c, Total_Points_Balance__c from User_AdVertIn__c];
        Admin_AdvertIn__c[] userList = [SELECT Admin_Name__c FROM Admin_AdvertIn__c WHERE Id = 'a0S5j0000072brAEAQ' LIMIT 1];
        if (userList.size() > 0) {
            Admin_AdvertIn__c user = userList[0];
            username = user.Admin_Name__c;
        }
        //accountId = 'a0R5j000007ZQyUEAW';
        system.debug('isAdmin status is: ' +isAdmin);
    }
    
    public void deleteSelected() {
        List<User_AdVertIn__c> recordsToDelete = new List<User_AdVertIn__c>();
        
        // Collect the selected records to delete
        for (User_AdVertIn__c record : userRecords) {
            if (record.selected__c) {
                recordsToDelete.add(record);
            }
        }
        
        // Delete the selected records
        if (recordsToDelete.size() > 0) {
            delete recordsToDelete;
        }
        
        // Refresh the list of user records
        userRecords = [SELECT Id, Name, First_Name__c, Phone__c, Email__c, selected__c, Total_Points_Balance__c FROM User_AdVertIn__c];
    }
        
    public pagereference logoutbtn() {
        pagereference goToHomePage = new pageReference('/apex/AdVentInHomePage');
        goToHomePage.getParameters().put('accountId',' ');
        return goToHomePage;
    }
    
    public pagereference addUser() {
        pagereference gotoAddUserPage = new pageReference('/apex/addUserPage');
        return gotoAddUserPage;
    }

    
    public pagereference showClient() {
        pagereference goToshowClient = new pageReference('/apex/showClientPage');
        goToshowClient.getParameters().put('accountId',accountId);
        return goToshowClient;
    }    
    
    public pagereference insertAd() {
        pagereference goToinsertAd = new pageReference('/apex/insertAdPage');
        goToinsertAd.getParameters().put('accountId',accountId);
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