Global class Repository_Request {

    @InvocableMethod Global static void Rep_Request(list<Id> lstDrId) {
        Repository_Request.futuremethod(lstDrId);
    }

    @future(callout=true) global static void futuremethod(list<Id> lstDrId){
        string body='';
        Blob blobbody;
        list<Dress__c> lstDr = [select Name, Color__c, Size__c, Type__c, Repository__c from Dress__c where Id in :lstDrId];
        if(lstDr.size() > 0) {
system.debug('size is greater than 0');
            for(Dress__c dr: lstDr){
            	Rep_Request_Wrapper rrw = new Rep_Request_Wrapper();
            	rrw.DressName = dr.Name;
            	rrw.Color = dr.Color__c;
            	rrw.Size = dr.Size__c;
            	rrw.Type = dr.Type__c;
            	rrw.Repository = 200;
                body = JSON.serialize(rrw);
            	
				string accessToken = Repository_Request.getAccessToken();
                http p = new http();
	        	httpRequest req = new httpRequest();
    	    	req.setEndPoint('https://ap5.salesforce.com/services/apexrest/RepReq/');
                req.setHeader('Authorization','OAuth '+accessToken);
            	req.setMethod('POST');
                req.setHeader('Content-type','Application/json');
                //blobbody = Blob.valueOf(body);
        	    //req.setBodyAsBlob(blobbody);
        	    req.setBody(body);
                httpResponse res = p.send(req);
system.debug('Request Body : ' + body);
system.debug('Response Body : ' + res.getBody());
system.debug('Status : ' + res.getStatus());
system.debug('Status Code : ' + res.getStatusCode());
	        }
        }
    }
    
    public class Rep_Request_Wrapper {
        public String DressName {get;set;} 
        public String Color {get;set;} 
        public String Size {get;set;} 
        public String Type {get;set;}
        public Decimal Repository {get;set;} 
    }
    
    public static string getAccessToken(){
system.debug('inside accessToken');
        HttpResponse response;
        string jsonString;
        string accessToken, clientId, clientSecret, username, password;
        Integration_Details__c idt = Integration_Details__c.getValues('Prashanth');
        if(idt != null){
        
	        String body='grant_type=password&';
	        body=body+'client_id='+idt.Client_Id__c;
	        body=body+'&client_secret='+idt.Client_Secret__c;
	        body=body+'&username='+idt.UserName__c;
	        body=body+'&password='+idt.Password__c;
	        Http p=new Http();
	        HttpRequest request=new HttpRequest();
  		    request.setEndPoint(idt.Endpoint_URL__c);
   	        request.setBody(body);
        	request.setMethod('POST');
        	response=p.send(request);
        	jsonString=response.getBody();
        	System.JSONParser jp=JSON.createParser(jsonString);
        	while(jp.nextToken()!=null){
            	if(jp.getText()=='access_token'){
                	jp.nextToken();
                	accessToken=jp.getText();
    	       	}
	        }
        }
system.debug(jsonString);
system.debug(response.getStatusCode());
system.debug(accessToken);
        return accessToken;
    }
}