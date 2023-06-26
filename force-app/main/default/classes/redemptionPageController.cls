public class redemptionPageController {
    
    public Ad__c clientAdVertIn { get; set; }
    public String userId{ get; set; }
    public String currentWorkingUserId{ get; set; }
    public String username { get; set; }   
    public String balancePoint { get; set; }    
    public date dob{ get; set; }   
    public String adName { get; set; }    
    public String AvailableClicks { get; set; }      
    public List<User_AdVertIn__c> userRecords { get; set; }
    public List<Ad__c> adRecords { get; set; }
    public User_AdVertIn__c redemData {get;set;}
    public boolean showData { get; set; }

    
    public String name { get; set; }   
    public DATETIME registration { get; set; } 
    public DATE redemptionDate { get; set; }   
    public Integer points { get; set; }
    public Integer redemptionPoints { get; set; }
    
    public redemptionPageController() {
        showData = false; 

        //initlize the data for User
        userRecords = [SELECT Id, Name, First_Name__c,Date_Of_Birth__c, Total_Points_Balance__c,selected__c, Selected_Send_User_new__c FROM User_AdVertIn__c];
        
        //initlize the data for Ads
        adRecords = [SELECT Id, Name, Ad_Name__c, No_Of_Clicks__c,Selected_Send_Ad_new__c FROM Ad__c];
        
        //get the admin name
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
    
    public void getUserData() {
        List<User_AdVertIn__c> redemDataList = [SELECT Id, First_Name__c, Date_Of_Birth__c, Points_Last_Reimburse_Date__c, Total_Points_Balance__c, CreatedDate FROM User_AdVertIn__c WHERE First_Name__c = :username AND Date_Of_Birth__c = :dob LIMIT 1];
                showData = true; 

        if (!redemDataList.isEmpty()) {
            User_AdVertIn__c redemData = redemDataList[0];
            currentWorkingUserId = redemData.Id;
            name = redemData.First_Name__c;
            registration = redemData.CreatedDate;
            points = Integer.valueOf(redemData.Total_Points_Balance__c);
            redemptionDate = redemData.Points_Last_Reimburse_Date__c;
            system.debug('currentWorkingUserId: '+currentWorkingUserId);
            system.debug('redemptionPoints: '+redemptionPoints);
            system.debug('Total_Points_Balance__c: '+redemData.Total_Points_Balance__c);
            
        } else {
            system.debug('no matching record is found');
        }
    }
    
    /*public void getredeemPoints() {
// Get the redemption data
List<User_AdVertIn__c> redemDataList = [SELECT Id, First_Name__c, Points_Last_Reimburse_Date__c, Total_Points_Balance__c, CreatedDate FROM User_AdVertIn__c WHERE First_Name__c = :username AND Date_Of_Birth__c = :dob LIMIT 1];

if (!redemDataList.isEmpty()) {
User_AdVertIn__c redemData = redemDataList[0];

if (redemptionPoints != null && redemptionPoints <= Integer.valueOf(redemDataList[0].Total_Points_Balance__c)) {
redemDataList[0].Total_Points_Balance__c = String.valueOf(Integer.valueOf(redemDataList[0].Total_Points_Balance__c) - redemptionPoints);
//            performRedemption(redemData); // Call the separate method for DML operation
} else {
System.debug('redemptionPoints is null or exceeds Total_Points_Balance__c');
}
} else {
System.debug('No matching record is found');
}
}*/
    public void redeemPoints() {
    if (redemptionPoints != null) {
        getRedeemData();

        if (redemData != null) {
            Integer currentBalance = Integer.valueOf(redemData.Total_Points_Balance__c);
            Integer updatedBalance = currentBalance - redemptionPoints;
            redemData.Total_Points_Balance__c = String.valueOf(updatedBalance);

            try {
                update redemData;
                        showData = false; 

                System.debug('Total_Points_Balance__c updated: ' + redemData.Total_Points_Balance__c);
            } catch (Exception e) {
                System.debug('Error while updating Total_Points_Balance__c: ' + e);
            }
        } else {
            System.debug('No matching record is found');
        }
    } else {
        System.debug('redemptionPoints is null');
    }
}

private void getRedeemData() {
    List<User_AdVertIn__c> redemDataList = [SELECT Id, First_Name__c, Date_Of_Birth__c, Points_Last_Reimburse_Date__c, Total_Points_Balance__c, CreatedDate FROM User_AdVertIn__c WHERE First_Name__c = :username AND Date_Of_Birth__c = :dob LIMIT 1];

    if (!redemDataList.isEmpty()) {
        redemData = redemDataList[0];
        currentWorkingUserId = redemData.Id;
    }
}

    
  /*public void getredeemPoints() {
    List<User_AdVertIn__c> redemDataList = [SELECT Id, First_Name__c, Date_Of_Birth__c, Points_Last_Reimburse_Date__c, Total_Points_Balance__c, CreatedDate FROM User_AdVertIn__c WHERE First_Name__c = :username AND Date_Of_Birth__c = :dob LIMIT 1];

    if (!redemDataList.isEmpty()) {
        User_AdVertIn__c redemData = redemDataList[0];
        currentWorkingUserId = redemData.Id;

        User_AdVertIn__c newUser = new User_AdVertIn__c();
        newUser.Id = currentWorkingUserId;
        newUser.Total_Points_Balance__c = String.valueOf(Integer.valueOf(redemData.Total_Points_Balance__c) - Integer.valueOf(redemptionPoints));

        //performRedemption(newUser);
    } else {
        System.debug('No matching record is found');
    }
}*/
/*
public void performRedemption(User_AdVertIn__c redemData) {
    try {
        database.update(redemData);
        system.debug('Updated Total_Points_Balance__c is: ' + redemData.Total_Points_Balance__c);
    } catch (Exception e) {
        system.debug('Error while updating: ' + e);
    }
}
    
    public void performRedemption(User_AdVertIn__c redemData) {
redemData.Total_Points_Balance__c = String.valueOf(Integer.valueOf(redemData.Total_Points_Balance__c) - redemptionPoints);
update redemData;
System.debug('redemData updated');
redemptionPoints = null;
}*/
}