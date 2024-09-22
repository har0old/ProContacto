/**
 * @author Harold Garcia
 * @email garciavargas9112@gmail.com
 * @create date 2024-09-21 20:56:18
 * @modify date 2024-09-21 20:56:18
 * @desc [Clase que maneja la lógica de actualización en batch para los correos electrónicos de contactos. Implementa la interfaz Database.Batchable.]
 */

public with sharing class ContactEmailUpdateBatch implements Database.Batchable<SObject>, Database.AllowsCallouts {
    private List<Contact> contactsToUpdate;

    public ContactEmailUpdateBatch(List<Contact> contacts) {
        this.contactsToUpdate = contacts;
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id, idprocontacto__c FROM Contact WHERE Id IN :contactsToUpdate]);
    }

    public void execute(Database.BatchableContext BC, List<Contact> scope) {
        List<Contact> updatedContacts = ProContactoEmailService.updateContactEmails(scope);
        
        if (!updatedContacts.isEmpty()) {
            update updatedContacts;
        }
    }

    public void finish(Database.BatchableContext BC) {}
}
