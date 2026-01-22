@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
define view entity ZC_04_BookingTP as projection on ZR_04_BOOKINGTP
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
  _Travel :  redirected to parent ZC_04_TravelTP
}
