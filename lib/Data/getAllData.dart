
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:ittalentsproject/Data/Formation_manager.dart';
import 'package:ittalentsproject/Data/category_manager.dart';

class getAllData {

Future<List> getAllDataForm(Formation_manager form ) async{


  if(await isInternet())

  {

    return form.get_formation();

  } else
  {
    if(form.lastFetchTime.isBefore(DateTime.now().subtract(form.cacheValidDuration)))
    { print('not connected');



    return form.get_formationpref(); }
  }


}

Future<List> getAllDataCateg(category_manager cat) async{


  if(await isInternet())

  {

    return cat.get_category();

  } else
  {
    if(cat.lastFetchTime.isBefore(DateTime.now().subtract(cat.cacheValidDuration)))
    { print('not connected');



    return cat.get_categorypref(); }
  }


}

Future<bool> isInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network, make sure there is actually a net connection.
    if (await DataConnectionChecker().hasConnection) {
      // Mobile data detected & internet connection confirmed.
      return true;
    } else {
      // Mobile data detected but no internet connection found.
      return false;
    }
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a WIFI network, make sure there is actually a net connection.
    if (await DataConnectionChecker().hasConnection) {
      // Wifi detected & internet connection confirmed.
      return true;
    } else {
      // Wifi detected but no internet connection found.
      return false;
    }
  } else {
    // Neither mobile data or WIFI detected, not internet connection found.
    return false;
  }
}


}