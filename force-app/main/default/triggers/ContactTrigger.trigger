/**
 * @author Harold Garcia
 * @email garciavargas9112@gmail.com
 * @create date 2024-09-21 20:54:55
 * @modify date 2024-09-21 20:54:55
 * @desc [Trigger que invoca al manejador ContactTriggerHandler para ejecutar la lógica necesaria dependiendo del contexto del trigger.]
 */

trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    ContactTriggerHandler handler = new ContactTriggerHandler('ContactTriggerHandler');
    handler.run();
}