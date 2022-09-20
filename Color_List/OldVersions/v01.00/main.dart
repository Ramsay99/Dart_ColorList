/**
 * @author Ramzi Sayegh
 * @student_ID 22034290
 * @date_lastModified 30-Jul-22
 * @version 1.0
 * @lab_num 01
 */
import 'dart:io';

void main() {
  List Colors = GetDefaultColors();
  GreetingsMessage();
  HandlingUserRequirementForColorList(Colors);
}

List GetDefaultColors() {
  List Colors = [
    "blue",
    "greenAccent",
    "green",
    "pink",
    "gray",
    "purple",
    "wheat",
    ["black", "green", "red", "white"],
    "orange",
    "yellow",
    "amber",
    "darkbrown",
    ["dark pink", "dark red", "dark blue", "dark purple"],
    "lime",
    "teal",
    ["light Blue", "ligt green", "light red"],
  ];
  return Colors;
}

void GreetingsMessage() {
  print("Hello to my first Dart/Flutter Lab");
}

void printQuestions() {
  print("Press Enter after typing the Question Number To check my answer:" +
      "\n0- End/Close Application!" +
      "\n1- check if we have the color white inside our list" +
      "\n2- add the color Rose between pink and gray" +
      "\n3- remove the light green from our list and print the index that it was in \$index" +
      "\n4- add the following items inside one item {cayan - indigo- deeppurple -brown} after the lime" +
      "\n5 - print the place of darkbrown " +
      "\n6- check if we have redAccent in our list and if no just add it to the last index " +
      "\n7- update the value of teal to be dark teal " +
      "\n8 - print the list before and after the clear " +
      "\n9- print the items in reversed way " +
      "\n10 - remove the last item in your list and let me see the result " +
      "\n11- there is a method called removeRange please figure what it suppose to do and print for me a text ");
}

int ReadUserQuestionNumberInput() {
  int userQuestionNumberInput = int.parse(stdin.readLineSync()!);
  return userQuestionNumberInput;
}

void HandlingUserRequirementForColorList(List Colors) {
  int userQuestionNumberInput = 0;
  while (true) {
    printQuestions();
    userQuestionNumberInput = ReadUserQuestionNumberInput();
    AnswerUserDesiredQuestion(Colors, userQuestionNumberInput);
  }
}

void AnswerUserDesiredQuestion(List Colors, int userQuestionNumberInput) {
  print("\n");

  switch (userQuestionNumberInput) {
    case 1: // 1- check if we have the color white inside our list
      {
        Q1(Colors, "white");
        break;
      }

    case 2: // 2- add the color Rose between pink and gray
      {
        Q2(Colors, "pink", "Rose");
        break;
      }
    case 3: // 3- remove the light green from our list and print the index that it was in ("  $index")
      {
        Q3(Colors, "ligt green");
        break;
      }
    case 4: // 4- add the following items inside one item {cayan - indigo- deeppurple -brown} after the lime
      {
        Q4(Colors, "lime", (["cayan", "indigo", "deeppurple", "brown"]));
        break;
      }
    case 5: // 5 - print the place of darkbrown
      {
        Q5(Colors, "darkbrown");
        break;
      }
    case 6: // 6- check if we have redAccent in our list and if no just add it to the last index
      {
        Q6(Colors, "redAccent");
        break;
      }
    case 7: // 7- update the value of teal to be dark teal
      {
        Q7_UsingLamdba(Colors, "teal", "dark teal");
        break;
      }
    case 8: // 8 - print the list before and after the clear
      {
        Q8(Colors);
        break;
      }
    case 9: // 9- print the items in reversed way
      {
        Q9(Colors);
        break;
      }
    case 10: // 10 - remove the last item in your list and let me see the result
      {
        Q10(Colors);
        break;
      }
    /**
         * 11- there is a method called removeRange please figure what it suppose to do and print for me the follow 
         * "i have found that the method of removeRange do the following and here is my output ${your output} below."
         */
    case 11:
      {
        Q11(Colors);
        break;
      }
    case 0: // 0 - Closing the Application.
      {
        print("Application will Close!\nGood Bye.");
        exit(0);
      }

    default:
      {
        print("Error! please write only the Question Number or 0 to Exit.");
      }

      print("\n");
  }
}

// checks if we have the colorName inside our list
void Q1(List list, String colorName) {
  bool doesContains = CheckIfContainsAColorInList(list, colorName);
  DoesContainsMessage(doesContains);
}

bool CheckIfContainsAColorInList(List list, String colorName) {
  Iterator ColorIterator = list.iterator;
  while (ColorIterator.moveNext()) {
    String elementInCollection = ColorIterator.current.toString();
    if (ContainsCaseInSensitive(elementInCollection, colorName)) {
      return true;
    }
  }
  return false;
}

bool ContainsCaseInSensitive(String wholeString, String subString) {
  wholeString = wholeString.toUpperCase();
  subString = subString.toUpperCase();
  if (wholeString.contains(subString)) {
    return true;
  }
  return false;
}

void DoesContainsMessage(bool isFound) {
  if (isFound) {
    print("The List does have this Color");
  } else
    print("The List does NOT have this color");
}

// TODO: make it better by considering color_2.
// Bug: it adds the item if it has been found or not, so check if it exests before the addition.
// adds a color between color_1 and color_2
void Q2(List list, String thisString, String newStringAfterThisString) {
  printListBefore(list);
  AddElementAfterIndex(list, thisString, newStringAfterThisString);
  printListAfter(list);
}

void printListBefore(List list) {
  print("Before: " + list.toString());
}

void printListAfter(List list) {
  print("After : " + list.toString());
}

void AddElementAfterIndex(
    List list, String thisString, String newStringAfterThisString) {
  int indexPosition = list.indexOf(thisString);
  list.insert(indexPosition + 1, newStringAfterThisString);
}

// TODO: Fix GetIndexByString Bug.
// prints the color index in a List, removes it next
void Q3(List list, String elementName) {
  if (CheckIfContainsAColorInList(list, elementName)) {
    // if (list.contains(elementName)) {
    int index = GetIndexByString(list, elementName);

    printListBefore(list);
    RemoveElementByString(list, elementName);
    printListAfter(list);
    print(
        "Element name: ${elementName}, at Index: ${index}, has been successfully Removed.");
  } else
    print(
        "Error! this ${elementName} is NOT in This List. RemovingFunction was Aborted.");
}

// Bug: gent get or remove element if it was in a nestedList.
int GetIndexByString(List list, String elementName) {
  int index = list.indexWhere((element) => element == elementName);
  return index;
}

void RemoveElementByString(List list, String elementName) {
  list.remove(elementName);
}

// adds a list inside a list, the posision of the new list should be after a specific given element/index
void Q4(List list, String element, List newlist) {
  printListBefore(list);
  int indexOfThisElement = GetIndexByString(list, element);
  // Add a List into a List at a specific Position
  list.insert(indexOfThisElement + 1, newlist);
  printListAfter(list);
}

// prints the index of a given color
void Q5(List list, String newElement) {
  print(GetIndexByString(list, newElement));
}

// if the given color is Not in the list, then add it to the list
void Q6(List list, String color) {
  bool isColorInList = CheckIfContainsAColorInList(list, color);
  DoesContainsMessage(isColorInList);

  if (!isColorInList) {
    printListBefore(list);
    list.add(color);
    printListAfter(list);
    print("\n${color} has been added successfully.");
  } else
    print(list);
}

void Q7_UsingLamdba(List list, String oldName, String newName) {
  try {
    list[list.indexWhere((element) => element.toString() == oldName)] = newName;
  } catch (exception) {
    print("Something Wrong happened! -Error Msg: " + exception.toString());
  }

  printListAfter(list);
}

void Q8(List list) {
  printListBefore(list);
  list.clear();
  printListAfter(list);
}

// Note: why i have to use '.toList()' to print everysingle item, as i expected it happened without '.toList()'?
void Q9(List list) {
  printListBefore(list);
  print("Reversed: " + list.reversed.toList().toString());
}

void Q10(List list) {
  printListBefore(list);
  list.removeLast();
  printListAfter(list);
}

void Q11(List list) {
  printListBefore(list);
  list.removeRange(1, 4);

  print("\nI've found that the removeRange do the following: " +
      "\nRemoves the elements with positions greater than or equal to [start] and less than [end], from the list. This reduces the list's length by end - start." +
      "\nand here is my output for list.removeRange(1, 4); down below.");
  printListAfter(list);
}
