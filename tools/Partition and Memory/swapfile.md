# Create Swap File in Linux
### https://www.minextuts.com/how-to-create-swap-file-in-linux-for-increase-memory-ram-size-of-vps/

Hello, in this tutorial, you will learn how to increase the memory of your VPS (Linux virtual machine) or your WordPress site. You can add a swap file for VM instance to increase memory. If you want to know to get free VPS, check the VPS and Mining Playlist of the channel.

Open the terminal of your VPS or WordPress VM instances using an SSH connection.

To see available Memory and swap file size, use this command. You can see there is no swap file.
```shell
free -m
```

Create a swap file and allocate space. I’ve used 1024 MB but you can take more.
```shell
sudo dd if=/dev/zero of=/mnt/swap.0 bs=1024 count=1048576
```

Next use this line to mount it.
```shell
sudo mkswap /mnt/swap.0
```

Switch to root account to activate the swap.
```shell
sudo su
```

Use this to activate it.
```shell
echo "/mnt/swap.0 swap swap defaults 0 0" >> /etc/fstab
```

Next use this command.
```shell
swapon /mnt/swap.0
```

check if it’s created successfully.
```shell
sudo swapon -s
```

Check again the created main and swap size for memory. The swap file is created successfully.
```shell
free -m
```

<hr/>

# Delete Swap File in Linux
### https://askubuntu.com/questions/969296/how-to-delete-a-swap-file-in-ubuntu

The output of free -h indicates that swap is being used - the swap process is still running.

Enter the command

```shell
sudo swapoff /mnt/swap.0
```

This will disable the swapfile, and the file can be deleted at that point.

Please note that if you have created an entry in /etc/fstab for the swapfile, you should also delete it (or comment it out by adding # at the beginning of the line).

```shell
sudo rm /mnt/swap.0
```