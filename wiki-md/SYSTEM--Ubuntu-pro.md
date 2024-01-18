# Ubuntu Pro

[**Ubuntu Pro**](https://ubuntu.com/pricing/pro) is a great service if you have an [Ubuntu One](https://login.ubuntu.com) account already anyway.

![grafik](https://user-images.githubusercontent.com/54933878/226614459-a7c86f96-56dc-4143-8f53-8da933db4adc.png)


## advantages and opinions:

 * 5 free subscriptions for private use --> (*included in [Ubuntu One](https://login.ubuntu.com)*)
 * 10 years support instead of 5 for 'Universe' and 'Main' --> (*personally I'd upgrade LTS nonetheless*)
 * peace of mind
 * easy to set up and manage
 * "Kernel Livepatch" - not required!

**NB.**
> Any of: KVM | Qemu | Boch, VMWare ESXi, LXD | LXC, Xen, Hyper-V (WSL, Multipass), VirtualBox, z/VM, Docker. All Nodes in the cluster have to be subscribed to the service in order to benefit from the unlimited VM support

----

# Alternative

## Unattended upgrades

Ubuntu Unattended Upgrades (UAU) is an automated tool that allows you to manage software updates on your Ubuntu systems without manual intervention. It automatically installs security updates, as well as other updates deemed important by the system administrators or package maintainers. The purpose of UAU is to ensure that your systems are always up-to-date with the latest security patches and bug fixes while minimizing disruption to your work environment.

UAU can be configured to automatically install updates at specific times, such as overnight when system usage is typically low or during off-peak hours. This helps reduce downtime and potential interruptions to your workflow. Additionally, UAU provides a log file that details the status of each update installation, which can be useful for auditing purposes or troubleshooting any issues that may arise during the upgrade process.

See my Wiki for [Unattended upgrades](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/SYSTEM--Unattended_Upgrades.md)

## Disable Ubuntu Pro ads

[How to get rid of Ubuntu Pro advertisement when updating apt?(]https://askubuntu.com/questions/1434512/how-to-get-rid-of-ubuntu-pro-advertisement-when-updating-apt)

Issue command in shell:
```
sudo pro config set apt_news=false
```
