public with sharing class BatchApexExample implements Database.Batchable<sObject> {
    
    //Codes for call Batch
    //BatchApexExample AB = New BatchApexExample();
    //Database.executeBatch(AB);
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id, NAME FROM Account');
        }

        public void execute(Database.BatchableContext BC, List<Account> accList){
          for(Account acc : accList) {        
            // Update the Account Name 
            acc.Name = acc.Name + ' ' + acc.Id;
              System.debug(acc);
        }
        try {
            // Update the Account Record
            update accList;
         
        } catch(Exception e) {
            System.debug(e);
        }
         }

         //end
         public void finish(Database.BatchableContext BC){
            System.debug('Batch Finished');
         
         }
}