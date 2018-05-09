public class SOAP_Prashanth_Invoke {
@future(callout=true)
    public static void Soap_Prashanth(string Delivery){
        partnerSoapSforceCom.SOAP obj1=new partnerSoapSforceCom.SOAP();
        partnerSoapSforceCom.LoginResult lr=obj1.login('prashanthreddybobbili@gmail.com','9959979480cHXHPfqdY2SD64bXhkSZGYADzl');

        soap_Prashanth.soap_Provider s1 = new soap_Prashanth.soap_Provider();

        s1.sessionHeader = new soap_Prashanth.sessionHeader_element();
        s1.sessionHeader.sessionID = lr.sessionID;
        string str = s1.deliveries(Delivery);
        
        if(str != 'No records found'){
            SOAP_Prashanth_Invoke.Method_insert(str);
        } else system.debug(str);
    }
    
    public static void Method_insert(string str){
        Wrapper_Delivery wrDl = (Wrapper_Delivery) System.JSON.deserialize(str, Wrapper_Delivery.class);
        system.debug(str);
        system.debug(wrDl);
        list<Repository__c> lstRep = new list<Repository__c>();
        
        list<string> lstStr = new list<string>();
        for(Delivery dl:wrDl.lstDl){
            lststr.add(dl.item);
            system.debug(dl.item);
        }
        list<Dress__c> lstDr = new list<Dress__c>();
        if(lststr.size() > 0) lstDr = [select id, Name from dress__c where Name in :lststr];
        
	    map<String,Dress__c> mapDr = new map<string,Dress__c>();
        if(lstDr.size() > 0){
            for (Dress__c dr:lstDr){
                mapDr.put(dr.Name,dr);
            }
            system.debug(mapDr);
        }
        
        for(Delivery dl:wrDl.lstDl){
            system.debug(dl);
            Repository__c rep = new Repository__c();
            rep.Quantity__c = dl.Quantity;
            rep.Rep_Email__c = 'prashanthreddybobbili@gmail.com';
            
            if(mapDr.get(dl.item) != null) {
                rep.Dress__c = mapDr.get(dl.item).id;
            	lstRep.add(rep);
            }else {
                system.debug('Dress not found with name: ' + dl.item);
            }
        }
        if(lstRep.size() > 0){
            list<database.SaveResult> lstDsr = database.insert(lstRep,false);
            for(database.SaveResult dsr:lstDsr){
                system.debug(dsr);
		        system.debug('Records Inserted');
            }
        }
    }
    
  public class Wrapper_Delivery{
      public list<Delivery> lstDl;
  }
    
  public class Delivery {
    public String Name;
    public String Color;
    public String item;
    public Decimal Quantity;
    public Decimal Repository;
    public String Size;
    public String Type;
    public String Id;
  }
}