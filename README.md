# Misc. tools for Gendex Oralix AC65s control

Schematics is a bit stale- initially it was drawn for Arduino Nano, but couldn't find one, 
so a random ESP32 based module was used instead (which was not a bad idea because WiFi provides
better galvanic isolation than shady circuit wired up on perfboard).


ESP32 firmware is however stable- it was initially tested using 12VAC input to allow safe probing
of signals in order to verify the zero crossing detection and pulse timing accuracy.

Description of Gendex Oralix AC tube: https://nucwiki.org/wiki/index.php/Gendex_Oralix_AC
