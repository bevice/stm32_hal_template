
#STM32F103 Project Template

## Переменные среды 

* ARM_TOOLCHAIN_PATH - путь к установленному тулчейну 


## Использование

    git clone --depth 1 git@github.com:bevice/stm32_hal_template.git new_project
    cd new_project 
    git submodule init
    git submodule update
    git remote remove origin
    
    
Или скриптом:
    
    #!/bin/bash
    git clone --depth 1 git@github.com:bevice/stm32_hal_template.git $1
    cd $1
    git remote remove origin
    sed -i '' -e   "s/stm32_hal_template/$1/g" CMakeLists.txt
    git submodule init
    git submodule update
    



## Flashing

### st-link tools
     st-flash --reset write firmware.bin 0x8000000


## OpenOCD

	openocd -f /usr/local/share/openocd/scripts/interface/stlink-v2.cfg -f /usr/local/share/openocd/scripts/target/stm32f1x.cfg 


## GDB script (.gdbinit) для OpenOCD:

	target extended localhost:3333
	monitor reset halt
	load
	monitor reset init


## HAL & LL Manual
here: http://www.st.com/content/ccc/resource/technical/document/user_manual/72/52/cc/53/05/e3/4c/98/DM00154093.pdf/files/DM00154093.pdf/jcr:content/translations/en.DM00154093.pdf
