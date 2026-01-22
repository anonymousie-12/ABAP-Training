@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'

define view entity ZR_04_RatingTP as select from ZI_04_Rating
association to parent ZR_04_MovieTP as _Movie on $projection.MovieUuid = _Movie.MovieUuid

{
  
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  
  _Movie
}
