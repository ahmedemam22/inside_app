import 'package:awesome_dialog/awesome_dialog.dart';

awesome_dialog(context,title,desc){
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    animType: AnimType.BOTTOMSLIDE,
    title: title,
    desc: desc,
    btnOkOnPress: () {},
  )..show();
}