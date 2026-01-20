@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Excercise 3'
define view entity Z04_TravelWithCustomer //anhand Primärschlüssel
  as select from Z04_Customer as c

    inner join   Z04_Travel   as t on c.CustomerId = t.CustomerId
    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: '/DMO/STATUS' ) as s on  s.value_low = t.Status
                                                                                    and s.language  = $session.system_language
{

  key t.TravelId,
      t.AgencyId,
      t.BeginDate,
      t.EndDate,
      dats_days_between(t.BeginDate, t.EndDate) + 1  as Duration,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      currency_conversion
      (amount => t.BookingFee,
      source_currency => t.CurrencyCode,
      target_currency => cast('EUR' as abap.cuky),
      exchange_rate_date => $session.system_date,
      error_handling => 'SET_TO_NULL')                              as BookingFee,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      currency_conversion
      (amount => t.TotalPrice,
      source_currency => t.CurrencyCode,
      target_currency => cast('EUR' as abap.cuky),
      exchange_rate_date => $session.system_date,
      error_handling => 'SET_TO_NULL' )                             as TotalPrice,
      cast('EUR' as abap.cuky)                                      as CurrencyCode,
      t.Description,
      s.text as StatusText,
      c.CustomerId,

      case when c.Title is not initial
      then concat(c.Title, concat_with_space(c.FirstName, c.LastName, 1))
      else concat_with_space(c.FirstName, c.LastName, 1)

      end                                                           as CustomerName,



      c.Street,
      c.PostalCode,
      c.City




}

where
  c.CountryCode = 'DE'
