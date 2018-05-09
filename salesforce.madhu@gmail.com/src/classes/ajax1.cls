public class ajax1 {
    public list<string> listSt{set; get;}
    public list<string> listCt{set; get;}
    public String state { get; set; }
    public String city { get; set; }
    public String stSrch { get; set; }
    public String ctSrch { get; set; }
    public map<string,list<string>> mpStCt = new map<string,list<string>>();
    public list<selectoption> stSo{get; set;}
    public list<selectoption> ctSo{get; set;}
    public string Result{get;set;}
    public string selectedState{get;set;}
    public string selectedCity{get;set;}
    
    public ajax1(){
        string temp = '';
        list<string> cities;
        list<Territory__c> lstTr = [select State__c, City__c from Territory__c order by State__c];
        if(lstTr.size() > 0){
          for(Territory__c tr:lstTr){
              if(temp != tr.State__c){
	              if(temp!= '') mpStCt.put(temp, cities);
	              cities = new list<string>();
                  cities.add(tr.City__c);
                  temp=tr.State__c;
              }
              else {
                  cities.add(tr.City__c);
              }
          }
          mpStCt.put(temp,cities);
        }
        
        stSo = new list<Selectoption>();
        stSo.add(new SelectOption('--None--','--None--'));

        ctSo = new list<Selectoption>();
        ctSo.add(new SelectOption('--None--','--None--'));
        
        selectedState = '--None--';
    }

    public void action1(){
        stSo = new list<Selectoption>();
        stSo.add(new SelectOption('--None--','--None--'));

        for(string str : mpStCt.keySet()){
            if(str.startsWithIgnoreCase(stSrch)) stSo.add(new selectOption(str,str));
        }
    }

    public void action2(){
        ctSo = new list<Selectoption>();
        ctSo.add(new SelectOption('--None--','--None--'));

        if(selectedState != '--None--')
        for(string str : mpStCt.get(selectedState)){
            if(str.startsWithIgnoreCase(ctSrch)) ctSo.add(new selectOption(str,str));
        }
        
        if(selectedState == '--None--') Result = 'Please select State';
        else if(selectedCity == '--None--') Result = 'Please select City';
        else Result = 'You have selected State: ' + selectedState + ' and City: ' + selectedCity;
    }
}