enum BoxListEnum { download, favorite }

extension BoxListEnumExtension on BoxListEnum {
  String get name {
    switch (this) {
      case BoxListEnum.download:
        return 'DOWNLOAD';
      case BoxListEnum.favorite:
        return 'FAVORITE';
      default:
        return "";
    }
  }
}
