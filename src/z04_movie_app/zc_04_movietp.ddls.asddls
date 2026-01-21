@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZC_04_MovieTP as select from ZR_04_MovieTP
{
  key MovieUuid,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.7
  Title,
  Genre,
  PublishingYear,
  RuntimeInMin,
    @Semantics.imageUrl: true
  ImageUrl,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy
}
