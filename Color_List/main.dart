/**
 * @author Ramzi Sayegh
 * @student_ID 22034290
 * @date_lastModified 31-Jul-22
 * @version 2.0
 * @lab_num 01
 */

/*
  Note: if the user Was Not able to input Question Number in the Terminal, then he need to follow these Steps:
  1) Open Visual Studio Code Settings (CTRL+,)
  2) Look for 'Dart: Cli Console'
  3) Set it to 'Terminal'
*/
import 'Colors.dart';

void main() {
  GreetingsMessage();
  Colors colors = new Colors.getDefault();
  colors.HandlingUserRequirementForColorList();
}

void GreetingsMessage() {
  print("\n\nHello to my first Dart/Flutter Lab\n\n");
}
