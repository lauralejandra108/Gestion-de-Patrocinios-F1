import { LightningElement, wire } from 'lwc';
import getTopSponsors from '@salesforce/apex/PilotController.getTopSponsors';

const COLUMNS = [
    { label: 'Nombre', fieldName: 'name' },
    { label: 'Equipo', fieldName: 'team' },
    { label: 'Patrocinador Principal', fieldName: 'sponsorName' } // Nombre del patrocinador
];

export default class ActiveContacts extends LightningElement {
    contacts;
    error;
    columns = COLUMNS;

    @wire(getTopSponsors)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data.map((contact, index) => ({
                id: index + 1, // Generar un ID único para la tabla
                name: contact.name,
                team: contact.team,
                sponsorName: contact.sponsorName // Incluir el patrocinador
            }));
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }
}
