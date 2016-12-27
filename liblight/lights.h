char const*const RED_LED_FILE 			= "/sys/class/leds/red/brightness";
char const*const GREEN_LED_FILE 		= "/sys/class/leds/green/brightness";
char const*const BLUE_LED_FILE 			= "/sys/class/leds/blue/brightness";

char const*const RED_LED_FILE_TRIGGER	  	= "/sys/class/leds/red/trigger";
char const*const GREEN_LED_FILE_TRIGGER		= "/sys/class/leds/green/trigger";
char const*const BLUE_LED_FILE_TRIGGER		= "/sys/class/leds/blue/trigger";

char const*const RED_LED_FILE_DELAYON		= "/sys/class/leds/red/delay_on";
char const*const GREEN_LED_FILE_DELAYON		= "/sys/class/leds/green/delay_on";
char const*const BLUE_LED_FILE_DELAYON		= "/sys/class/leds/blue/delay_on";

char const*const RED_LED_FILE_DELAYOFF		= "/sys/class/leds/red/delay_off";
char const*const GREEN_LED_FILE_DELAYOFF	= "/sys/class/leds/green/delay_off";
char const*const BLUE_LED_FILE_DELAYOFF		= "/sys/class/leds/blue/delay_off";

char const*const LCD_BACKLIGHT_FILE		= "/sys/class/leds/lcd_backlight0/brightness";

#ifdef BOARD_HAS_BUTTON_BACKLIGHT
char const*const BUTTON_BACKLIGHT_FILE		= "/sys/class/leds/lcd_backlight0/brightness"; //we don't have it
#endif
