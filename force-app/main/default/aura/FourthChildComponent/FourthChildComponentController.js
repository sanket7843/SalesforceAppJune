({
	doAction : function(component, event, helper) {
		var params = event.getParam('arguments');
        if(params){
            var param1 = params.param1;
            var param2 = params.param2;
            var param3 = params.param3;
            
            console.log('param1: ' + param1);
            console.log('param2: ' + param2);
            console.log('param3: ' + param3);
 
            alert(param1);
            alert(param2);
            alert(param3);
        
            var insight = component.get("v.passingParam");
            alert("insight is: " + insight);
            } 
            else {
                console.log('Error occurred: No params received.');
            }
		}
})