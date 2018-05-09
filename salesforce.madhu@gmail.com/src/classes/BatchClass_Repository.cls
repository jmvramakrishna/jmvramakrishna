global class BatchClass_Repository implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id, Quantity__c, Dress__r.Name, Rep_Email__c, createdDate FROM Repository__c where Quantity__c >= 100 and createdDate = TODAY';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Repository__c> scope)
    {
        user usr = [select id from user where name like '%Madhu%' limit 1];
        list<Task> lstTsk = new List<Task>();
        for (Repository__c rep: scope){
            if(usr != null){
                Task t = new Task();
                t.WhatId = rep.ID; // this is the object Id, Aproval process
                t.WhoId = usr.id; // the userid of the person receiving the Task
                lstTsk.add(t);
            }
        }
        insert lstTsk;
    }  
    global void finish(Database.BatchableContext BC)
    {
    }
}