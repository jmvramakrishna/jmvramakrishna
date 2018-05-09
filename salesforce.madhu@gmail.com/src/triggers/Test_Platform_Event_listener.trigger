trigger Test_Platform_Event_listener on Dress__c (after insert) {
    list<Test_Platform_Event__e> lstTpe = new list<Test_Platform_Event__e>();
    for(Dress__c dr: trigger.new){
        if(dr.Price__c > 1000){
            Test_Platform_Event__e tpe = new Test_Platform_Event__e();
            tpe.field1__c = 'A new Dress recieved with Name: '+dr.Name+ ' Price: '+dr.Price__c;
            tpe.field2__c = true;
            tpe.field3__c = dr.Price__c;
            lstTpe.add(tpe);
        }
    }
    eventbus.publish(lstTpe);
}