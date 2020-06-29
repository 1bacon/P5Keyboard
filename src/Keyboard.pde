import java.util.Map;
import java.awt.event.KeyEvent; 

static class Keyboard {

  static Map Keys = new HashMap<String, Integer>();       //HashMap for Relation between names such as "LEFT" and their respective KeyCodes
  static Map KeyState = new HashMap<Integer, Boolean>();  //HashMap for the States of the Keys


  //Adds all the Keys to the Map
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
        
        //Add all letters
    for (char i='A'; i<'A'+26; i++) {
      Keys.put(String.valueOf(i), (int)i);
    }
  }
  
  //Return whether the Key is pressed or not
  static boolean keyPressed(int key) {    
    try {
      return (boolean) KeyState.get(key);
    } 
    catch (NullPointerException e) {
      return false;
    }
  }

  //Return whether the Key is pressed or not after converting the String to the corresponding keyCode
  static boolean keyPressed(String key) {
    try {
      return (boolean) KeyState.get(Keys.get(key.toUpperCase()));
    } 
    catch (NullPointerException e) {
      return false;
    }
  }

  //Updates the Value for the Key that was Pressed
  static void pressed(int code) {
    try {
      KeyState.put(code, true);
    }
    catch (Exception e) {
      println(e);
    }
  }
  
  //Updates the Value for the Key that was Released
  static void released(int code) {
    try {
      KeyState.put(code, false);
    }
    catch (Exception e) {
      println(e);
    }
  }
}
