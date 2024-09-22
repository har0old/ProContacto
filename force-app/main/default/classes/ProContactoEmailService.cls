/**
 * @author Harold Garcia
 * @email garciavargas9112@gmail.com
 * @create date 2024-09-21 20:56:45
 * @modify date 2024-09-21 20:56:45
 * @desc [Clase encargada de obtener y actualizar los correos electrónicos de contactos a través de un servicio externo llamado ProContacto.]
 */

public with sharing class ProContactoEmailService {
    
    public static List<Contact> updateContactEmails(List<Contact> contacts) {
        List<Contact> updatedContacts = new List<Contact>();
        
        for (Contact con : contacts) {
            if (con.idprocontacto__c != null) {
                try {
                    String email = ProContactoService.getEmailFromProContacto(con.idprocontacto__c);
                    if (email != null) {
                        con.Email = email;
                        updatedContacts.add(con);
                    }
                } catch (ProContactoService.CustomException ex) {
                    System.debug('Error al obtener el email de ProContacto: ' + ex.getMessage());
                }
            }
        }
        
        return updatedContacts;
    }
}
