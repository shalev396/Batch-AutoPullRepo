# Batch AutoPullRepo

## Overview

Batch-AutoPullRepo is a batch script that automates pulling all of your repositories from GitHub. The script can be launched at system startup to ensure your repositories are always up-to-date.

## Features

Automatically pulls updates for all your GitHub repositories.
Runs at startup, ensuring your repositories are always in sync.
Simple and lightweight batch script.
##How to Use
Clone this repository:

```bash
git clone https://github.com/shalev396/Batch-AutoPullRepo.git
```

Open the UpdateRepo.bat file in a text editor.

Replace

```
C: && "cd C:\Iitc" && git.exe pull
```

with the path to the folder where your GitHub repositories are located.

Save the file.

Navigate to the folder where the script is located and run the UpdateRepo.bat file.

Setup for Startup
To automatically run the script at startup:

Copy the UpdateRepo.bat file.
Paste it into the Startup folder in Windows. You can access this folder by typing shell:startup in the Windows Run dialog.

## License

Batch-AutoPullRepo © 2021 by Shalev Ben Moshe is licensed under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International. To view a copy of this license, visit Creative Commons.
