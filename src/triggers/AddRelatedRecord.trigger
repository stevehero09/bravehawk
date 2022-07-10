trigger AddRelatedRecord on Account (after insert, after update) {
	List<Opportunity> oppList = new List<Opportunity>();
    
    //Get the related opportunities for accounts in this trigger
    Map<Id,Account> acctsAndOpps = new Map<Id,Account>(
        [SELECT Id, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.new]
    );
    
    for (Account a: Trigger.new){
                //System.debug('acctsAndOpps.get(a.Id).Opportunities.size()= ' + acctsAndOpps.get(a.Id).Opportunities.size());
        
                //Check if related Oppys exist
                /*        if (acctsAndOpps.get(a.Id).Opportunities.size()==0) {*/
        if (acctsAndOpps.get(a.Id).Opportunities.size()==0){
            oppList.add(
            	new Opportunity(Name=a.Name + ' Opportunity',
                               StageName='Prospecting',
                               CloseDate=System.today().addMonths(1),
                               AccountId=a.id));
            
        } //end if
        
                // system.debug('Num of Oppys is: ' + a.Opportunities.size() + 'Yo!');
                // system.debug('There are no oppys on this account: ' +a.name);
                //}   
                   
    
        if (oppList.size() > 0){
            insert oppList;
        } //end if
    } // end for
} //end trigger