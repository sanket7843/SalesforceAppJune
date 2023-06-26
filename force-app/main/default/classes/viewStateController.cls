public class viewStateController {
    
    public integer a{get;set;}
    private integer b{get;set;}
    transient integer c{get;set;}
    private integer d{get;set;}
    public opportunity opp{get;set;}
    
    public viewStateController(){
        a=5;
        b=10;
        c=15;
        opp = new Opportunity(name='newOpp');
    }
    
    public void changedata(){
        if (a == 5){
            a=50;
        }
        if (b == 10){
            b=100;
        }
        if (c == 15){
            c=150;
        }
        else{
            d=150;
        }
        
    }

}