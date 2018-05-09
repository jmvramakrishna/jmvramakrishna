({
	 	getAccs: function(component){
       	 	var action = component.get("c.getAccounts");
        	action.setCallback(this, function(response){
            		if (response.getState() === "SUCCESS") {
               			component.set("v.Accounts", response.getReturnValue());
            		}
        	});
	 		$A.enqueueAction(action);   
    	}
})