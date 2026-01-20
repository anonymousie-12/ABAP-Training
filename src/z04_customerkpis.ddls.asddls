@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exercise 5'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z04_CustomerKPIs as select from Z04_TravelWithCustomer
{
  
  key CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum(BookingFee + TotalPrice) as TotalRevenue,
  CurrencyCode,
  avg(Duration as abap.dec(16,0)) as AverageDuration,
  count( distinct AgencyId ) as NumberOfDifferentAgencies

  

     
  
}

group by CustomerId,
CustomerName,
Street,
PostalCode,
City,
CurrencyCode


having sum(BookingFee + TotalPrice) >= 500
