bool isForward(int oldIndex, int newIndex, int size) =>
    newIndex > oldIndex || (newIndex == 0 && oldIndex == size - 1);
