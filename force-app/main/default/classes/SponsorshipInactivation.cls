global class SponsorshipInactivation implements Database.Batchable<SObject> {

    // Query para encontrar patrocinios activos con más de un año desde su creación
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([
            SELECT Id, Active__c
            FROM Sponsorship__c 
            WHERE Active__c = true AND CreatedDate <= LAST_N_DAYS:365
        ]);
    }

    // Procesar registros en lotes
    global void execute(Database.BatchableContext bc, List<Sponsorship__c> sponsorships) {
        // Lista para actualizar patrocinios
        List<Sponsorship__c> updates = new List<Sponsorship__c>();

        for (Sponsorship__c sponsorship : sponsorships) {
            sponsorship.Active__c = false; // Marcar como inactivo
            updates.add(sponsorship);
        }

        // Actualizar los patrocinios inactivos
        if (!updates.isEmpty()) {
            update updates;
        }
    }

    // Finalizar el batch
    global void finish(Database.BatchableContext bc) {
        System.debug('Batch job completed successfully.');
    }
}