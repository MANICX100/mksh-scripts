rcupdate() {
aria2c -x 16 -d ~/ -o .mkshrc --allow-overwrite=true https://github.com/MANICX100/mksh-scripts/raw/main/mkshrc
. ~/.mkshrc
}
