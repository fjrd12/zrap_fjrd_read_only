@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Conection tables'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: {
    typeName: 'Connection',
    typeNamePlural: 'Connections'
    }
@Search.searchable: true

define view entity Z_I_Connection
  as select from /dmo/connection
  association [1..*] to Z_I_Flight_TECH_R  as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                       and $projection.ConnectionId = _Flight.ConnectionId
  association [1]    to Z_I_Carrier_Tech_r as _Airline on  $projection.CarrierId = _Airline.CarrierId
{
      @UI.facet: [{
                    id: 'Connection',
                    purpose: #STANDARD,
                    type: #IDENTIFICATION_REFERENCE,
                    position: 10,
                    label: 'Connection Detail' },

                   {
                     id: 'Flight',
                     purpose: #STANDARD,
                     type: #LINEITEM_REFERENCE,
                     position: 20,
                     label: 'Flights Detail',
                     targetElement: '_Flight'
                    }]
      @UI.lineItem: [{ position: 10 , label: 'Airline'}]
      @UI.identification: [{ position: 10 , label: 'Airline'}]
      @ObjectModel.text.association: '_Airline'
      @Search.defaultSearchElement: true
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
      @Search.defaultSearchElement: true
  key connection_id   as ConnectionId,
      @UI.lineItem: [{ position: 30 }]
      @UI.identification: [{ position: 10 }]
      @UI.selectionField: [{ position: 20 }]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: {
        name: 'Z_I_AIRPORT_TECH_VH',
        element: 'AirportId'
      } }]
      @EndUserText.label: 'Departure Airport ID'
        
      airport_from_id as AirportFromId,
      @UI.lineItem: [{ position: 40 }]
      @UI.selectionField: [{ position: 30 }]
      @UI.identification: [{ position: 40 }]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: {
        name: 'Z_I_AIRPORT_TECH_VH',
        element: 'AirportId'
      } }]
      @EndUserText.label: 'Destination Airport ID'
      airport_to_id   as AirportToId,
      @UI.identification: [{ position: 50 }]
      @UI.lineItem: [{ position: 50 ,  label: 'Departure Time'}]
      departure_time  as DepartureTime,
      @UI.identification: [{ position: 60 }]
      @UI.lineItem: [{ position: 60, label: 'Arrival Time'}]
      arrival_time    as ArrivalTime,
      @UI.lineItem: [{ position: 70 }]
      @UI.identification: [{ position: 70 }]
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      @UI.lineItem: [{ position: 80 }]
      @UI.identification: [{ position: 80 }]
      distance_unit   as DistanceUnit,
      //Association to Flight
      @Search.defaultSearchElement: true
      _Flight,
      @Search.defaultSearchElement: true
      _Airline
}
