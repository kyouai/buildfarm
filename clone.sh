# PREPARE
sudo apt update
git config --global user.name "kyouai"
git config --global user.email "tanparumus@gmail.com"
sudo apt install -y liblz4-dev openjdk-8-jdk android-tools-adb bc bison build-essential curl flex g++-multilib gcc-multilib gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc yasm zip zlib1g-dev ccache
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
export PATH="$HOME/bin:$PATH"

# CLONE
mkdir aex
cd aex
repo init --depth=1 -u git://github.com/AospExtended/manifest.git -b 9.x
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
git clone https://github.com/wulan17/android_device_xiaomi_cactus.git -b android-9.0 device/xiaomi/cactus
git clone https://github.com/wulan17/android_device_xiaomi_cereus.git -b android-9.0 device/xiaomi/cereus
git clone https://github.com/wulan17/android_device_xiaomi_mt6765-common.git -b android-9.0 device/xiaomi/mt6765-common
git clone https://github.com/wulan17/android_kernel_xiaomi_mt6765.git -b pie --depth=1 kernel/xiaomi/mt6765
git clone https://github.com/xiaomi-mt6765/proprietary_vendor_xiaomi.git -b lineage-16.0 vendor/xiaomi

cat > device/xiaomi/mt6765-common/vendorsetup.sh << EOF
add_lunch_combo aosp_cactus-userdebug
add_lunch_combo aosp_cereus-userdebug
EOF

echo "Done"
