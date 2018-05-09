Global class Schedule_Class implements schedulable {
    global void execute(System.schedulableContext sc){
        BatchClass_Repository bcr = new BatchClass_Repository();
		Id jobId= Database.executeBatch(bcr,200);
		system.debug(jobId);
    }
}