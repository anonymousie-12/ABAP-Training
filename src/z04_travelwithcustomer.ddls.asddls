@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Excercise 3'
define view entity Z04_TravelWithCustomer //anhand Primärschlüssel
  as select from Z04_Customer as c

    inner join   Z04_Travel   as t on c.CustomerId = t.CustomerId
{

  key c.CustomerId,
  key t.TravelId,
      c.FirstName,
      c.LastName,
      c.Title,
      c.Street,
      c.PostalCode,
      c.City,
      t.AgencyId,
      t.BeginDate,
      t.EndDate,
      t.BookingFee,
      t.TotalPrice,
      t.CurrencyCode,
      t.Description,
      t.Status

}

where
  c.CountryCode = 'DE'
