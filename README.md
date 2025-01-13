# Gestión de Patrocinios en F1 con Salesforce

## Descripción del Proyecto
Este proyecto tiene como objetivo desarrollar una solución en Salesforce para gestionar de manera eficiente los patrocinios de pilotos en la Fórmula 1. Incluye la creación de un modelo de datos, automatización de procesos, reglas empresariales, y la implementación de componentes personalizados para proporcionar una experiencia integral y escalable.

---

## Características Principales

### **1. Modelo de Datos**
- **Contactos (Pilotos):** Datos clave como nombre, edad calculada dinámicamente, equipo, nacionalidad y estado activo/inactivo.
- **Cuentas (Patrocinadores):** Gestión de fondos totales y disponibles, sector y actividad.
- **Oportunidades:** Proceso estructurado desde la prospección hasta el cierre.
- **Patrocinios:** Relación entre piloto, patrocinador y oportunidad, con control de valores y vigencia.

### **2. Automatización y Validaciones**
- Cálculo automático de edad y fondos disponibles.
- Reglas empresariales que aseguran la integridad del sistema, como la validación de pilotos activos para recibir patrocinios.
- Trabajo programado en Apex para inactivación automática de patrocinios con más de un año de antigüedad.

### **3. Componentes Personalizados**
- **Lightning Web Component (LWC):** Lista de pilotos activos con su patrocinador principal, integrado en la página de inicio.
- **Flujos de Pantallas:** Para la división de patrocinios entre pilotos del mismo equipo.

### **4. Informes y Dashboards**
- Informes detallados para analizar métricas clave.
- Dashboards interactivos que muestran:
  - Distribución de fondos por patrocinador.
  - Desempeño de pilotos.
  - Estado de las oportunidades.
