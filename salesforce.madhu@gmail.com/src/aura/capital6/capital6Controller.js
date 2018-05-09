({
	show : function(component) {
		component.set('v.cval',   
                     parseInt(component.get('v.aval'))
                      +
                      parseInt(component.get("v.bval"))
                     );
	}
})