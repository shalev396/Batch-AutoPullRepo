@echo off
setlocal enabledelayedexpansion

echo Starting repository update script...
pause

REM Store the current directory
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%" || (
    echo Failed to change to script directory
    pause
    exit /b 1
)

REM Define repository URLs
set "IITC_REPO=https://github.com/shalev396/iitc.git"
set "FLEEMARKET_REPO=https://github.com/shalev396/Android-project-Fleemarket.git"
set "KOMEZZ_REPO=https://github.com/shalev396/Android-project-komezz.git"
set "APITESTING_REPO=https://github.com/shalev396/ApiTesting.git"
set "AUTOPULLREPO_REPO=https://github.com/shalev396/Batch-AutoPullRepo.git"
set "BOOKSAPI_REPO=https://github.com/shalev396/BooksAPI.git"
set "BUSINESS_FINDER_REPO=https://github.com/shalev396/Business-Finder.git"
set "COD_REPO=https://github.com/shalev396/CallOfDutyProject.git"
set "FULLSTACK_REPO=https://github.com/shalev396/First-Full-Stack.git"
set "FITBYCLICK_REPO=https://github.com/shalev396/Fit-by-click.git"
set "FRONTEND_MENTOR_REPO=https://github.com/shalev396/Frontend-Mentor-projects.git"
set "KOMEZZ_MONITOR_REPO=https://github.com/shalev396/Java-project-KomezzFileMonitor.git"
set "LONE_SOLDIER_REPO=https://github.com/shalev396/lone-soldier.git"
set "MOCK_SOCIAL_REPO=https://github.com/shalev396/Mock-Social-Network.git"
set "PASSWORD_PROTECTOR_REPO=https://github.com/shalev396/PasswordProtector.git"
set "RED_ALERTS_REPO=https://github.com/shalev396/red-Alerts.git"
set "SHALEV396_REPO=https://github.com/shalev396/shalev396.git"
set "TMDB_REPO=https://github.com/shalev396/TheMovieDataBase.git"

REM Teacher Files Repository URLs
set "OMER_JS_BASICS_REPO=https://github.com/Omer-Mazig/js-basics-inclass.git"
set "OMER_FULLSTACK_REPO=https://github.com/Omer-Mazig/IITC-Full-Stack-3-in-class-.git"
set "ISRAEL_SQL_NODE_REPO=https://github.com/israelTechCa/SQL_NODE.git"
set "LIRON_TA_REPO=https://github.com/LironeFitoussi/TA-at-IITC.git"

REM Homework Repository URLs
set "API_PLAYGROUND_REPO=https://github.com/Code-with-Lirone/api-playground-exercies-shalev396.git"
set "ATM_TASK_REPO=https://github.com/Code-with-Lirone/atm-task-shalev396.git"
set "BASIC_NODE_REPO=https://github.com/Code-with-Lirone/basic-node-js-shalev396.git"
set "BIG_API_REPO=https://github.com/Code-with-Lirone/big-api-project-shalev396.git"
set "FAQ_ACCORDION_REPO=https://github.com/Code-with-Lirone/frontend-mentor-faq-accordion-shalev396.git"
set "RATING_COMPONENT_REPO=https://github.com/Code-with-Lirone/frontend-mentor-interactive-rating-component-shalev396.git"
set "POKEMON_REACT_REPO=https://github.com/Code-with-Lirone/pokemons-react-project-shalev396.git"
set "SOCIAL_NETWORK_FS_REPO=https://github.com/Code-with-Lirone/social-network-fs-project-shalev-sasha-and-ron-instagram-mock.git"
set "SUKKOT_REPO=https://github.com/Code-with-Lirone/sukkot-assignment-shalev396.git"

REM Skip over the function definition
goto :main

REM Function to handle repository update or clone
:UpdateRepo
if "%~1"=="" goto :EOF
set "FULL_PATH=%~1"
set "PARENT_PATH=%~2"
set "REPO_URL=%~3"

echo.
echo Working with:
echo Full path: %FULL_PATH%
echo Parent path: %PARENT_PATH%
echo Repo URL: %REPO_URL%
echo.

if exist "%FULL_PATH%" (
    echo Repository exists, pulling updates...
    cd /d "%FULL_PATH%" || (
        echo Failed to change to %FULL_PATH%
        pause
        goto :next
    )
    git pull || (
        echo Git pull failed
        pause
        goto :next
    )
) else (
    echo Repository doesn't exist, preparing to clone...
    
    REM Create Projects directory if it doesn't exist
    if not exist "C:\Projects" (
        echo Creating C:\Projects directory...
        mkdir "C:\Projects" || (
            echo Failed to create Projects directory
            pause
            goto :next
        )
    )
    
    REM Create parent directory if needed
    if not exist "%PARENT_PATH%" (
        echo Creating directory: %PARENT_PATH%
        mkdir "%PARENT_PATH%" || (
            echo Failed to create parent directory
            pause
            goto :next
        )
    )
    
    REM Get the repository name from the full path
    for %%I in ("%FULL_PATH%") do set "REPO_NAME=%%~nxI"
    
    echo Cloning %REPO_URL% into %PARENT_PATH%\%REPO_NAME%
    cd /d "%PARENT_PATH%" || (
        echo Failed to change to parent directory
        pause
        goto :next
    )
    git clone "%REPO_URL%" "%REPO_NAME%" || (
        echo Git clone failed
        pause
        goto :next
    )
)

:next
cd /d "%SCRIPT_DIR%"
goto :EOF

:main
REM Main script starts here

REM IITC
call :UpdateRepo "C:\Iitc" "C:\" "%IITC_REPO%"

REM My Projects
call :UpdateRepo "C:\Projects\Android-project-Fleemarket" "C:\Projects" "%FLEEMARKET_REPO%"
call :UpdateRepo "C:\Projects\Android-project-komezz" "C:\Projects" "%KOMEZZ_REPO%"
call :UpdateRepo "C:\Projects\ApiTesting" "C:\Projects" "%APITESTING_REPO%"
call :UpdateRepo "C:\Projects\Batch-AutoPullRepo" "C:\Projects" "%AUTOPULLREPO_REPO%"
call :UpdateRepo "C:\Projects\BooksAPI" "C:\Projects" "%BOOKSAPI_REPO%"
call :UpdateRepo "C:\Projects\Business-Finder" "C:\Projects" "%BUSINESS_FINDER_REPO%"
call :UpdateRepo "C:\Projects\CallOfDutyProject" "C:\Projects" "%COD_REPO%"
call :UpdateRepo "C:\Projects\First-Full-Stack" "C:\Projects" "%FULLSTACK_REPO%"
call :UpdateRepo "C:\Projects\Fit-by-click" "C:\Projects" "%FITBYCLICK_REPO%"
call :UpdateRepo "C:\Projects\Frontend-Mentor-projects" "C:\Projects" "%FRONTEND_MENTOR_REPO%"
call :UpdateRepo "C:\Projects\Java-project-KomezzFileMonitor" "C:\Projects" "%KOMEZZ_MONITOR_REPO%"
call :UpdateRepo "C:\Projects\lone-soldier" "C:\Projects" "%LONE_SOLDIER_REPO%"
call :UpdateRepo "C:\Projects\Mock-Social-Network" "C:\Projects" "%MOCK_SOCIAL_REPO%"
call :UpdateRepo "C:\Projects\PasswordProtector" "C:\Projects" "%PASSWORD_PROTECTOR_REPO%"
call :UpdateRepo "C:\Projects\red-Alerts" "C:\Projects" "%RED_ALERTS_REPO%"
call :UpdateRepo "C:\Projects\shalev396" "C:\Projects" "%SHALEV396_REPO%"
call :UpdateRepo "C:\Projects\TheMovieDataBase" "C:\Projects" "%TMDB_REPO%"

REM Teacher Files
call :UpdateRepo "C:\Iitc Techers Files\Omer\js-basics-inclass" "C:\Iitc Techers Files\Omer" "%OMER_JS_BASICS_REPO%"
call :UpdateRepo "C:\Iitc Techers Files\Omer\IITC-Full-Stack-3-in-class-" "C:\Iitc Techers Files\Omer" "%OMER_FULLSTACK_REPO%"
call :UpdateRepo "C:\Iitc Techers Files\Israel\SQL_NODE" "C:\Iitc Techers Files\Israel" "%ISRAEL_SQL_NODE_REPO%"
call :UpdateRepo "C:\Iitc Techers Files\Liron\TA-at-IITC" "C:\Iitc Techers Files\Liron" "%LIRON_TA_REPO%"

REM Homework
call :UpdateRepo "C:\Projects\HomeWork-Small-Projects\api-playground-exercies-shalev396" "C:\Projects\HomeWork-Small-Projects" "%API_PLAYGROUND_REPO%"
call :UpdateRepo "C:\Projects\HomeWork-Small-Projects\atm-task-shalev396" "C:\Projects\HomeWork-Small-Projects" "%ATM_TASK_REPO%"
call :UpdateRepo "C:\Projects\HomeWork-Small-Projects\basic-node-js-shalev396" "C:\Projects\HomeWork-Small-Projects" "%BASIC_NODE_REPO%"
call :UpdateRepo "C:\Projects\HomeWork-Small-Projects\big-api-project-shalev396" "C:\Projects\HomeWork-Small-Projects" "%BIG_API_REPO%"
call :UpdateRepo "C:\Projects\HomeWork-Small-Projects\frontend-mentor-faq-accordion-shalev396" "C:\Projects\HomeWork-Small-Projects" "%FAQ_ACCORDION_REPO%"
call :UpdateRepo "C:\Projects\HomeWork-Small-Projects\frontend-mentor-interactive-rating-component-shalev396" "C:\Projects\HomeWork-Small-Projects" "%RATING_COMPONENT_REPO%"
call :UpdateRepo "C:\Projects\HomeWork-Small-Projects\pokemons-react-project-shalev396" "C:\Projects\HomeWork-Small-Projects" "%POKEMON_REACT_REPO%"
call :UpdateRepo "C:\Projects\HomeWork-Small-Projects\social-network-fs-project-shalev-sasha-and-ron-instagram-mock" "C:\Projects\HomeWork-Small-Projects" "%SOCIAL_NETWORK_FS_REPO%"
call :UpdateRepo "C:\Projects\HomeWork-Small-Projects\sukkot-assignment-shalev396" "C:\Projects\HomeWork-Small-Projects" "%SUKKOT_REPO%"

echo.
echo ========================================
echo All repository operations completed.
echo Press any key to see the summary...
echo ========================================
echo.
pause

REM Display a summary of what was done
echo.
echo Repository Update Summary:
echo ========================================
for %%i in (
    "C:\Iitc"
    "C:\Projects\Android-project-Fleemarket"
    "C:\Projects\Android-project-komezz"
    "C:\Projects\ApiTesting"
    "C:\Projects\Batch-AutoPullRepo"
    "C:\Projects\BooksAPI"
    "C:\Projects\Business-Finder"
    "C:\Projects\CallOfDutyProject"
    "C:\Projects\First-Full-Stack"
    "C:\Projects\Fit-by-click"
    "C:\Projects\Frontend-Mentor-projects"
    "C:\Projects\Java-project-KomezzFileMonitor"
    "C:\Projects\lone-soldier"
    "C:\Projects\Mock-Social-Network"
    "C:\Projects\PasswordProtector"
    "C:\Projects\red-Alerts"
    "C:\Projects\shalev396"
    "C:\Projects\TheMovieDataBase"
    "C:\Iitc Techers Files\Omer\js-basics-inclass"
    "C:\Iitc Techers Files\Omer\IITC-Full-Stack-3-in-class-"
    "C:\Iitc Techers Files\Israel\SQL_NODE"
    "C:\Iitc Techers Files\Liron\TA-at-IITC"
    "C:\Projects\HomeWork-Small-Projects\api-playground-exercies-shalev396"
    "C:\Projects\HomeWork-Small-Projects\atm-task-shalev396"
    "C:\Projects\HomeWork-Small-Projects\basic-node-js-shalev396"
    "C:\Projects\HomeWork-Small-Projects\big-api-project-shalev396"
    "C:\Projects\HomeWork-Small-Projects\frontend-mentor-faq-accordion-shalev396"
    "C:\Projects\HomeWork-Small-Projects\frontend-mentor-interactive-rating-component-shalev396"
    "C:\Projects\HomeWork-Small-Projects\pokemons-react-project-shalev396"
    "C:\Projects\HomeWork-Small-Projects\social-network-fs-project-shalev-sasha-and-ron-instagram-mock"
    "C:\Projects\HomeWork-Small-Projects\sukkot-assignment-shalev396"
) do (
    if exist "%%~i" (
        echo [EXISTS] %%~i
    ) else (
        echo [MISSING] %%~i
    )
)
echo ========================================
echo.
echo Script completed. Press any key to exit...
pause > nul
exit /b 0