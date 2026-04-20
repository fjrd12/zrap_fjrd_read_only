@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airport Value Help'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define view entity Z_I_AIRPORT_TECH_VH
  as select from /dmo/airport
{
      @Search.defaultSearchElement: true
  key airport_id as AirportId,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      name       as Name,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      city       as City,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      country    as Country
}
