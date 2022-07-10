trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert){
        Integer recordCount = Trigger.new.size();
        // call utility method from another class
        EmailManager.sendMail('stevem0911@gmail.com', 'Trailhead Trigger Tutorial Yo', 
                             recordCount + 'contact(s) were inserted');
    }
    else if (Trigger.isDelete){
     // do stuff after deletion   
    }
}