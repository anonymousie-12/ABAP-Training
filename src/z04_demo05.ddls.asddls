@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 5: Aggregation Functions'
define view entity Z04_Demo05
  as select from /dmo/flight
{
  key carrier_id as CarrierId,
  count(*)                                            as NumberofFlights,
  count(distinct plane_type_id)                       as NumberOfDifferentPlaneTyoeIds,
  max(seats_occupied)                                 as MaxOccupiedSeats,
  min(seats_occupied)                                 as MinOccupiedSeats,
  sum(case when seats_occupied / seats_max > 0.7 then 1
      else 0
      end)                                            as NumberOfMostlyBookedUpFlights,
  sum(case when seats_occupied = 0 then 1 else 0 end) as NumberOfEmptyFlights,
  avg(seats_occupied as abap.dec(16,1)) as AverageOccupiedSeats,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  avg(price as abap.curr(16,2)) as AverageFlightPrice,
  currency_code as CurrencyCode

}
group by 
  carrier_id,
  currency_code
  
having avg(price as abap.curr(16,2)) < 5000






