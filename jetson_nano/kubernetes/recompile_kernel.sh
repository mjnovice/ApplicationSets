sudo apt-get update
sudo apt-get install -y libncurses5-dev
mkdir -p nano-bsp-sources
wget https://developer.download.nvidia.com/embedded/L4T/r32_Release_v1.0/jetson-nano/BSP/Jetson-Nano-public_sources.tbz2
tar xvf Jetson-Nano-public_sources.tbz2 public_sources/kernel_src.tbz2
mv public_sources/kernel_src.tbz2 ~/
cd
rm -fr ~/nano-bsp-sources/
cd
tar xvf ./kernel_src.tbz2
cd ~/kernel/kernel-4.9
wget https://gist.githubusercontent.com/DieterReuter/a7d07445c9d62b45d9151c22b446c59b/raw/6decc91cc764ec0be8582186a34f60ea83fa89db/kernel.config.fully-container-optimized
cp kernel.config.fully-container-optimized .config
make-kpkg clean
fakeroot make-kpkg --initrd --append-to-version=-custom kernel_image kernel_headers
time make -j5 modules
time make -j5 make modules_install

