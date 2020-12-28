import 'package:awesome_dialog/awesome_dialog.dart';

awesome_dialog(context){
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    animType: AnimType.BOTTOMSLIDE,
    title: 'Error Registration',
    desc: 'this mobile already exists.',
    btnOkOnPress: () {},
  )..show();
}