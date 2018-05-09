({
	callme : function(component) {
   		component.set('v.myName', component.find('name').get('v.value'));
	}
})