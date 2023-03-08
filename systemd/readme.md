# How to create a Systemd service in Linux
#### https://www.shubhamdipt.com/blog/how-to-create-a-systemd-service-in-linux/

At times you create a script and then you want to have the scripts controlled by systemd or in some cases you wish to have the scripts getting restarted by itself when it is killed due to some reason. In such cases systemd in Linux helps to configure services which can be managed. To do so follow the following steps.

1- ```cd /etc/systemd/system```

Create a file named your-service.service and include the following:

    [Unit]
    Description=<description about this service>

    [Service]
    User=<user e.g. root>
    WorkingDirectory=<directory_of_script e.g. /root>
    ExecStart=<script which needs to be executed>
    Restart=always

    [Install]
    WantedBy=multi-user.target
 
For Python specific projects which include virtual environment:


    [Unit]
    Description=<project description>

    [Service]
    User=<user e.g. root>
    WorkingDirectory=<path to your project directory containing your python script>
    ExecStart=/home/user/.virtualenv/bin/python main.py
    Restart=always
    # replace /home/user/.virtualenv/bin/python with your virtualenv and main.py with your script

    [Install]
    WantedBy=multi-user.target
OR

    [Unit]
    Description=<project description>

    [Service]
    User=<user e.g. root>
    WorkingDirectory=<path to your project directory>
    ExecStart=/bin/bash -c 'cd /home/ubuntu/project/ && source venv/bin/activate && python test.py'

    [Install]
    WantedBy=multi-user.target

 

3 - Reload the service files to include the new service.

```sudo systemctl daemon-reload```

4- Start your service

```sudo systemctl start your-service.service```

5- To check the status of your service

```sudo systemctl status example.service```

6- To enable your service on every reboot

```sudo systemctl enable example.service```

7 - To disable your service on every reboot

```sudo systemctl disable example.service```


That's it !