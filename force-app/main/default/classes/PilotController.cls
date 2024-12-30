public class PilotController {
    public class PilotInfo {
        @AuraEnabled
        public String name; // Nombre del piloto
        @AuraEnabled
        public String team; // Equipo del piloto
        @AuraEnabled
        public String sponsorName; // Nombre del patrocinador principal

        // Constructor de la clase PilotInfo
        public PilotInfo(String name, String team, String sponsorName) {
            this.name = name;
            this.team = team;
            this.sponsorName = sponsorName;
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<PilotInfo> getTopSponsors() {
        // Consulta SOQL para obtener los patrocinadores activos, sus pilotos y valores
        List<Sponsorship__c> sponsorships = [
            SELECT Driver__r.Name, Driver__r.Team__c, Sponsor__r.Name, Value__c
            FROM Sponsorship__c
            WHERE Active__c = true AND Driver__c != null
        ];

        // Mapa para almacenar el mejor patrocinador por piloto, usando el nombre del piloto como clave
        Map<String, PilotInfo> topSponsorsMap = new Map<String, PilotInfo>();

        for (Sponsorship__c sponsorship : sponsorships) {
            String pilotName = sponsorship.Driver__r.Name;  // Nombre del piloto
            Decimal value = sponsorship.Value__c; // Valor del patrocinio (Value__c)

            // Si el piloto no está en el mapa o si no tiene patrocinador
            if (!topSponsorsMap.containsKey(pilotName)) {
                // Solo se actualiza si el patrocinador no ha sido asignado previamente
                topSponsorsMap.put(pilotName, new PilotInfo(
                    pilotName,   // Nombre del piloto
                    sponsorship.Driver__r.Team__c, // Nombre del equipo del piloto
                    sponsorship.Sponsor__r.Name // Nombre del patrocinador (Account)
                ));
            }
        }

        return topSponsorsMap.values();
    }
}