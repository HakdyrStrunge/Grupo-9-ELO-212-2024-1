Desarrollo de la actividad
Horas totales de trabajo: 8 horas
| Día	| Inicio| Hora | Término	| Actividades
| 2024-06-01	| 09:00	| 10:30	| Revisión del enunciado y análisis de requisitos
| 2024-06-01	| 11:00	| 12:00	| Diseño de la máquina de estados para la ALU
| 2024-06-01	| 13:00	| 14:00	| Implementación del módulo S9actividad1
| 2024-06-02	| 10:00	| 11:30	| Codificación de la lógica para los estados y las transiciones
| 2024-06-02	| 12:00	| 13:00	| Integración con la ALU existente y pruebas preliminares
| 2024-06-03	| 14:00	| 15:00	| Conexión de señales físicas y configuración de entradas/salidas
| 2024-06-03	| 15:00	| 16:00	| Pruebas de funcionamiento con la tarjeta Nexys4DDR/NexysA7
| 2024-06-03	| 16:00	| 17:00	| Documentación del diseño y ajustes finales
Comentarios
Se extendió la funcionalidad de la ALU con entradas registradas, agregando una máquina de estados que genera las señales de carga para cada banco de registros en base a una secuencia de pasos definidos. Se utilizó la tarjeta Nexys4DDR/NexysA7, configurando los switches para setear el bus de datos de entrada (DataIn) de 16 bits y un botón Enter para indicar el registro de los datos.

Se reutilizó la ALU evaluada como PASS en la última sesión evaluada. La señal ToDisplay alterna entre DataIn y el resultado de la ALU dependiendo del valor de ToDisplaySel. Se asumió el uso de pulsadores ideales, omitiendo los efectos de rebotes y ruidos electromecánicos.
