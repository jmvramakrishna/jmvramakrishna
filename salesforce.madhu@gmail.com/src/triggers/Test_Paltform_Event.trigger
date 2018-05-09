trigger Test_Paltform_Event on Test_Platform_Event__e (after insert) {
    list<case> css = new list<case>();
    for(Test_Platform_Event__e tpe: trigger.new){
        case cs = new case();
        cs.Description = tpe.field1__c;
        css.add(cs);
    }
    insert css;
}