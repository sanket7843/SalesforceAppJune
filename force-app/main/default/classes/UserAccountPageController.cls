public class UserAccountPageController {
    public pagereference homepagebtn() {
        pagereference goToHomePage = new pageReference('/apex/UserHomepage');
        return goToHomePage;
    }
}