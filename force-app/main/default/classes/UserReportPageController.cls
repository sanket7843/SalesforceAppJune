public class UserReportPageController {
    public String username { get; set; }   
    public String points { get; set; }   
    public String accountId { get; set; }    
    
    public UserReportPageController(){
        accountId = ApexPages.currentPage().getParameters().get('accountId');
        //accountId = 'a0R5j000007ZQyUEAW';
        system.debug('acocuntId is from userHomePage: ' +accountId);
        User_AdVertIn__c userList = [SELECT First_Name__c,Last_Name__c, Address__c, Country__c,Total_Points_Balance__c, Date_Of_Birth__c, Email__c, Password__c, Phone__c FROM User_AdVertIn__c WHERE Id = :accountId LIMIT 1];
        username = userList.First_Name__c;
        points = userList.Total_Points_Balance__c;
        system.debug('username is: ' +username);
    }
    
        public pagereference logoutbtn() {
        pagereference goToEditPage = new pageReference('/apex/AdVentInHomePage');
        goToEditPage.getParameters().put('accountId',' ');
        return goToEditPage;
    }
    
        public pageReference goToAddsBtn(){
        pagereference goToAddsBtn = new pageReference('/apex/userAdsPage');
        goToAddsBtn.getParameters().put('accountId',accountId);
        return goToAddsBtn;
    }     
    
    public pageReference goToAccountPage(){
        pagereference goToAccountBtn = new pageReference('/apex/UserHomepage');
        goToAccountBtn.getParameters().put('accountId',accountId);
        return goToAccountBtn;
    }
    
    public pageReference goToReportPage(){
        pagereference goToReportBtn = new pageReference('/apex/userreportPage');
        goToReportBtn.getParameters().put('accountId',accountId);
        return goToReportBtn;
    }
}