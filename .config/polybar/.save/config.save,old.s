


;==========================================================
;                   VARIAVEIS                          ====
;==========================================================

[colors]
background = #343148
;#5a000000
background-alt = #ebc687
foreground = #B9C2C2
foreground-alt = #665c54
primary = #C62168
;#BD2B55
secondary = #adbbc3
alert = #5b666c
white = #FFFFFF
black = #726963
branco = #FFFFFF
redbar = #ff5555


; #490c66 #ea1d75 #fcd700 #00bbb3 


;===================================================================================================================================================================================================

[bar/top]
;monitor = ${env:MONITOR:HDMI-1}
width = 100%
height = 27
;offset-x = 1%
;offset-y = 1%
;radius = 6.0
fixed-center = true

background = ${colors.background}
foreground = ${colors.foreground}

line-size = 3
;line-color = #f00

border-top-size = 4
border-top-color = ${colors.background}
border-bottom-size = 0
border-bottom-color = ${colors.primary}

;padding-left = 0
;padding-right = 2

module-margin-left = 0
module-margin-right = 1

font-0 = Cantarell:pixelsize=10;0
font-1 = unifont:size=8:Tewi:fontformat=truetype;0
font-2 = FontAwesome:pixelsize=10;0
font-3 = featherpatched:pixelsize=10;0
font-4 = Powerline Extra Symbols:pixelsize=33;0
font-5 = Wuncon Siji:pixelsize=8;0:antialias=true;0
font-6 = MaterialIcons:size=9;0
font-7 = unifont:pixelsize=9;0
font-8 = Font Awesome 5 Free:pixelsize=10;0
;font-9 = Font Awesome 5 Free Solid:pixelsize=10;0
font-9 = Font Awesome 5 Brands:pixelsize=10;0


modules-left = calendar arrow1 space bspwm 
modules-center = sapce space wallpaper mpd
modules-right = cpu space temperature space battery volume space coretemps space xbacklight space memory memory2 space arrow2 menu-apps

;tray-position = right
;tray-padding = 2
;tray-transparent = true
;tray-background = #0063ff

wm-restack = bspwm
;wm-restack = i3

;override-redirect = true

;scroll-up = bspwm-desknext
;scroll-down = bspwm-deskprev

;scroll-up = i3wm-wsnext
;scroll-down = i3wm-wsprev

cursor-click = pointer
cursor-scroll = ns-resize

;===============================================================================================================================================================================================================

[module/memory2]
type = custom/script
exec = free -m |awk '/^Mem/ {printf("%u%%",100*$3/$2);}'
interval = 2
format =  <label>
format-prefix =
format-foreground = ${colors.white}


[module/coretemps]
type = custom/script
exec-if = sensors
exec = sensors|awk '/Core/{print substr($3, 2, length($3)-5)}'|awk '{if (match($0,/[0-9]+/,m)) print m[0]"°C"}'|tr '\n' ' '
format =  <label>
format-prefix = " "
format-foreground = ${colors.white}
format-prefix-foreground = ${colors.primary}


;==========================================================
;                      DECORAÇÕES                      ====      
;==========================================================

[module/arrow1]
type = custom/text
content = "   "
content-foreground = ${colors.primary}
content-background = ${colors.background}

[module/arrow2]
type = custom/text
content = "  "
content-foreground = ${colors.primary}
content-background = ${colors.background}

[module/space]
type = custom/text
content = "  "
content-foreground = ${colors.background}
content-background = ${colors.background}

[module/menud]
type = custom/text
content = " B301  "
content-background = ${colors.primary}
click-left = ~/.config/polybar/scripts/menu.sh options


#───────────────────────────────────────────
# ────────────────── CPU ────────────────────
#───────────────────────────────────────────
#[module/cpu]
#type = internal/cpu
interval = 0.5
format = <label> <ramp-coreload>
label = 
label-foreground = ${colors.primary}

ramp-coreload-0 = ▁
ramp-coreload-0-font = 2
ramp-coreload-0-foreground = ${colors.white}
ramp-coreload-1 = ▂
ramp-coreload-1-font = 2
ramp-coreload-1-foreground = ${colors.white}
ramp-coreload-2 = ▃
ramp-coreload-2-font = 2
ramp-coreload-2-foreground = ${colors.white}
ramp-coreload-3 = ▄
ramp-coreload-3-font = 2
ramp-coreload-3-foreground = ${colors.white}
ramp-coreload-4 = ▅
ramp-coreload-4-font = 2
ramp-coreload-4-foreground = ${colors.white}
ramp-coreload-5 = ▆
ramp-coreload-5-font = 2
ramp-coreload-5-foreground = ${colors.white}
ramp-coreload-6 = ▇
ramp-coreload-6-font = 2
ramp-coreload-6-foreground = ${colors.white}
ramp-coreload-7 = █
ramp-coreload-7-font = 2
ramp-coreload-7-foreground = ${colors.white}

; ---------------------------------------------------------------------------- ;;
; MEMORY
; ---------------------------------------------------------------------------- ;;

[module/memory]
type = internal/memory
format = <label> <bar-used>
label = 
label-foreground = ${colors.primary}

bar-used-width = 10
bar-used-foreground-0 = ${colors.white}
bar-used-foreground-1 = ${colors.white}
bar-used-foreground-2 = ${colors.white}
bar-used-foreground-3 = ${colors.white}

bar-used-indicator = 
bar-used-indicator-font = 6
bar-used-indicator-foreground = #ff
bar-used-fill = ━
bar-used-fill-font = 6
bar-used-empty = ─
bar-used-empty-font = 6
bar-used-empty-foreground = #444444

; ---------------------------------------------------------------------------- ;;
; VOLUME
; ---------------------------------------------------------------------------- ;;

#───────────────────────────────────────────
# ──────────────── VOLUME ───────────────────
#───────────────────────────────────────────
[module/volume]
type = internal/alsa

format-volume = <ramp-volume> <bar-volume>
master-soundcard = default
speaker-soundcard = default
headphone-soundcard = default
master-mixer = Master
speaker-mixer = Speaker
headphone-mixer = Headphone
headphone-id = 4
mapped = true

ramp-volume-0 = 
ramp-volume-1 = 
ramp-volume-2 = 
format-muted-prefix = " "
format-muted-foreground = ${colors.white}
label-muted = sound muted

ramp-headphones-0 = 
;
ramp-headphones-1 = 
;ramp-headphones-1-fo	reground = ${colors.primary}
;ramp-headphones-0-fo	reground = ${colors.primary}


bar-volume-width = 6
bar-volume-foreground-0 = ${colors.redbar}
bar-volume-foreground-1 = ${colors.redbar}
bar-volume-foreground-2 = ${colors.redbar}
bar-volume-foreground-3 = ${colors.redbar}
bar-volume-foreground-4 = ${colors.redbar}
bar-volume-foreground-5 = ${colors.redbar}
bar-volume-foreground-6 = ${colors.redbar}
bar-volume-gradient = false
bar-volume-indicator = 
bar-volume-indicator-font = 2
bar-volume-fill = ─
bar-volume-fill-font = 2
bar-volume-empty = ─
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground}

; ---------------------------------------------------------------------------- ;;
; XBACKLIGHT
; ---------------------------------------------------------------------------- ;;

[module/xbacklight]
type = internal/xbacklight

format = <label> <bar>
label = 
label-foreground = ${colors.primary}

bar-width = 5
bar-indicator = 
bar-indicator-foreground = ${colors.white}
bar-indicator-font = 2
bar-fill = ─
bar-fill-font = 2
bar-fill-foreground = ${colors.white}
bar-empty = ─
bar-empty-font = 2
bar-empty-foreground = ${colors.white}

[module/backlight-acpi]
inherit = module/xbacklight
type = internal/backlight
card = intel_backlight

; ---------------------------------------------------------------------------- ;;
; WALLPAPER
; ---------------------------------------------------------------------------- ;;

[module/wallpaper]
type = custom/text
content =  
content-foreground = ${colors.primary}
;click-left = ~/.config/polybar/scripts/wallpaper.sh x &
click-left = ~/.config/polybar/scripts/wallpaper.sh dd &
;click-middle = ~/.config/polybar/scripts/wallpaper.sh rr &
click-right = ~/.config/polybar/scripts/wallpaper.sh d &
scroll-up = ~/.config/polybar/scripts/wallpaper.sh p &
scroll-down = ~/.config/polybar/scripts/wallpaper.sh a &
click-middle = scrot %Y-%m-%d-%T.png -e 'mv $f ~/Imagens/Prints/' | notify-send -i ~/.local/share/icons/customer-service.png -u normal -t 9000 'Screenshot taken and saved to ~/Imagens/Prints'

; ---------------------------------------------------------------------------- ;;
; MOONPHASE
; ---------------------------------------------------------------------------- ;;

[module/moonphase]
type = custom/script
interval = 60.0
label-font = 3
exec =  ~/.config/polybar/scripts/moonphase.py
click-left = notify-send -i ~/.config/dunst/icons/moon.svg "Fases Lunares" "$(python2 ~/.config/polybar/scripts/moonphase.py desc)" &
label = %output%
format = <label>
format-foreground = ${colors.foreground}
;format-underline = ${colors.primary}

; ---------------------------------------------------------------------------- ;;
; ROFI
; ---------------------------------------------------------------------------- ;;

[module/rofi]
type = custom/text
content = ""
content-padding = 1
;content-background = ${colors.foreground}
content-foreground = ${colors.primary}
;content-underline = ${colors.primary}
click-left = rofi -show drun -config ~/.config/rofi/relaxDrun.rasi &
click-middle = rofi -show run -config ~/.config/rofi/relax.rasi &
click-right = rofi -show window -config ~/.config/rofi/relaxWindow.rasi &

; ---------------------------------------------------------------------------- ;;
; DZEN2
; ---------------------------------------------------------------------------- ;;

[module/dzen2]
type = custom/text
content = ""
content-padding = 2
content-foreground = ${colors.primary}
click-left =sh ~/Modelos/sysinfo.sh

[module/calendar]
type = custom/script
interval = 1
exec =  date "+%a %H:%M:%S  "
format =  <label>
format-prefix = "  "
format-foreground = ${colors.white}
format-background = ${colors.primary}
format-padding = 0.5
label-padding = 0
;format-underline = ${colors.red}
click-left =  ~/.config/polybar/calendar2.sh &

#───────────────────────────────────────────
# ───────────────── DATE ────────────────────
#───────────────────────────────────────────
[module/date]
type = internal/date
interval = 5

date =
date-alt = %a %d %b %Y

time = %H:%M
time-alt = %H:%M:%S

; format-prefix = 
format-prefix-foreground = ${colors.foreground-alt}
;format-underline = #0a6cf5

label = %{F#665c54}────[%{F-} %{F#83a598}%date%%{F-}%{F#b16286} %time%%{F-} %{F#665c54}]────%{F-}

#───────────────────────────────────────────
# ─────────────── BACKLIGHT ─────────────────
#───────────────────────────────────────────
[module/backlight]
type = internal/backlight
card = intel_backlight
format = <label> <bar>

label = 
label-foreground = ${colors.redbar}

bar-width = 10
bar-indicator = ⭓
bar-indicator-foreground = ${colors.foreground}
bar-indicator-font = 2
bar-fill = ─
bar-fill-font = 2
bar-fill-foreground = ${colors.redbar}
bar-empty = ─
bar-empty-font = 2
bar-empty-foreground = ${colors.foreground}

#───────────────────────────────────────────
# ────────────────── VOL ────────────────────
#───────────────────────────────────────────
[module/vol]
type = custom/script
exec = pactl list sinks | awk '/Volume/{print $12}'
interval = 1
format =  <label>
format-prefix =
;format-underline = ${colors.primary}
format-prefix-foreground = ${colors.primary}


#───────────────────────────────────────────
# ─────────────── CPU ──────────────────
#───────────────────────────────────────────
[module/cpu]
type = custom/script
interval = 1
exec =  ~/.config/polybar/cpu
format =  <label>
format-prefix = " "
format-prefix-foreground = ${colors.primary}


#───────────────────────────────────────────
# ──────────────── UPDATE ───────────────────
#───────────────────────────────────────────
[module/update]
type = custom/script
interval = 10
format = <label>
label = "%output:0:30%"
exec = sh ~/.config/polybar/scripts/update.sh
format-underline = ${colors.primary}



#───────────────────────────────────────────
# ─────────────── MEMORYF ──────────────────
#───────────────────────────────────────────
[module/memoryf]
type = custom/script
exec = free -m |awk '/^Mem/ {printf("%u%%",100*$3/$2);}'
interval = 2
format =  <label>
;format-prefix = " "
format-prefix-foreground = ${colors.primary}
;format-underline = ${colors.primary}
click-left =



#───────────────────────────────────────────
# ──────────────── BSPWM ───────────────────
#───────────────────────────────────────────
[module/bspwm]
type = internal/bspwm
format = <label-state> <label-mode>
reverse-scroll = true

ws-icon-0 = user;
ws-icon-1 = os;
ws-icon-2 = web;
ws-icon-3 = arquivos;
ws-icon-4 = code;
ws-icon-5 = chat;
ws-icon-default = 

label-focused = %icon%
label-focused-background = ${colors.background}
label-focused-foreground =  ${colors.primary}
#label-focused-underline = ${colors.foreground}
label-focused-padding = 3

label-occupied = %icon%
label-occupied-padding = 3
label-occupied-foreground = ${colors.secondary}

label-urgent = %icon%
label-urgent-background = #214754
label-urgent-padding = 3

label-empty = %icon%
label-empty-foreground = ${colors.alert}
label-empty-padding = 3

label-monocle = 
label-monocle-padding = 3 
label-monocle-background = ${colors.primary}
label-monocle-foreground =  ${colors.primary}

#label-floating = 
#label-floating-padding = 2
#label-floating-background = ${colors.background}
#label-floating-foreground =  ${colors.primary}



#───────────────────────────────────────────
# ────────────────── MPD ────────────────────
#───────────────────────────────────────────
[module/mpd]
type = internal/mpd
format-online = <icon-prev> <icon-stop> <toggle> <icon-next> <icon-repeat> <icon-random> <bar-progress>  <label-song> %{B-}
format-stopped = <icon-prev>   <toggle>   <icon-next>   0:00/0:00   %{B-}
format-online-spacing = 0
format-prefix = " "
format-online-padding = 3
format-offline = <label-offline>
format-offline-foreground = #777
label-offline = mpd is off
label-song-maxlen = 40
label-song-ellipsis = true
label-time-foreground =  ${colors.primary}

icon-prev = 
icon-stop = 
icon-play = 
icon-pause = 
icon-next = 

icon-random = 
icon-repeat = 

toggle-on-foreground = ${colors.foreground-alt}
toggle-off-foreground = #777

bar-progress-width = 15
bar-progress-indicator = 
bar-progress-indicator-foreground = ${colors.primary}
bar-progress-indicator-font = 3
bar-progress-fill = ─
bar-progress-fill-foreground = ${colors.primary}
bar-progress-fill-font = 3
bar-progress-empty = ─
bar-progress-empty-foreground = ${colors.primary}
bar-progress-empty-font = 3
bar-progress-format = %{A4:mpdseek+2: A5:mpdseek-2:}%fill%%indicator%%empty%%{A A}



#───────────────────────────────────────────
# ───────────────── WLAN ────────────────────
#───────────────────────────────────────────
[module/wlan]
type = internal/network
interface = wlp2s0
interval = 3.0

format-connected = <ramp-signal> <label-connected>
;format-connected-underline = ${colors.primary}
label-connected = %essid%

;format-disconnected = OFFLINE
format-disconnected = <label-disconnected>
format-disconnected-underline = ${colors.primary}
label-disconnected = %ifname% disconnected
label-disconnected-foreground = ${colors.primary}

ramp-signal-0 = 
ramp-signal-1 = 
ramp-signal-2 = 
ramp-signal-3 = 
ramp-signal-4 = 
ramp-signal-0-foreground = ${colors.primary}
ramp-signal-1-foreground = ${colors.primary}
ramp-signal-2-foreground = ${colors.primary}
ramp-signal-3-foreground = ${colors.primary}
ramp-signal-4-foreground = ${colors.primary}



#───────────────────────────────────────────
# ──────────────── BATTERY ──────────────────
#───────────────────────────────────────────
[module/battery]
type = internal/battery
full-at = 99
battery = BAT0
adapter = ADP1
poll-interval = 1
format-charging = <animation-charging><label-charging>
;format-charging-underline = ${colors.red}
format-discharging = <ramp-capacity><label-discharging>
;format-discharging-underline = ${colors.red}
format-full = <ramp-capacity><label-full>
label-charging = %percentage%%
label-discharging = %percentage%%
label-full = %percentage%%
label-full-foreground = ${colors.white}
label-discharging-foreground = ${colors.white}
label-charging-foreground = ${colors.white}
format-charging-padding = 2
format-discharging-padding = 2
format-ful-padding = 2

ramp-capacity-0 = "  "
ramp-capacity-1 = "  "
ramp-capacity-2 = "  "
ramp-capacity-3 = "  "
ramp-capacity-4 = "  "

animation-charging-0 = " "
animation-charging-1 = " "
animation-charging-2 = " "
animation-charging-3 = " "
animation-charging-4 = " "
animation-charging-framerate = 750

ramp-capacity-0-foreground = ${colors.primary}
ramp-capacity-1-foreground = ${colors.primary}
ramp-capacity-2-foreground = ${colors.primary}
ramp-capacity-3-foreground = ${colors.primary}
ramp-capacity-4-foreground = ${colors.primary}
animation-charging-0-foreground = ${colors.primary}
animation-charging-1-foreground = ${colors.primary}
animation-charging-2-foreground = ${colors.primary}
animation-charging-3-foreground = ${colors.primary}
animation-charging-4-foreground = ${colors.primary}



#───────────────────────────────────────────
# ────────────── TEMPERATURE ────────────────
#───────────────────────────────────────────
[module/temperature]
type = internal/temperature
thermal-zone = 0
warn-temperature = 60

format = <ramp> <label>
;format-underline = #f50a4d
format-warn = <ramp> <label-warn>
;format-warn-underline = ${colors.primary}

label = %temperature-c%
label-foreground = ${colors.white}
label-warn = %temperature-c%
label-warn-foreground = ${colors.primary}

ramp-0 = 
ramp-1 = 
ramp-2 = 
ramp-foreground = ${colors.primary}



#───────────────────────────────────────────
# ──────────────── SETTINGS ──────────────────
#───────────────────────────────────────────
[settings]
screenchange-reload = true
;compositing-background = xor
;compositing-background = screen
;compositing-foreground = source
;compositing-border = over

[global/wm]
margin-top = 2
margin-bottom = 2



#───────────────────────────────────────────
# ─────────────── MENU-APPS ─────────────────
#───────────────────────────────────────────
[module/menu-apps]
type = custom/menu
;expand-right = true
format-spacing = 1
format-background = ${colors.primary}
content-background = ${colors.primary}
expand-right= true
label-open = "   Ghost "
label-open-foreground = ${colors.white}
content-open-foreground = ${colors.primary}
label-open-background = ${colors.primary}
label-close = "  "
label-close-foreground = ${colors.primary}
content-close-background = ${colors.primary}
label-separator = "-"
label-separator-foreground = ${colors.background}

; Top level
menu-0-0 = "  "
menu-0-0-exec = menu-open-1
menu-0-1 = "  "
menu-0-1-exec = menu-open-2
menu-0-2 = "     "
menu-0-2-exec = menu-open-3

; 1
menu-1-0 = "  "
menu-1-0-exec = atom &
menu-1-1 = "  "
menu-1-1-exec = google-chrome-stable &
menu-1-2 = "  "
menu-1-2-exec = nautilus &
menu-1-3 = "   "
menu-1-3-exec = lxappearance &
menu-1-4 = "  "
menu-1-4-exec = puddletag &

; 2
menu-2-0 = "  "
menu-2-0-exec = i3lock-fancy &
menu-2-1 = "   "
menu-2-1-exec = pkill x
menu-2-2 = "   "
menu-2-2-exec = systemctl reboot
menu-2-3 = "   "
menu-2-3-exec = systemctl poweroff
menu-2-4 = "  "
menu-2-4-exec = systemctl suspend

; 3
menu-3-0 = "  "
menu-3-0-exec = Telegram &
menu-3-1 = "  "
menu-3-1-exec = pycharm &
menu-3-2 = "  "
menu-3-2-exec = wireshark &
menu-3-3 = " "
menu-3-3-exec = sh $HOME/.config/polybar/scripts/Dzen2Info.sh &
menu-3-4 = "🌔 "
menu-3-4-exec = notify-send -i ~/.config/dunst/icons/moon.svg "Fases Lunares" "$(python2 ~/.config/polybar/scripts/moonphase.py desc)" &