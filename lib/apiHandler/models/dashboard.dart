class StatsResponse {
  final int fileCount;
  final int seriesCount;
  final int groupCount;
  final int fileSize;
  final int finishedSeries;
  final int watchedEpisodes;
  final double watchedHours;
  final double percentDuplicate;
  final int missingEpisodes;
  final int missingEpisodesCollecting;
  final int unrecognizedFiles;
  final int seriesWithMissingLinks;
  final int episodesWithMultipleFiles;
  final int filesWithDuplicateLocations;

  StatsResponse(
      this.fileCount,
      this.seriesCount,
      this.groupCount,
      this.fileSize,
      this.finishedSeries,
      this.watchedEpisodes,
      this.watchedHours,
      this.percentDuplicate,
      this.missingEpisodes,
      this.missingEpisodesCollecting,
      this.unrecognizedFiles,
      this.seriesWithMissingLinks,
      this.episodesWithMultipleFiles,
      this.filesWithDuplicateLocations);

  StatsResponse.fromJson(Map<String, dynamic> json)
      : fileCount = json['FileCount'],
        seriesCount = json['SeriesCount'],
        groupCount = json['GroupCount'],
        fileSize = json['FileSize'],
        finishedSeries = json['FinishedSeries'],
        watchedEpisodes = json['WatchedEpisodes'],
        watchedHours = json['WatchedHours'],
        percentDuplicate = json['PercentDuplicate'],
        missingEpisodes = json['MissingEpisodes'],
        missingEpisodesCollecting = json['MissingEpisodesCollecting'],
        unrecognizedFiles = json['UnrecognizedFiles'],
        seriesWithMissingLinks = json['SeriesWithMissingLinks'],
        episodesWithMultipleFiles = json['EpisodesWithMultipleFiles'],
        filesWithDuplicateLocations = json['FilesWithDuplicateLocations'];

  Map<String, dynamic> toJson() => {
        'FileCount': fileCount,
        'SeriesCount': seriesCount,
        'GroupCount': groupCount,
        'FileSize': fileSize,
        'FinishedSeries': finishedSeries,
        'WatchedEpisodes': watchedEpisodes,
        'WatchedHours': watchedHours,
        'PercentDuplicate': percentDuplicate,
        'MissingEpisodes': missingEpisodes,
        'MissingEpisodesCollecting': missingEpisodesCollecting,
        'UnrecognizedFiles': unrecognizedFiles,
        'SeriesWithMissingLinks': seriesWithMissingLinks,
        'EpisodesWithMultipleFiles': episodesWithMultipleFiles,
        'FilesWithDuplicateLocations': filesWithDuplicateLocations
      };
}
