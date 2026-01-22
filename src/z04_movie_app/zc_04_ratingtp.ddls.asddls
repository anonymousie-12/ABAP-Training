@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
@Metadata.allowExtensions: true
define view entity ZC_04_RatingTP as projection on ZR_04_RatingTP
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  
   _Movie :  redirected to parent ZC_04_MovieTP
}
