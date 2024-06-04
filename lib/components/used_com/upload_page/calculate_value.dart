double cellIntToDouble(List<dynamic> list, int index) {
  // Check if the index is within the range of the list
  if (index < 0 || index >= list.length) {
    throw ArgumentError('Index out of bounds');
  }
  
  // Attempt to parse the element at the given index to a double
  try {
    return double.parse(list[index].toString());
  } on FormatException {
    throw const FormatException('The value at the given index cannot be converted to a double');
  }
}

int toInt(List<dynamic> list, int index) {
  // Check if the index is within the range of the list
  if (index < 0 || index >= list.length) {
    throw ArgumentError('Index out of bounds');
  }
  
  // Attempt to parse the element at the given index to an integer
  try {
    return int.parse(list[index].toString());
  } on FormatException {
    throw const FormatException('The value at the given index cannot be converted to an integer');
  }
}

DateTime? toDate(List<dynamic> list, int index) {
  // Check if the index is within the range of the list
  if (index < 0 || index >= list.length) {
    print('Index out of bounds');
    return null; // Returning null for an out-of-bounds index
  }
  
  // Attempt to parse the element at the given index to a DateTime
  try {
    // Assuming the date is in a standard format, e.g., "YYYY-MM-DD"
    return DateTime.parse(list[index].toString());
  } catch (e) {
    print('Error parsing date: ${e.toString()}');
    return null; // Returning null if parsing fails
  }
}