public class Lightning_Callout {
    static list<string> places{set;get;}
    static string result{set;get;}
    static string response;
    @auraEnabled public static string getAddress(string pincode){
       system.debug('Im here');
       system.debug('Pincode' + pincode);
       places=new List<String>();
       Http p=new Http();
       HttpRequest request=new HttpRequest();
       String endPoint='http://postalpincode.in/api/pincode/'+pincode;
       request.setEndPoint(endPoint);
       request.setMethod('GET');
       HttpResponse response=p.send(request);
       result=response.getBody();
       system.debug('Im at end');
       system.debug(result);
       return result;
    }
}