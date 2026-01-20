@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 3: Arithmetic Operators, Cases and Built-in Functions'
define view entity Z04_Demo03
  as select from /dmo/connection as c
    inner join   /dmo/flight     as f on  c.carrier_id    = f.carrier_id
                                      and c.connection_id = f.connection_id
{

  key c.carrier_id                                                   as CarrierId,
  key c.connection_id                                                as ConnecionId,

      // Literals and Casts
      'Hello World'                                                  as TextLiteral,
      42                                                             as NumberLiteral,
      0.1                                                            as Fltp,
      @EndUserText.label: 'Carrier Id'
      @EndUserText.quickInfo: 'Carrier Id'
      'LH'                                                           as Char3,
      cast('LH' as /dmo/carrier_id)                                  as CarrierId2,


      //Arithmetic Operations
      f.seats_max - f.seats_occupied                                 as FreeSeats,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      f.price                                                        as OldPrice,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      f.price * 2                                                    as DoublePrice,
      cast(f.price as abap.dec(16,2)) * cast('1.1' as abap.dec(4,1)) as NewPrice2,
      cast(f.price as abap.fltp) * 1.1                               as NewPrice,
      f.currency_code                                                as CurrencyCode,
      f.seats_occupied                                               as OccupiedSeats,
      f.seats_max                                                    as MaxSeats,
      f.seats_occupied / f.seats_max                                 as OccupancyRate,

      c.distance                                                     as distance,
      c.distance_unit                                                as DistanceUnit,
      case when c. distance < 1000 then 'Kurzstreckenflug'
          when c.distance < 5000 then 'Mittelstreckenflug'
          else 'Langstreckenflug'

      end                                                            as DistanceText,

      case f.currency_code when 'EUR' then 'Euro'
      when 'SGD' then 'Singapur Dollar'
      when 'USD' then 'Amerikanischer Dollar'
      else 'was anderes'
      end                                                            as CurrencyCodeText,

      //Built-In Functions
      division(f.seats_occupied, f.seats_max, 2)                     as OccupancyRate2,
      length('   ')                                                  as SSS,
      length('  x')                                                  as SSX,
      length('x   ')                                                 as XSS,
      @Semantics.amount.currencyCode : 'CurrencyCode2'
      currency_conversion
      (amount => f.price,
      source_currency => f.currency_code,
      target_currency => cast('EUR' as abap.cuky),
      exchange_rate_date => f.flight_date )                          as ConvertedPrice,
      cast('EUR' as abap.cuky)                                       as CurrencyCode2,
      
      dats_add_days(f.flight_date, -1, 'FAIL') as NewDate
      








}
