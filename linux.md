![image](https://github.com/jafeeye/PC_InstallList/assets/60909823/7be91399-46c8-43e3-94df-5cbebb63355b)* Eddy
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
```
類：Gdebi、Synaptic
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
  ```
  類：LanDrop
  ```
* OnlyOffice Desktop
* WPS Office
* Nemo
  ```
  類：Caja
  ```
* Nero Linux
* Barrier
* Chrome
* GParted
* Gscan2pdf
* 
* Brave
* GIMP、PhotoGIMP
* Audacity
* Anki
* XnConvert
* Motrix
* Nero Linux
* Inkscape
* Poedit
* Peek
* Crossover/PlayOnLinux/Wine/Winetrick/
* VLC､Clapper､
* Scribus
* Pandoc
* PowerISO for Linux
* ImageMagick
* LibreOffice
* VirtualBox､GNOME Boxes､Vmware
* Ulauncher

```
sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install ulauncher
```

