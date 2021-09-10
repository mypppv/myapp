::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcBaNM3+GIrAP4/z0/9bW8B4hUOwsNozU1LLu
::fBE1pAF6MU+EWHreyHcjLQlHcBaNM3+GIrAP4/z0/9bW8B4hUfY3R4Ha17HAI+8d7CU=
::fBE1pAF6MU+EWHreyHcjLQlHcBaNM3+GIrAP4/z0/9bW8B4hU+MrfZjaw/qNL+4Vig==
::fBE1pAF6MU+EWHreyHcjLQlHcBaNM3+GIrAP4/z0/9bW8B4hXfJxe4DV3NQ=
::fBE1pAF6MU+EWHreyHcjLQlHcBaNM3+GIrAP4/z0/9bW8B4hWeMsc8HY1bqIQA==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAlbQxC+GGS5E7gZ5vzo0+OKo0oYR6w2e4C7
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJheUk0
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJFeB4FE1PCfcq84H1qMyyGubNSZ8MhsCT4xV3R7f8Ek6XXpPpxD1b7Qc82vOX4Oq0YUJFB44
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
set /P ip_addr=<ip.conf
set /P gateway_addr=<gateway.conf
set /P dns_addr=<dns.conf
set /P eth_name=<eth_name.conf
set /P mask=<mask.conf
ipconfig | findstr %gateway_addr%
if %errorlevel% NEQ 1 GOTO set_ip_dhcp
:set_ip_static_addr
netsh interface ip set address %eth_name% static %ip_addr% %mask% %gateway_addr%
netsh interface ip set dns %eth_name% static %dns_addr%
cls
echo "设置了VPN，本地VPN网关是:%gateway_addr%"
pause
exit
:set_ip_dhcp
netsh interface ip set address %eth_name%  dhcp
netsh interface ip set dns name=%eth_name% source=dhcp
cls

echo "取消了VPN"
pause
exit