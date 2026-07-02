# Run Visual Studio Installer to add C++ Desktop Development workload
$vsInstallerPath = "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vs_installer.exe"
$installPath = "C:\Program Files\Microsoft Visual Studio\2022\Community"

& $vsInstallerPath modify --installPath $installPath --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended --passive
