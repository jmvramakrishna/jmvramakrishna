public class SOAPInvoke {
@future(callout=true)
    public static void SOAPm1(){
        partnerSoapSforceCom.SOAP obj1=new partnerSoapSforceCom.SOAP();
        partnerSoapSforceCom.LoginResult lr=obj1.login('prashanthreddybobbili@gmail.com','9959979480cHXHPfqdY2SD64bXhkSZGYADzl');

system.debug(lr);

        gg1.g1 obj2 = new gg1.g1();

        obj2.sessionHeader = new gg1.sessionHeader_element();
        obj2.sessionHeader.sessionID = lr.sessionID;
        obj2.m1();
        
    }
}