import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
 
export default class ClientSideNavigation extends NavigationMixin(LightningElement) {
    loadContactBtn() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'list'
            }
        });
    }
}