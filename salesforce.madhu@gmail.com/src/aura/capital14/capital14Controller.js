({
	sub : function(component, event, helper) {
		component.set("v.firstName", component.find("fname").get('v.value') );
		component.set("v.lastName", component.find("lname").get('v.value') );
	}
})