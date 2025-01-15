Map<String, dynamic> getMoodById(
  int? moodId,
  List<Map<String, dynamic>> moodList,
) {
  return moodList.firstWhere(
    (element) => element['id'] == moodId,
    orElse: () => {
      'path': 'assets/icongif/default.gif',
      'name': 'Mood Tidak Dikenali',
    },
  );
}
