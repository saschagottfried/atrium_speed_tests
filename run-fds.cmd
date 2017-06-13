set OriginalFdsFileName=%1
set MpiServiceInstaller=%2
set MpiProcessLauncher=%3
set FdsMpiExecutable=%4
set FdsInputFile=%5
set WebApiBaseUri=%6
set MpiSelftestExecutable=%7
set OneTokenEndpoint=%8
set SimulationId=%9

set FdsInstallDir=F:\fds\bin
powershell .\initialize-datadisks.ps1
7za.exe e -o%FdsInstallDir% *.zip
%FdsInstallDir%\%MpiServiceInstaller% -install
set OMP_NUM_THREADS=1
start Fireframework.ComputeNode.Agent.exe --mpi-path %FdsInstallDir%\%MpiProcessLauncher% --application-path %FdsInstallDir%\%FdsMpiExecutable% --data-disk F:\ --input-fds-file %CD%\%FdsInputFile% --webapi-baseuri %WebApiBaseUri% --self-test %FdsInstallDir%\%MpiSelftestExecutable% --token-endpoint %OneTokenEndpoint% --simulation-id %SimulationId% --archive-fds-filename %OriginalFdsFileName%
exit 0