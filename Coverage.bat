REM Create a 'GeneratedReports' folder if it does not exist
if not exist "%~dp0GeneratedReports" mkdir "%~dp0GeneratedReports"
 
REM Remove any previous test execution files to prevent issues overwriting
IF EXIST "%~dp0BowlingSPAService.trx" del "%~dp0BowlingSPAService.trx%"
 
REM Remove any previously created test output directories
CD %~dp0
FOR /D /R %%X IN (%USERNAME%*) DO RD /S /Q "%%X"
 
call "$(DevEnvDir)..\Tools\vsvars32.bat"

REM Run the tests against the targeted output
call :RunOpenCoverUnitTestMetrics
 
REM Generate the report output based on the test results
if %errorlevel% equ 0 (
 call :RunReportGeneratorOutput
)
 
REM Launch the report
if %errorlevel% equ 0 (
 call :RunLaunchReport
)
exit /b %errorlevel%
 
:RunOpenCoverUnitTestMetrics
E:\SonarQube\FirstApplication\packages\OpenCover.4.7.922\tools\OpenCover.Console.exe -target:runtests.bat -register:user -filter:"+[*]* -[*.Tests*]* -[*]*.*Config" -output:"%~dp0\GeneratedReports\BowlingSPAServiceReport.xml"
exit /b %errorlevel%
 
:RunReportGeneratorOutput
"E:\SonarQube\FirstApplication\packages\ReportGenerator.4.3.9\tools\net47\ReportGenerator.exe" ^
-reports:"%~dp0\GeneratedReports\BowlingSPAServiceReport.xml" ^
-targetdir:"%~dp0\GeneratedReports\ReportGenerator Output"
exit /b %errorlevel%
:RunLaunchReport
pause
start "report" "%~dp0\GeneratedReports\ReportGenerator Output\index.htm"
exit /b %errorlevel%