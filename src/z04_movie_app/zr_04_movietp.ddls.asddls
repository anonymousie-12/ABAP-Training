@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
define root view entity ZR_04_MovieTP as select from ZI_04_Movie
association [0..1] to ZI_04_AverageRating  as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
association [0..1] to ZI_04_GenreText as _GenreText on $projection.Genre = _GenreText.Genre
composition [0..*] of ZR_04_RatingTP as _Ratings
{
  key MovieUuid,
  Title,
  Genre,
  PublishingYear,
  RuntimeInMin,
  ImageUrl,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy,
  
 _AverageRating,
  
  _Ratings,
  
  _GenreText
  
}
