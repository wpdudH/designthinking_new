List<String> moveControl = List<String>();

void dataControl(String input, String mode)
// Add input in moveControl, or delete in moveControl
{
  if (mode == 'a') {
    moveControl.add(input);
  }

  if (mode == 'c') {
    moveControl.clear();
  }
}
