trigger HelloWorldTrigger on Account (before insert) {
	for (Account a: trigger.New)
    system.debug('Hello world');
    
}