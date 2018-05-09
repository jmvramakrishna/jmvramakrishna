({
	show : function(component) {
		var action=component.get("c.getName");
        action.setCallback(this, function(response){
        	var state = response.getState();
             if (state === "SUCCESS") {
           	 component.set("v.empName", response.getReturnValue());
             }
        });
        $A.enqueueAction(action);
    }
})