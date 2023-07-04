import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class FileUploadLWC extends LightningElement {
    @api recordId;
    acceptedFormats() {
        return ['.pdf', '.png', '.jpg', 'jpeg'];
    }
    handleUploadFinish(event) {
        const uploadFiles = event.detail.files;
        let uploadFileNames = '';
        for (let i = 0; i < uploadFiles.length; i++){
            uploadFileNames += uploadFiles[i].name+', ';
        }
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: uploadFiles.length + 'was uploaded successfully',
                variant: 'success',
            })
        );
    }
}