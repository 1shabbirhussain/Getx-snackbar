//     //clear cache-------------------------------------------------------------
// if (isAvailable) {
//   var lastClearCacheDate = DateTime.fromMillisecondsSinceEpoch(
//       await SharedPref.createInstance().getClearCacheDate() ?? 0);

//   // Change the condition to check if it's been 15 days since the last clear
//   if (DateTime.now().difference(lastClearCacheDate).inDays >= 15) {
//     bool cacheCleared = await FileUtility.instance.clearCache();
//     if (cacheCleared) {
//       await SharedPref.createInstance()
//           .setClearCacheDate(DateTime.now().millisecondsSinceEpoch);
//       print("Cache cleared date changed");
//     }
//   } else {
//     print("Cache is already cleared");
//   }
// }




//   static const String KEY_CACHE_CLEAR = "key_cache_clear"; // added for clear cache








//   Future<bool> setClearCacheDate(int printTime) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setInt(Strings.KEY_CACHE_CLEAR, printTime);
//   }

//   Future<int?> getClearCacheDate() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (prefs.containsKey(Strings.KEY_CACHE_CLEAR))
//       return prefs.getInt(Strings.KEY_CACHE_CLEAR);
//     else
//       return 0;
//   }












//     //CLEAR CACHE
//   Future<bool> clearCache() async {
//   try {
//     Directory tempDir = await getTemporaryDirectory();
//     if (tempDir.existsSync()) {
//       tempDir.deleteSync(recursive: true);
//       print('Temporary directory cleared successfully.');
//       return true;
//     } else {
//       print('Temporary directory does not exist.');
//       return true;
//     }
//   } catch (e) {
//     print('Error clearing temporary directory: $e');
//     return false;
//   }
// }