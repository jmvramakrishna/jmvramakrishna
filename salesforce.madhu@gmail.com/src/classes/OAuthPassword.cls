public class OAuthPassword {
    public String clientId     {set;get;}
    public String clientSecret   {set;get;}
    public String username    {set;get;}
    public String password    {set;get;}
    public String  jsonString  {set;get;}
    public String accessToken  {set;get;}
    public List<String> names   {set;get;}
    public void getToken(){
        String url='https://login.salesforce.com/services/oauth2/token';
        String body='grant_type=password&';
        body=body+'client_id='+clientId;
        body=body+'&client_secret='+clientSecret;
        body=body+'&username='+username;
        body=body+'&password='+password;
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndPoint(url);
        request.setBody(body);
        request.setMethod('POST');
        HttpResponse response=p.send(request);
        jsonString=response.getBody();
        System.JSONParser jp=JSON.createParser(jsonString);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken=jp.getText();
            }
        }
    }
    public void getData(){
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndPoint('https://ap5.salesforce.com/services/data/v37.0/sobjects');
        request.setMethod('GET');
        request.setHeader('Authorization','OAuth '+accessToken);
        HttpResponse response=p.send(request);
        jsonString=response.getBody();
        names=new List<String>();
        System.JSONParser jp=JSON.createParser(jsonString);
        while(jp.nextToken()!=null){
            if(jp.getText()=='name'){
                jp.nextToken();
                names.add(jp.getText());
            }
        }
    }
}