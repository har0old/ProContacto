/**
 * @author Harold Garcia
 * @email garciavargas9112@gmail.com
 * @create date 2024-09-21 20:55:55
 * @modify date 2024-09-21 20:55:55
 * @desc [Clase específica para manejar eventos del objeto Contact. Sobrescribe métodos para manejar la lógica después de insertar y actualizar contactos.]
 */


public with sharing class ContactTriggerHandler extends TriggerHandler {

    public ContactTriggerHandler(String triggerName) {
        super(triggerName);
    }

    override public void afterInsert() {
        processContactInsert((List<Contact>) Trigger.new);
    }

    override public void afterUpdate() {
        processContactUpdate(Trigger.new, Trigger.oldMap);
    }

    private void processContactInsert(List<Contact> newContacts) {
        ContactEmailUpdateBatch batch = new ContactEmailUpdateBatch(newContacts);
        Database.executeBatch(batch);
    }

    private void processContactUpdate(List<Contact> newContacts, Map<Id, SObject> oldContactsMap) {
        List<Contact> contactsToProcess = new List<Contact>();

        for (Contact con : newContacts) {
            Contact oldCon = (Contact)oldContactsMap.get(con.Id);
            if (con.idprocontacto__c != null && con.idprocontacto__c != oldCon.idprocontacto__c) {
                contactsToProcess.add(con);
            }
        }

        if (!contactsToProcess.isEmpty()) {
            ContactEmailUpdateBatch batch = new ContactEmailUpdateBatch(contactsToProcess);
            Database.executeBatch(batch);
        }
    }
}
