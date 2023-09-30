* Eddy
```
git clone https://github.com/donadigo/eddy.git
sudo apt install valac libgranite-dev libpackagekit-glib2-dev libunity-dev meson ninja-build libzeitgeist-2.0-dev gettext 
cd eddy 
meson build && cd build 
meson configure -Dprefix=/usr 
ninja 
sudo ninja install 
com.github.donadigo.eddy 
```
* Pop!_Shop
```
git clone https://github.com/pop-os/repoman.git
cd repoman
sudo python3 setup.py install
sudo apt-get install gettext libappstream-dev libflatpak-dev libgee-0.8-dev libgranite-dev libgtk-3-dev libhandy-1-dev libjson-glib-dev libpackagekit-glib2-dev libpolkit-gobject-1-dev libsoup2.4-dev libxml2-dev libxml2-utils meson valac
git clone https://github.com/pop-os/shop.git
cd shop/
meson build --prefix=/usr
cd build
ninja
sudo ninja install
io.elementary.appcenter
```
* VSCode
```
安裝插件：Chinese Translation、Markdown All in One、Paste Image
```
* LocalSend
* OnlyOffice Desktop
* WPS Office
* Nemo
  ```
  類：Caja
  ```
* Nero Linux
* Barrier
* Chrome
* Brave
* GIMP
* Audacity
* Anki
* XnConvert
* Motrix
* Inkscape
* Poedit
* Peek
* Crossover/PlayOnLinux/Wine/Winetrick/
* VLC､Clapper､
* Scribus
* Synaptic
* ImageMagick
* VirtualBox､GNOME Boxes､Vmware
* Ulauncher

```
sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install ulauncher
```

