/**
 * @author Harold Garcia
 * @email garciavargas9112@gmail.com
 * @create date 2024-09-21 18:37:49
 * @modify date 2024-09-21 18:37:49
 * @desc [ Clase base que proporciona una interfaz común para manejar la lógica de los triggers. 
 * Permite la recuperación de metadatos relacionados con el trigger y despacha las llamadas a los métodos específicos 
 * según el contexto (insertar, actualizar, eliminar).]
 */

@SuppressWarnings('PMD.EmptyStatementBlock,PMD.ApexCRUDViolation')
public without sharing virtual class TriggerHandler {
    public Trigger_Panel__mdt triggerpanel;//Instance of metadata
    /**
    * @description Constructor of class
    * @author garciavargas9112@gmail.com | 21-09-2024
    * @param 
    **/
    public TriggerHandler() {}
    /**
    * @description Constructor of class
    * @author garciavargas9112@gmail.com | 21-09-2024
    * @param 
    **/
    public TriggerHandler(String triggerName) {
        getTriggerPanel(triggerName);
    }
    /**
    * @description This method get metadata by trigger name
    * @author garciavargas9112@gmail.com | 18-05-2022
    * @param triggerName 
    **/
    public void getTriggerPanel(String triggerName){
        try {
            triggerpanel =  [SELECT ProcessOnAfterDelete__c, ProcessOnAfterInsert__c, ProcessOnAfterUpdate__c, 
                                ProcessOnBeforeDelete__c, ProcessOnBeforeInsert__c, ProcessOnBeforeUpdate__c, ProcessOnUnDelete__c
                        FROM Trigger_Panel__mdt 
                        WHERE TriggerName__c =: triggerName 
                        LIMIT 1];    
        } catch (DmlException e) {
            triggerpanel = null;
        }
    }
    /**
    * @description Constructor of class
    * @author garciavargas9112@gmail.com | 21-09-2024
    * @param 
    **/
    @SuppressWarnings('PMD.CyclomaticComplexity')
    public void run() {
        // dispatch to the correct handler method
        if(Trigger.isExecuting && triggerpanel <> null){
            if(triggerpanel.ProcessOnBeforeInsert__c && Trigger.isInsert && Trigger.isBefore) {
                this.beforeInsert();
                this.asyncBeforeInsert();
            } else if(triggerpanel.ProcessOnBeforeUpdate__c && Trigger.isUpdate && Trigger.isBefore) {
                this.beforeUpdate();
                this.asyncBeforeUpdate();
            } else if(triggerpanel.ProcessOnBeforeDelete__c && Trigger.isDelete && Trigger.isBefore) {
                this.beforeDelete();
            } else if(triggerpanel.ProcessOnAfterInsert__c && Trigger.isInsert && Trigger.isAfter) {
                this.afterInsert();
                this.asyncAfterInsert();
            } else if(triggerpanel.ProcessOnAfterUpdate__c && Trigger.isUpdate && Trigger.isAfter) {
                this.afterUpdate();
                this.asyncAfterUpdate();
            } 
        }
    }
    /** context-specific methods for override **/
    public virtual void beforeInsert(){}
    public virtual void beforeUpdate(){}
    public virtual void beforeDelete(){}
    public virtual void afterInsert(){}
    public virtual void afterUpdate(){}

    //Asynchronous methods
    public virtual void asyncBeforeInsert(){}
    public virtual void asyncAfterInsert(){}
    public virtual void asyncBeforeUpdate(){}
    public virtual void asyncAfterUpdate(){}
}