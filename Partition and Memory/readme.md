### https://www.linuxbabe.com/desktop-linux/how-to-automount-file-systems-on-linux

<div class="single_post_content">
<h1 class="postitle entry-title">How To Automount File Systems on Linux</h1>

<div class="single_metainfo ">

<i class="fa-calendar"></i><a class="comm_date post-date updated">Last Updated: May 1st, 2021</a>

<i class="fa-user"></i><a class="vcard author post-author" href="https://www.linuxbabe.com/author/xiao-guoan"><span class="fn author">Xiao Guoan (Admin)</span></a>

<i class="fa-comments-o"></i><div class="meta_comm"><a href="https://www.linuxbabe.com/desktop-linux/how-to-automount-file-systems-on-linux#comments">36 Comments</a></div>
<i class="fa-th-list"></i><div class="catag_list"><a href="https://www.linuxbabe.com/category/desktop-linux" rel="category tag">Desktop Linux</a></div>

</div>

<div class="thn_post_wrap">
<p>Today I’m going to show you how to automatically mount a drive at boot time in Linux. My laptop has one SSD and one mechanical drive. I install operating systems on SSD and store files on the mechanical drive. So oftentimes I need to mount the mechanical drive in the file manager manually to access my mp3 and video files. Mounting drive manually is just a waste of time. So I’m going to show you an easy way to automount drive in Linux.</p>
<h2>Step 1: Get the Name, UUID and File System Type</h2>
<p>Open your terminal, run the following command to see the name of your drive, its UUID(Universal Unique Identifier) and file system type.</p>
<pre>sudo blkid</pre>
<img src="https://raw.githubusercontent.com/JasminDreasond/Tiny-Ubuntu-Desktop/main/image/xiao%40debian_-media-xiao-b43e4eea-9796-4ac6-9c48-2bcaa4635373-bison-youtube-linux-OhHeyItsLou_740.webp" alt="sudo blkid command" width="830" height="235">
<p>In the output of this command, the first column is the name of your drives. The second column is the label of the drive (if you set a label for it) and the third column is the UUID of your drives.</p>
<p>First, you need to know the name of the drive that is going to be automatically mounted. For example, the name of the drive that is going to be automatically mounted on my computer is <code>/dev/sdb9</code>.</p>
<p>Then you need to know its UUID and file system type. As you can see the UUID of <code>/dev/sdb9</code> is <code><em>eb67c479-962f-4bcc-b3fe-cefaf908f01e</em></code> and the file system of /dev/sdb9 is <code><em>ext4</em></code> which is the standard file system in Linux.</p>
<h2>Step 2: Make a Mount Point For Your Drive</h2>
<p>We are going to make a mount point under /mnt directory. Enter the following command,</p>
<pre>sudo mkdir /mnt/&lt;name-of-the-drive&gt;</pre>
<p>For example, I issued the following command:</p>
<pre>sudo mkdir /mnt/sdb9</pre>
<h2>Step 3: Edit /etc/fstab File</h2>
<p>Run the following command to edit the <code>/etc/fstab</code> file. Nano is a command-line editor on Linux.</p>
<pre>sudo nano /etc/fstab</pre>
<p>We need to append one line of code at the end of the file. The format of this line of code is as follows:</p>
<pre>UUID=&lt;uuid-of-your-drive&gt;  &lt;mount-point&gt;  &lt;file-system-type&gt;  &lt;mount-option&gt;  &lt;dump&gt;  &lt;pass&gt;</pre>
<p>Note that you need to separate these items with Tab key. For example, I added the following line to the end of <code>/etc/fstab</code>.</p>
<pre>UUID=eb67c479-962f-4bcc-b3fe-cefaf908f01e  /mnt/sdb9  ext4  defaults  0  2</pre>
<img src="https://raw.githubusercontent.com/JasminDreasond/Tiny-Ubuntu-Desktop/main/image/Selection_741.webp">
<p>If you want to automount an <strong>NTFS</strong> file system, here is an example.</p>
<pre>UUID=&lt;uuid-of-ntfs-file-system&gt;&nbsp;  /mnt/ntfs&nbsp;   ntfs&nbsp;   defaults   0   2</pre>
<p>If you want to automount a <strong>Btrfs</strong> file system, then change the file system type to btrfs.</p>
<pre>UUID=&lt;uuid-of-btrfs-file-system&gt;&nbsp;  /mnt/btrfs&nbsp;  btrfs&nbsp;  defaults  0   2</pre>
<p>Save and close the file. Then run the following command to see if it works.</p>
<pre>sudo mount -a</pre>
<p>So that’s how you automount a file system in Linux.</p>
<h2>Some Explanation</h2>
<p>For swap partitions, the mount point field should be specified as none.</p>
<p>The <code>defaults</code> mount option will give users read and write access to the file system.</p>
<p>The value of the dump field is usually zero.</p>
<p>The <code>pass</code> field is used by the fsck program to determine the order in which filesystem checks are done at reboot time. As you can see in this file, the value of the pass field for the root file system is 1. Swap partitions do not need to be checked and the value for them is zero. All other file systems should have a value of 2. So I set the <code>pass</code> value to 2 for my drive.</p>
<h2>Can’t Mount Your Disk Drive?</h2>
<p>If you see the “<strong>can’t read superblock</strong>” error when trying to mount your disk drive, please follow the tutorial below to fix this error.</p>
<ul>
<li><a href="https://www.linuxbabe.com/desktop-linux/fix-cant-read-superblock-error" target="_blank" rel="noopener">How to Fix “can’t read superblock” Error on Linux (ext4 &amp; Btrfs)</a></li>
</ul>

</div>
