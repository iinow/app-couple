#/bin/bash

cp -r assets/images/drawable-mdpi/* assets/images/
cp -r assets/images/drawable-mdpi/* assets/images/1.0x/
cp -r assets/images/drawable-hdpi/* assets/images/1.5x/
cp -r assets/images/drawable-xhdpi/* assets/images/2.0x/
cp -r assets/images/drawable-xxhdpi/* assets/images/3.0x/
cp -r assets/images/drawable-xxxhdpi/* assets/images/4.0x/

rm -rf assets/images/drawable*