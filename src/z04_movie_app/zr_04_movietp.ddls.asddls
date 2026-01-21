@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_04_MovieTP as select from ZI_04_Movie
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
  LastChangedBy
}
