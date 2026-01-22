@AbapCatalog.viewEnhancementCategory: [#NONE]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

@Search.searchable: true

@Metadata.allowExtensions: true
define root view entity ZC_04_TravelTP
  provider contract transactional_query
  as projection on ZR_04_TravelTP
  
 
  
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      
      Description,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
      //Transient Data
      StatusCriticality,
      CustomerName,
      
      _Bookings: redirected to composition child ZC_04_BookingTP
}
