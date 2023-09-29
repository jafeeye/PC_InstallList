Eddy
git clone [https://github.com/pop-os/repoman.git](https://github.com/donadigo/eddy.git)https://github.com/donadigo/eddy.git
sudo apt install valac libgranite-dev libpackagekit-glib2-dev libunity-dev meson ninja-build libzeitgeist-2.0-dev gettext
cd eddy
meson build && cd build
meson configure -Dprefix=/usr
ninja
sudo ninja install
com.github.donadigo.eddy
