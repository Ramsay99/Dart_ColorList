import 'dart:io';

class Colors {
  static const int _DEFAULT_NUM_VALUE = -1;
  static const int _NOT_FOUND = -1;
  static const int _FIRST_ELEMENT = 0;
  static const int _FIRST_LIST = 0;
  static const int _SECOND_LIST = 1;
  List _colorsList = List.empty(growable: true);
  int _userQuestionNumberInput = _DEFAULT_NUM_VALUE;
  List _tempIndex = [_NOT_FOUND];

  // toLearn: how to pass a default List. // [List list = new]
  Colors() {}
  Colors.getDefault() {
    SetDefaultColors();
  }
  Colors.createCustom(List customColorList) {
    _colorsList = customColorList;
  }

  void SetDefaultColors() {
    _colorsList = _GetDefaultColors();
  }

  List _GetDefaultColors() {
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

  List GetColorsList() {
    return _colorsList;
  }

  void PrintList() {
    print(GetColorsList());
  }

  void HandlingUserRequirementForColorList() {
    while (true) {
      printColorQuestions();
      _userQuestionNumberInput = ReadUserColorQuestionsNumberInput();
      AnswerUserDesiredQuestion();
      ReSetColorListItems();
    }
  }

  void printColorQuestions() {
    print("\nPress Enter after typing the Question Number To check my answer:" +
        "\n0- End/Close Application!" +
        "\n1- check if we have the color white inside our list" +
        "\n2- add the color Rose between pink and gray" +
        "\n3- remove the ligt green from our list and print the index that it was in \$index" +
        "\n4- add the following items inside one item {cayan - indigo- deeppurple -brown} after the lime" +
        "\n5- print the place of darkbrown " +
        "\n6- check if we have redAccent in our list and if no just add it to the last index " +
        "\n7- update the value of teal to be dark teal " +
        "\n8- print the list before and after the clear " +
        "\n9- print the items in reversed way " +
        "\n10 - remove the last item in your list and let me see the result " +
        "\n11- there is a method called removeRange please figure what it suppose to do and print for me a text " +
        "\n");
  }

  int ReadUserColorQuestionsNumberInput() {
    try {
      int _userQuestionNumberInput = int.parse(stdin.readLineSync()!);
      return _userQuestionNumberInput;
    } catch (exception) {
      print("Error! make sure to enter an Integer Only. -Error Msg: " +
          exception.toString());
      return ReadUserColorQuestionsNumberInput();
    }
  }

  void AnswerUserDesiredQuestion() {
    print("\n");

    switch (_userQuestionNumberInput) {
      case 0: // 0 - Closing the Application.
        {
          print("Application will Close!\nGood Bye.");
          exit(0);
        }

      case 1: // 1- check if we have the color white inside our list
        {
          Q1("white");
          PrintList();
          break;
        }

      case 2: // 2- add the color Rose between pink and gray
        {
          printListBefore();
          Q2("pink", "Rose");
          printListAfter();
          break;
        }

      case 3: // 3- remove the light green from our list and print the index that it was in ("  $index")
        {
          printListBefore();
          Q3("ligt green");
          printListAfter();
          break;
        }

      case 4: // 4- add the following items inside one item {cayan - indigo- deeppurple -brown} after the lime
        {
          printListBefore();
          Q4("lime", (["cayan", "indigo", "deeppurple", "brown"]));
          printListAfter();
          break;
        }

      case 5: // 5 - print the place of darkbrown
        {
          Q5("darkbrown");
          break;
        }

      case 6: // 6- check if we have redAccent in our list and if no just add it to the last index
        {
          printListBefore();
          Q6("redAccent");
          printListAfter();
          break;
        }

      case 7: // 7- update the value of teal to be dark teal
        {
          printListBefore();
          Q7_UsingLamdba("teal", "dark teal");
          printListAfter();
          break;
        }

      case 8: // 8 - print the list before and after the clear
        {
          printListBefore();
          Q8();
          printListAfter();
          break;
        }

      case 9: // 9- print the items in reversed way
        {
          printListBefore();
          Q9();
          break;
        }

      case 10: // 10 - remove the last item in your list and let me see the result
        {
          printListBefore();
          Q10();
          printListAfter();
          break;
        }

      /**
         * 11- there is a method called removeRange please figure what it suppose to do and print for me the follow
         * "i have found that the method of removeRange do the following and here is my output ${your output} below."
         */
      case 11:
        {
          printListBefore();
          Q11(1, 4);
          printListAfter();
          break;
        }

      default:
        {
          print("Error! Insert the Question Number Only.");
        }

        print("\n");
    }
  }

  // checks if we have the colorName inside our list
  void Q1(String colorName) {
    DoesThisListContainsThisColor(colorName);
  }

  void DoesThisListContainsThisColor(String colorName) {
    bool doesContains = IsColorInList(colorName);
    DoesContainsMessage(doesContains);
  }

  bool IsColorInList(String colorName) {
    Iterator ColorIterator = _colorsList.iterator;
    while (ColorIterator.moveNext()) {
      String currentColorIterator = ColorIterator.current.toString();
      if (DoesContains(currentColorIterator, colorName)) {
        return true;
      }
    }
    return false;
  }

  bool IsColorInList_WithLambda(String colorName) {
    bool isContain =
        _colorsList.any((element) => element.toString() == colorName);
    return isContain;
  }

  bool DoesContains(String wholeString, String subString) {
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
// adds a color between two Colors
  void Q2(String theLeftColorName, String theRightColorName) {
    InsertColorBetweenTwoSpecificColors(theLeftColorName, theRightColorName);
  }

  void InsertColorBetweenTwoSpecificColors(
      String theLeftColorName, String theRightColorName) {
    AddElementAfterIndex(theLeftColorName, theRightColorName);
  }

  void printListBefore() {
    print("Before: " + GetColorsList().toString());
  }

  void printListAfter() {
    print("After : " + GetColorsList().toString());
  }

  void AddElementAfterIndex(String theLeftColorName, String theRightColorName) {
    int indexPosition = _colorsList.indexOf(theLeftColorName);
    _colorsList.insert(indexPosition + 1, theRightColorName);
  }

// ToDo: make this better; by a better & simpler Iteration.
// prints the color index in a List, removes it next
  void Q3(String Color) {
    RemoveColorByName(Color);
  }

  void RemoveColorByName(String color) {
    bool isColorInList = IsColorInList(color);
    List index = [_NOT_FOUND];

    if (isColorInList) {
      try {
        _RemoveColor_ListOfListOnly(color);
      } catch (exception) {
        _RemoveColor_ListOnly(color);
      }
    }

    _PrintRemoveColorMessage(color, isColorInList, _tempIndex);
  }

  void _RemoveColor_ListOfListOnly(String color) {
    _tempIndex = GetIndexByString_WithinListOfList(color);
    _RemoveColorListOfListByIndex_WithOutCheck(_tempIndex);
  }

  void _RemoveColor_ListOnly(String color) {
    _tempIndex = GetIndexByString(color);
    _RemoveColorByName_WithOutCheck(color);
  }

  List GetIndexByString(String color) {
    List index = [_colorsList.indexWhere((element) => element == color)];
    return index;
  }

  List GetIndexByString_WithinListOfList(String color) {
    List indexs = [_NOT_FOUND, _NOT_FOUND];
    for (var i = 0; i < _colorsList.length; i++) {
      for (var j = 0; j < _colorsList[i].length; j++) {
        if (_colorsList[i][j] == color) {
          return indexs = [i, j];
        }
      }
    }
    return indexs;
  }

  void _RemoveColorByName_WithOutCheck(String colorName) {
    _colorsList.remove(colorName);
  }

  void _RemoveColorListOfListByIndex_WithOutCheck(List colorIndex) {
    _colorsList[colorIndex[_FIRST_LIST]].removeAt(colorIndex[_SECOND_LIST]);
  }

  void _PrintRemoveColorMessage(String Color, bool isColorInList, List index) {
    if (isColorInList)
      print(
          "Element name: ${Color}, at Index: ${index}, has been successfully Removed.");
    else
      print(
          "Error! this ${Color} is NOT in This List. RemovingColor_Function has been Aborted.");
  }

  // adds a list inside a list, the posision of the new list should be after a specific given element/index
  void Q4(String specificColor, List newlist) {
    AddList_AfterSpecificColor(specificColor, newlist);
  }

  void AddList_AfterSpecificColor(String specificColor, List newList) {
    int indexOfSpecificColor = GetIndexByString(specificColor)[_FIRST_ELEMENT];
    _colorsList.insert(indexOfSpecificColor + 1, newList);
  }

// prints the index of a given color
  void Q5(String color) {
    PrintColorIndex(color);
  }

  void PrintColorIndex(String color) {
    print(GetIndexByString(color));
  }

  void Q6(String color) {
    AddColor_IfNotExistInList(color);
  }

  void AddColor_IfNotExistInList(String color) {
    bool isColorInList = IsColorInList(color);
    DoesContainsMessage(isColorInList);

    if (!isColorInList) {
      _colorsList.add(color);
      print("\n${color} has been added successfully.\n");
    } else
      print(
          "\n${color} already Exists in the List. AddingColor_Function has been Aborted.\n");
  }

  void Q7_UsingLamdba(String oldColor, String newColor) {
    ReplaceColor(oldColor, newColor);
  }

  void ReplaceColor(String oldColor, String newColor) {
    try {
      _colorsList[_colorsList
          .indexWhere((element) => element.toString() == oldColor)] = newColor;
    } catch (exception) {
      print("Something Wrong happened! -Error Msg: " + exception.toString());
    }
  }

  void Q8() {
    ClearColorList();
  }

  void ClearColorList() {
    _colorsList.clear();
  }

  void Q9() {
    PrintReversedList();
  }

  void PrintReversedList() {
    ReversList();
    print("Reversed: " + _colorsList.toList().toString());
  }

  void ReversList() {
    _colorsList = _colorsList.reversed.toList();
  }

  void Q10() {
    RemoveLastColor();
  }

  void RemoveLastColor() {
    _colorsList.removeLast();
  }

  void Q11(int start, int end) {
    RemoveRange(start, end);
    print("\nI've found that the removeRange do the following: " +
        "\nRemoves the elements with positions greater than or equal to [start] and less than [end], from the list. This reduces the list's length by end - start." +
        "\nand here is my output for list.removeRange(${start}, ${end}); down below.");
  }

  void RemoveRange(int start, int end) {
    _colorsList.removeRange(start, end);
  }

  void ReSetColorListItems() {
    SetDefaultColors();
  }
}
