
#STM32F103 Project Template

## Переменные среды 

* ARM_TOOLCHAIN_PATH - путь к установленному тулчейну 

## Flashing

### st-link tools
     st-flash --reset write firmware.bin 0x8000000


## OpenOCD

	openocd -f /usr/local/share/openocd/scripts/interface/stlink-v2.cfg -f /usr/local/share/openocd/scripts/target/stm32f1x.cfg 


## GDB script (.gdbinit):

	target extended localhost:3333
	monitor reset halt
	load
	monitor reset init


## HAL & LL Manual
here: http://www.st.com/content/ccc/resource/technical/document/user_manual/72/52/cc/53/05/e3/4c/98/DM00154093.pdf/files/DM00154093.pdf/jcr:content/translations/en.DM00154093.pdf