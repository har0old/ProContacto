/**
 * @author Harold Garcia
 * @email garciavargas9112@gmail.com
 * @create date 2024-09-20 20:41:28
 * @modify date 2024-09-20 20:41:28
 * @desc [Clase que maneja las solicitudes HTTP hacia el servicio externo ProContacto. Incluye métodos para realizar la llamada y procesar la respuesta.]
 */

public with sharing class ProContactoService {   
    @testVisible
    private static HttpResponse requestWithResponse(String method, String namedCredentialUrl) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(namedCredentialUrl);
        req.setTimeout(120000);
        req.setMethod(method);
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        HttpResponse response = http.send(req);
        
        if (response.getStatusCode() != 200 && response.getStatusCode() != 201) {
            String sResponse = response.getStatusCode() + ' ' + response.getStatus();
            System.debug('Error en la llamada al servicio externo: ' + sResponse);
            throw new CustomException('Error en la llamada al servicio ProContacto. Código de estado: ' + response.getStatusCode());
        }
        
        System.debug('Respuesta de la API: ' + response.getBody());
        return response;
    }
    
    public static String getEmailFromProContacto(String proContactoId) {
        if (String.isBlank(proContactoId)) {
            throw new IllegalArgumentException('El ID de ProContacto no puede estar vacío');
        }
        String namedCredentialUrl = 'callout:ProContacto_endPoint';
        HttpResponse response = requestWithResponse('GET', namedCredentialUrl);
        try {
            Map<String, Object> jsonResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            if (jsonResponse.containsKey(proContactoId)) {
                Map<String, Object> contactData = (Map<String, Object>) jsonResponse.get(proContactoId);
                return (String) contactData.get('email');
            } else {
                throw new CustomException('No se encontraron datos para el ID proporcionado: ' + proContactoId);
            }
        } catch (Exception e) {
            throw new CustomException('Error al procesar la respuesta de ProContacto: ' + e.getMessage());
        }
    }
    
    
    public class CustomException extends Exception {}
}
