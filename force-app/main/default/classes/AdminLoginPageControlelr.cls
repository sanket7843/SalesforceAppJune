public class AdminLoginPageControlelr {
    
    public User_AdVertIn__c userAdVertIn { get; set; }
    public String ll {get;set;}
    public String accountId{ get; set; }    
    public String userRole{ get;set; }
    public String username { get; set; }    
    public String isAdmin { get; set; }    
    public String lastname { get; set; }    
    public String address { get; set; }    
    public String country { get; set; }    
    public String secretQuestion { get; set; }    
    public String secretAnswer { get; set; }    
    public Date dob { get; set; }    
    public String email { get; set; }    
    public String password { get; set; }   
    public String confirmPassword { get; set; }    
    public String phone { get; set; }      
    
    public AdminLoginPageControlelr() {
        userAdVertIn = new User_AdVertIn__c();
        ll = 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.';
    }
    
    public PageReference loginUser(){
        List<Admin_AdvertIn__c	> adminList = [SELECT Id, Admin_Name__c FROM Admin_AdvertIn__c WHERE Admin_Name__c =:username LIMIT 1];
        
        //check if it admin
        if (!adminList.isEmpty()) {
            Admin_AdvertIn__c user = adminList[0];
            if(user.Admin_Name__c.equals('admin') ){
                isAdmin = 'true';
            }
            else{
                isAdmin = 'false';
            }
            
        }
        
        if (!adminList.isEmpty()) {
            Admin_AdvertIn__c user = adminList[0];
            if(user.Admin_Name__c.equals(username) ){
                accountId = user.Id;
                system.debug('username and password is right');
                PageReference homepage = new PageReference('/apex/AdminOrUserHomepage');
                homepage.getParameters().put('accountId', accountId);
                return homepage;
            }
            else{
                system.debug('username and password doesnt match');
                return null;
            }
        } else {
            String errorMessage = 'Username and password do not match.';
            String alertScript = 'showAlert(\'' + errorMessage + '\');';
            ApexPages.currentPage().getParameters().put('alertScript', alertScript);
            return null;
            //system.debug('No record found');
        }
    } 
}