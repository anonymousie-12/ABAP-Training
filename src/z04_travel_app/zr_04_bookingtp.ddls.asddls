@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'

define view entity ZR_04_BOOKINGTP 


as select from ZI_04_BOOKING

association to parent ZR_04_TravelTP as _Travel
on $projection.TravelId = _Travel.TravelId


{
  key TravelId,
  key BookingId,
  BookingDate,
  CustomerId,
  CarrierId,
  ConnectionId,
  FlightDate,
  FlightPrice,
  CurrencyCode,
  
  
   /* Associations */
   _Travel
   
   
 }  
  
