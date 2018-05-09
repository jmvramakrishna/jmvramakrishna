({
	gtpncd : function(component) {
		var action = component.get("c.getAddress");
        action.setParams({
            pincode : component.find("txt").get("v.value")
        });
        action.setCallback(this,function(response){
           	var state = response.getState();
             if (state === "SUCCESS") {
                component.set("v.address", response.getReturnValue());
            }
       	});
        $A.enqueueAction(action);
	}
})