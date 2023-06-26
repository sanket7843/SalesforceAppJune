({
	onAction : function(component, event, helper) {
		var objCompB = component.find('compB');
        objCompB.sampleMethod("Hello Param1","Hello Param2","Hello Param3");
	}
})