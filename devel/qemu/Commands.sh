qemu-system-x86_64 -s -m 8192 -kernel ./arch/x86/boot/bzImage -initrd /home/xiayanwen/kernel/debug/initramfs-busybox-x64.cpio.gz -append "console=ttyS0 root=/dev/ram0 init=/init" -nographic
