; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "ScriptCommunicator"
#define MyAppVersion "4.16"
#define MyAppPublisher "Stefan Zieker"
#define MyAppURL "https://sourceforge.net/projects/scriptcommunicator/"
#define MyAppExeName "ScriptCommunicator.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{3FE04724-A52C-4E6B-82AF-DB1616CFD184}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=C:\Users\internet\Desktop\
OutputBaseFilename=ScriptCommunicatorSetup_04_16_windows
SetupIconFile=C:\ScriptCommunicator\ScriptCommunicator_Github\ScriptCommunicator\images\main.ico
Compression=lzma
SolidCompression=yes
PrivilegesRequired=lowest
Uninstallable=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: associate_js_files; Description: "&Associate .js files with the ScriptCommunicator editor"; GroupDescription: "Other tasks:"

[Files]
Source: "C:\Users\internet\Desktop\ScriptCommunicator\ScriptCommunicator.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\internet\Desktop\ScriptCommunicator\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent


[Registry]
Root: HKCU; SubKey: "Software\Classes\.sce"; ValueType: string; ValueData: "ScriptCommunicator"; Flags: uninsdeletekey
Root: HKCU; SubKey: "Software\Classes\.scez"; ValueType: string; ValueData: "ScriptCommunicator"; Flags: uninsdeletekey
Root: HKCU; SubKey: "Software\Classes\.js"; ValueType: string; ValueData: "ScriptCommunicator_ScriptEditor"; Flags: uninsdeletekey; Tasks: associate_js_files

Root: HKCU; SubKey: "Software\Classes\ScriptCommunicator"; ValueType: string; ValueData: "ScriptCommunicator"; Flags: uninsdeletekey
Root: HKCU; SubKey: "Software\Classes\ScriptCommunicator\Shell\Open\Command"; ValueType: string; ValueData: """{app}\ScriptCommunicator.exe"" ""%1"""; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Classes\ScriptCommunicator\DefaultIcon"; ValueType: string; ValueData: "{app}\ScriptCommunicator.exe,0"; Flags: uninsdeletevalue
Root: HKCU; SubKey: "Software\Classes\ScriptCommunicator\Uninstall"; ValueType: string; ValueName: UninstallString; ValueData: "{app}\{uninstallexe}"; Flags: uninsdeletekey
Root: HKCU; SubKey: "Software\Classes\Applications\ScriptCommunicator"; ValueType: string; ValueData: "ScriptCommunicator"; Flags: uninsdeletekey
Root: HKCU; SubKey: "Software\Classes\Applications\ScriptCommunicator\Shell\Open\Command"; ValueType: string; ValueData: """{app}\ScriptCommunicator.exe"" ""%1"""; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Classes\Applications\ScriptCommunicator\DefaultIcon"; ValueType: string; ValueData: "{app}\ScriptCommunicator.exe,0"; Flags: uninsdeletevalue
Root: HKCU; SubKey: "Software\Classes\Applications\ScriptCommunicator\Uninstall"; ValueType: string; ValueName: UninstallString; ValueData: "{app}\{uninstallexe}"; Flags: uninsdeletekey

Root: HKCU; SubKey: "Software\Classes\ScriptCommunicator_ScriptEditor"; ValueType: string; ValueData: "ScriptCommunicator_ScriptEditor"; Flags: uninsdeletekey; Tasks: associate_js_files
Root: HKCU; SubKey: "Software\Classes\ScriptCommunicator_ScriptEditor\Shell\Open\Command"; ValueType: string; ValueData: """{app}\ScriptEditor.exe"" ""%1"""; Flags: uninsdeletekey; Tasks: associate_js_files
Root: HKCU; Subkey: "Software\Classes\ScriptCommunicator_ScriptEditor\DefaultIcon"; ValueType: string; ValueData: "{app}\ScriptEditor.exe,0"; Flags: uninsdeletevalue; Tasks: associate_js_files
Root: HKCU; SubKey: "Software\Classes\Applications\ScriptCommunicator_ScriptEditor"; ValueType: string; ValueData: "ScriptCommunicator_ScriptEditor"; Flags: uninsdeletekey; Tasks: associate_js_files
Root: HKCU; SubKey: "Software\Classes\Applications\ScriptCommunicator_ScriptEditor\Shell\Open\Command"; ValueType: string; ValueData: """{app}\ScriptEditor.exe"" ""%1"""; Flags: uninsdeletekey; Tasks: associate_js_files
Root: HKCU; Subkey: "Software\Classes\Applications\ScriptCommunicator_ScriptEditor\DefaultIcon"; ValueType: string; ValueData: "{app}\ScriptEditor.exe,0"; Flags: uninsdeletevalue; Tasks: associate_js_files


[Code]
function GetUninstallerPath: string;
var
  RegKey: string;
begin
  Result := '';
  RegKey := 'Software\Classes\ScriptCommunicator\Uninstall'
  if(not RegQueryStringValue(HKEY_CURRENT_USER, RegKey, 'UninstallString', Result)) then
  begin
    RegQueryStringValue(HKEY_CURRENT_USER, 'Software\Classes\ScriptCommunicator\Shell\Open\Command', '', Result);    StringChangeEx(Result, ' "%1"', '', True);
    StringChangeEx(Result, 'ScriptCommunicator.exe', 'unins000.exe', True);  end;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
var
  UninstPath: string;
  ResultCode: Integer;  
begin
  Result := '';
  UninstPath := RemoveQuotes(GetUninstallerPath);
  if UninstPath <> '' then
  begin
    Exec(UninstPath, '/SILENT /NORESTART', '', SW_SHOW, ewWaitUntilTerminated, ResultCode)
  end;
end;