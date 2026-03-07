class themeStorage {
  getVal();
  void setVal(bool val)
}

getVal() {
  final box = await Hive.openBox<bool>('boxName');
  return box.get('key');
}

void setVal(bool val) {
  final box = await Hive.openBox<bool>('boxName');
  box.put('key', val);
}