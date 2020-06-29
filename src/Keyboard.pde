import java.util.Map;
import java.awt.event.KeyEvent; 

static class Keyboard {

  static Map Keys = new HashMap<String, Integer>();
  static Map KeyState = new HashMap<Integer, Boolean>();

  static void loadKeys() {  
    Keys.put("LEFT", LEFT);
    Keys.put("RIGHT", RIGHT);
    Keys.put("UP", UP);
    Keys.put("Down", DOWN);
    Keys.put("SPACE", KeyEvent.VK_SPACE);
    Keys.put("SHIFT", KeyEvent.VK_SHIFT);
    Keys.put("CONTROL", KeyEvent.VK_CONTROL);
    Keys.put("TAB", KeyEvent.VK_TAB);
    Keys.put("ALT", KeyEvent.VK_ALT);
    Keys.put("ENTER", KeyEvent.VK_ENTER);
        
        // all letters
    for (char i='A'; i<'A'+26; i++) {
      Keys.put(String.valueOf(i), (int)i);
    }
  }

  static boolean keyPressed(int key) {
    try {
      return (boolean) KeyState.get(key);
    } 
    catch (NullPointerException e) {
      return false;
    }
  }

  static boolean keyPressed(String key) {
    try {
      return (boolean) KeyState.get(Keys.get(key.toUpperCase()));
    } 
    catch (NullPointerException e) {
      return false;
    }
  }

  static void pressed(int code) {
    try {
      KeyState.put(code, true);
    }
    catch (Exception e) {
      println(e);
    }
  }
  static void released(int code) {
    try {
      KeyState.put(code, false);
    }
    catch (Exception e) {
      println(e);
    }
  }
}
