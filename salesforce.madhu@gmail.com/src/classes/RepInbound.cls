@RestResource(urlMapping='/RepReq/*')
 Global class RepInbound {
    @HttpPost
    global static String getData(){
        string reqBody = RestContext.request.requestBody.toString();
        reqWrap reqw = (reqWrap)System.JSON.deserialize(reqBody, reqWrap.class);
//        reqWrap reqw = (reqWrap)System.JSON.deserialize('{"Type":"Male","Size":"S","Repository":200,"DressName":"Shirt150","Color":"Yellow"}', reqWrap.class);
		list<Dress__c> lstDr = [select id from Dress__c where name = :reqw.DressName];
        
        if(lstdr.size() > 0){
            for(Dress__c dr: lstDr){
        		Repository__c rep = new Repository__c();
    		    rep.Dress__c= dr.id;
		        rep.Quantity__c = rep.Quantity__c + reqw.Repository;
        		rep.Rep_Email__c=reqw.email;
    		    insert rep;
		    }
	    }
		return 'We received your goods.., Thanks';
    }
     
    global class reqWrap{
		public String Type {get;set;}
		public String Size {get;set;} 
		public Integer Repository {get;set;} 
		public String DressName {get;set;} 
		public String Email {get;set;} 
		public String Color {get;set;}     
    }
}