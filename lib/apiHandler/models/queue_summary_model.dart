class QueueSummaryModel {
  int? processFile;
  int? aniDBGetAnimeHTTP;
  int? aniDBGetFileUDP;
  int? aniDBAddFileUDP;
  int? aniDBUpdateWatchedUDP;
  int? tvDBSearch;
  int? aniDBGetCharsCreators;
  int? aniDBGetCharacter;
  int? aniDBGetCreator;
  int? hashFile;
  int? aniDBGetReviews;
  int? aniDBGetReleaseGroupStatus;
  int? aniDBGetUpdated;
  int? aniDBSyncMyList;
  int? aniDBGetReleaseGroup;
  int? aniDBGetCalendar;
  int? aniDBGetTitles;
  int? aniDBSyncVotes;
  int? aniDBVoteAnime;
  int? aniDBVoteEpisode;
  int? tvDBUpdateSeries;
  int? tvDBDownloadImages;
  int? tvDBSearchAnime;
  int? imageDownload;
  int? aniDBDeleteFileUDP;
  int? movieDBSearchAnime;
  int? traktSearchAnime;
  int? traktUpdateInfo;
  int? traktEpisodeHistory;
  int? traktSyncCollection;
  int? traktSyncCollectionSeries;
  int? traktEpisodeCollection;
  int? traktUpdateAllSeries;
  int? readMediaInfo;
  int? aniDBUpdateMylistStats;
  int? aniDBGetEpisodeUDP;
  int? refreshAnimeStats;
  int? linkAniDBTvDB;
  int? refreshGroupFilter;
  int? plexSync;
  int? linkFileManually;
  int? aniDBGetMyListFile;
  int? validateAllImages;
  int? tvDBUpdateEpisode;
  int? nullCommand;
  int? downloadAniDBImages;

  QueueSummaryModel(
      {processFile,
      aniDBGetAnimeHTTP,
      aniDBGetFileUDP,
      aniDBAddFileUDP,
      aniDBUpdateWatchedUDP,
      tvDBSearch,
      aniDBGetCharsCreators,
      aniDBGetCharacter,
      aniDBGetCreator,
      hashFile,
      aniDBGetReviews,
      aniDBGetReleaseGroupStatus,
      aniDBGetUpdated,
      aniDBSyncMyList,
      aniDBGetReleaseGroup,
      aniDBGetCalendar,
      aniDBGetTitles,
      aniDBSyncVotes,
      aniDBVoteAnime,
      aniDBVoteEpisode,
      tvDBUpdateSeries,
      tvDBDownloadImages,
      tvDBSearchAnime,
      imageDownload,
      aniDBDeleteFileUDP,
      movieDBSearchAnime,
      traktSearchAnime,
      traktUpdateInfo,
      traktEpisodeHistory,
      traktSyncCollection,
      traktSyncCollectionSeries,
      traktEpisodeCollection,
      traktUpdateAllSeries,
      readMediaInfo,
      aniDBUpdateMylistStats,
      aniDBGetEpisodeUDP,
      refreshAnimeStats,
      linkAniDBTvDB,
      refreshGroupFilter,
      plexSync,
      linkFileManually,
      aniDBGetMyListFile,
      validateAllImages,
      tvDBUpdateEpisode,
      nullCommand,
      downloadAniDBImages});

  QueueSummaryModel.fromJson(Map<String, dynamic> json) {
    processFile = json['ProcessFile'];
    aniDBGetAnimeHTTP = json['AniDB_GetAnimeHTTP'];
    aniDBGetFileUDP = json['AniDB_GetFileUDP'];
    aniDBAddFileUDP = json['AniDB_AddFileUDP'];
    aniDBUpdateWatchedUDP = json['AniDB_UpdateWatchedUDP'];
    tvDBSearch = json['TvDBSearch'];
    aniDBGetCharsCreators = json['AniDB_GetCharsCreators'];
    aniDBGetCharacter = json['AniDB_GetCharacter'];
    aniDBGetCreator = json['AniDB_GetCreator'];
    hashFile = json['HashFile'];
    aniDBGetReviews = json['AniDB_GetReviews'];
    aniDBGetReleaseGroupStatus = json['AniDB_GetReleaseGroupStatus'];
    aniDBGetUpdated = json['AniDB_GetUpdated'];
    aniDBSyncMyList = json['AniDB_SyncMyList'];
    aniDBGetReleaseGroup = json['AniDB_GetReleaseGroup'];
    aniDBGetCalendar = json['AniDB_GetCalendar'];
    aniDBGetTitles = json['AniDB_GetTitles'];
    aniDBSyncVotes = json['AniDB_SyncVotes'];
    aniDBVoteAnime = json['AniDB_VoteAnime'];
    aniDBVoteEpisode = json['AniDB_VoteEpisode'];
    tvDBUpdateSeries = json['TvDB_UpdateSeries'];
    tvDBDownloadImages = json['TvDB_DownloadImages'];
    tvDBSearchAnime = json['TvDB_SearchAnime'];
    imageDownload = json['ImageDownload'];
    aniDBDeleteFileUDP = json['AniDB_DeleteFileUDP'];
    movieDBSearchAnime = json['MovieDB_SearchAnime'];
    traktSearchAnime = json['Trakt_SearchAnime'];
    traktUpdateInfo = json['Trakt_UpdateInfo'];
    traktEpisodeHistory = json['Trakt_EpisodeHistory'];
    traktSyncCollection = json['Trakt_SyncCollection'];
    traktSyncCollectionSeries = json['Trakt_SyncCollectionSeries'];
    traktEpisodeCollection = json['Trakt_EpisodeCollection'];
    traktUpdateAllSeries = json['Trakt_UpdateAllSeries'];
    readMediaInfo = json['ReadMediaInfo'];
    aniDBUpdateMylistStats = json['AniDB_UpdateMylistStats'];
    aniDBGetEpisodeUDP = json['AniDB_GetEpisodeUDP'];
    refreshAnimeStats = json['Refresh_AnimeStats'];
    linkAniDBTvDB = json['LinkAniDBTvDB'];
    refreshGroupFilter = json['Refresh_GroupFilter'];
    plexSync = json['Plex_Sync'];
    linkFileManually = json['LinkFileManually'];
    aniDBGetMyListFile = json['AniDB_GetMyListFile'];
    validateAllImages = json['ValidateAllImages'];
    tvDBUpdateEpisode = json['TvDB_UpdateEpisode'];
    nullCommand = json['NullCommand'];
    downloadAniDBImages = json['DownloadAniDBImages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProcessFile'] = processFile;
    data['AniDB_GetAnimeHTTP'] = aniDBGetAnimeHTTP;
    data['AniDB_GetFileUDP'] = aniDBGetFileUDP;
    data['AniDB_AddFileUDP'] = aniDBAddFileUDP;
    data['AniDB_UpdateWatchedUDP'] = aniDBUpdateWatchedUDP;
    data['TvDBSearch'] = tvDBSearch;
    data['AniDB_GetCharsCreators'] = aniDBGetCharsCreators;
    data['AniDB_GetCharacter'] = aniDBGetCharacter;
    data['AniDB_GetCreator'] = aniDBGetCreator;
    data['HashFile'] = hashFile;
    data['AniDB_GetReviews'] = aniDBGetReviews;
    data['AniDB_GetReleaseGroupStatus'] = aniDBGetReleaseGroupStatus;
    data['AniDB_GetUpdated'] = aniDBGetUpdated;
    data['AniDB_SyncMyList'] = aniDBSyncMyList;
    data['AniDB_GetReleaseGroup'] = aniDBGetReleaseGroup;
    data['AniDB_GetCalendar'] = aniDBGetCalendar;
    data['AniDB_GetTitles'] = aniDBGetTitles;
    data['AniDB_SyncVotes'] = aniDBSyncVotes;
    data['AniDB_VoteAnime'] = aniDBVoteAnime;
    data['AniDB_VoteEpisode'] = aniDBVoteEpisode;
    data['TvDB_UpdateSeries'] = tvDBUpdateSeries;
    data['TvDB_DownloadImages'] = tvDBDownloadImages;
    data['TvDB_SearchAnime'] = tvDBSearchAnime;
    data['ImageDownload'] = imageDownload;
    data['AniDB_DeleteFileUDP'] = aniDBDeleteFileUDP;
    data['MovieDB_SearchAnime'] = movieDBSearchAnime;
    data['Trakt_SearchAnime'] = traktSearchAnime;
    data['Trakt_UpdateInfo'] = traktUpdateInfo;
    data['Trakt_EpisodeHistory'] = traktEpisodeHistory;
    data['Trakt_SyncCollection'] = traktSyncCollection;
    data['Trakt_SyncCollectionSeries'] = traktSyncCollectionSeries;
    data['Trakt_EpisodeCollection'] = traktEpisodeCollection;
    data['Trakt_UpdateAllSeries'] = traktUpdateAllSeries;
    data['ReadMediaInfo'] = readMediaInfo;
    data['AniDB_UpdateMylistStats'] = aniDBUpdateMylistStats;
    data['AniDB_GetEpisodeUDP'] = aniDBGetEpisodeUDP;
    data['Refresh_AnimeStats'] = refreshAnimeStats;
    data['LinkAniDBTvDB'] = linkAniDBTvDB;
    data['Refresh_GroupFilter'] = refreshGroupFilter;
    data['Plex_Sync'] = plexSync;
    data['LinkFileManually'] = linkFileManually;
    data['AniDB_GetMyListFile'] = aniDBGetMyListFile;
    data['ValidateAllImages'] = validateAllImages;
    data['TvDB_UpdateEpisode'] = tvDBUpdateEpisode;
    data['NullCommand'] = nullCommand;
    data['DownloadAniDBImages'] = downloadAniDBImages;
    return data;
  }
}
