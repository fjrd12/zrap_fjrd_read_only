@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier CDS view'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true

define view entity Z_I_Carrier_Tech_r as 
select from /dmo/carrier
{   
    key carrier_id as CarrierId,
    @Search.defaultSearchElement: true 
    @Semantics.text: true
    @Search.fuzzinessThreshold: 0.8
    name as Name,
    currency_code as CurrencyCode
}
