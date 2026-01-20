@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exercise 7'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z04_CustomerWithTravels as select from Z04_Customer
association [0..*] to Z04_Travel as _Travels on _Travels.CustomerId = $projection.CustomerId
{
  
  key CustomerId,
  FirstName,
  LastName,
  Title,
  Street,
  PostalCode,
  City,
  
  _Travels
  
  
  
}

where CountryCode = 'DE'
