public class SalesforceConnects {
 @AuraEnabled 
    public static String getCasesFromOutsideOrg(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://cunning-badger-q3jf3-dev-ed.my.salesforce.com/services/apexrest/cases');
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer !AQ4AQITc_FhDqbTcyiBX3xxc_SxjFBwyqBXPpuAvziN1pO196rP2Wn_zWaxhLa3XjVuR1S3joA4KZoM0hUa8w6.n2Y_SddcU');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            System.debug(response.getBody());
            return response.getBody();
        }
        return '';
    }
}