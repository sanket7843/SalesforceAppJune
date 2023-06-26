({
    fetchContacts: function(component, event, helper) {
        var action = component.get("c.getContactList");
        
        //action.setParams({
            // Any parameters you need to pass to the server-side action can be specified here
        //});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === 'SUCCESS') {
                var contactList = response.getReturnValue();
                console.log(contactList);
                component.set('v.contactList', contactList);
            } else {
                alert('Did not get the response.');
            }
        });
        $A.enqueueAction(action);
    }
})