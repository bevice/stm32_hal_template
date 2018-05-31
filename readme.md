
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
