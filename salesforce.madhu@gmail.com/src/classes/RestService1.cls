@RestResource(urlMapping='/RK1/*')
global class RestService1 {
  @HttpGet
    global static String getData(){
        String accName=RestContext.request.params.get('name');
        List<Account> accs=[select  name ,industry from Account where name=:accName];
        System.JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
        js.writeStringField('Status','Success');
        js.writeNumberField('Count',accs.size());
        js.writeFieldName('Accounts');
        js.writeStartArray();
        for(Account a: accs){
            js.writeStartObject();
            js.writeStringField('name',a.name);
            if(a.industry!=null)
            js.writeStringField('industry',a.industry);
            js.writeEndObject();
        }
        js.writeEndArray();
        js.writeEndObject();
        String result=js.getAsString();
        return result;
    }
    @HttpPost
    global static String create(String name ,String  phone){
        Account acc=new Account();
        acc.Name=name;
        acc.Phone=phone;
        System.JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
            try{
                insert acc;
                js.writeStringField('status','success');
                js.writeStringField('Code','200');
                js.writeIdField('AccountId',acc.id);
            }catch(Exception e){
                 js.writeStringField('status','Error');
                js.writeStringField('Code','300');
                js.writeStringField('Error Message',e.getMessage());
            }
            js.writeEndObject();
        String result=js.getAsString(); 
        return result;
    }
}