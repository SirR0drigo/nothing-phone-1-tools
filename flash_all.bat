@echo off
echo nothing phone(1) fastboot flash by @sh4tteredd
echo. 
echo DON'T flash a nothingOS version lower than that one that's currently installed on the phone!
echo.
echo In order to gather all the files that we need, consider to run my other script available on https://github.com/sh4tteredd/nothing-phone-1-tools
echo.
echo Instead, if you already have the .img files, put all your files in a subfolder called 'images' to continue
echo.

::fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *lahaina" || echo This script is only for nothing phone(1)
::fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *lahaina" || exit \B 1

FOR /F "tokens=2 delims=:" %%A IN ('fastboot getvar product 2^>^&1 ^| findstr /R /C:"^product: *lahaina" /C:"^product: *Spacewar"') DO (
  IF NOT "%%A"=="" (
    ECHO This script is only for nothing phone(1)
    EXIT /B 1
  )
)

fastboot -w

fastboot --set-active=a
echo Flashing A slot. Please wait...
fastboot reboot fastboot

fastboot flash abl_a .\images\abl.img

fastboot flash aop_a .\images\aop.img

fastboot flash bluetooth_a .\images\bluetooth.img

fastboot flash boot_a .\images\boot.img

fastboot flash cpucp_a .\images\cpucp.img

fastboot flash devcfg_a .\images\devcfg.img

fastboot flash dsp_a .\images\dsp.img

fastboot flash dtbo_a .\images\dtbo.img

fastboot flash featenabler_a .\images\featenabler.img

fastboot flash hyp_a .\images\hyp.img

fastboot flash imagefv_a .\images\imagefv.img

fastboot flash keymaster_a .\images\keymaster.img

fastboot flash modem_a .\images\modem.img

fastboot flash multiimgoem_a .\images\multiimgoem.img

fastboot flash odm_a .\images\odm.img

fastboot flash product_a .\images\product.img

fastboot flash qupfw_a .\images\qupfw.img

fastboot flash shrm_a .\images\shrm.img

fastboot flash system_a .\images\system.img

fastboot flash system_ext_a .\images\system_ext.img

fastboot flash tz_a .\images\tz.img

fastboot flash uefisecapp_a .\images\uefisecapp.img

fastboot flash vbmeta_a .\images\vbmeta.img

fastboot flash vbmeta_system_a .\images\vbmeta_system.img

fastboot flash vendor_a .\images\vendor.img

fastboot flash vendor_boot_a .\images\vendor_boot.img

fastboot flash xbl_a .\images\xbl.img

fastboot flash xbl_config_a .\images\xbl_config.img

fastboot reboot bootloader

fastboot --set-active=b

echo Flashing B slot. Please wait...

fastboot reboot fastboot

fastboot flash abl_b .\images\abl.img

fastboot flash aop_b .\images\aop.img

fastboot flash bluetooth_b .\images\bluetooth.img

fastboot flash boot_b .\images\boot.img

fastboot flash cpucp_b .\images\cpucp.img

fastboot flash devcfg_b .\images\devcfg.img

fastboot flash dsp_b .\images\dsp.img

fastboot flash dtbo_b .\images\dtbo.img

fastboot flash featenabler_b .\images\featenabler.img

fastboot flash hyp_b .\images\hyp.img

fastboot flash imagefv_b .\images\imagefv.img

fastboot flash keymaster_b .\images\keymaster.img

fastboot flash modem_b .\images\modem.img

fastboot flash multiimgoem_b .\images\multiimgoem.img

fastboot flash odm_b .\images\odm.img

fastboot flash product_b .\images\product.img

fastboot flash qupfw_b .\images\qupfw.img

fastboot flash shrm_b .\images\shrm.img

fastboot flash system_b .\images\system.img

fastboot flash system_ext_b .\images\system_ext.img

fastboot flash tz_b .\images\tz.img

fastboot flash uefisecapp_b .\images\uefisecapp.img

fastboot flash vbmeta_b .\images\vbmeta.img

fastboot flash vbmeta_system_b .\images\vbmeta_system.img

fastboot flash vendor_b .\images\vendor.img

fastboot flash vendor_boot_b .\images\vendor_boot.img

fastboot flash xbl_b .\images\xbl.img

fastboot flash xbl_config_b .\images\xbl_config.img

fastboot reboot bootloader

fastboot --set-active=a

fastboot %* reboot

echo "Your phone(1) is rebooting"

pause
