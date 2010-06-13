# Auto-generated by EclipseNSIS Script Wizard
# 4 janv. 2007 16:46:31

Name "Restlet"
SetCompressor lzma

# Defines
!define VERSION "@version-full@"
!define RESTLETREGKEY "SOFTWARE\Restlet Framework"
!define BASEREGKEY "SOFTWARE\Restlet Framework\Edition @edition-medium-label@"
!define REGKEY "SOFTWARE\Restlet Framework\Edition @edition-medium-label@\@version-full@"
!define COMPANY "Noelios Technologies"
!define URL http://www.restlet.org

Caption "Restlet Framework - Edition @edition-medium-label@ - Version @version-full@"
BrandingText " "

# MUI defines
!define MUI_ICON @icons-dir@/favicon.ico
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_STARTMENUPAGE_REGISTRY_ROOT HKLM
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\Restlet Framework\Edition @edition-medium-label@"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME StartMenuGroup
!define MUI_UNICON @icons-dir@/favicon.ico
!define MUI_UNFINISHPAGE_NOAUTOCLOSE
!define MUI_WELCOMEFINISHPAGE_BITMAP_NOSTRETCH
!define MUI_WELCOMEFINISHPAGE_BITMAP @images-dir@\installer.bmp
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP @images-dir@\logo150.bmp
!define MUI_LANGDLL_REGISTRY_ROOT HKLM
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Restlet Framework"

# Included files
!include Sections.nsh
!include MUI.nsh
!include LogicLib.nsh
!include TextFunc.nsh

!insertmacro un.LineFind
!insertmacro un.TrimNewLines

#Include library from Mozilla foundation
!include common.nsh
# Reserved Files

# Variables
Var StartMenuGroup

# Installer pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE @license-dir@/license.txt
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_STARTMENU Application $StartMenuGroup
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

# Installer languages
!insertmacro MUI_LANGUAGE English ;first language is the default language
!insertmacro MUI_LANGUAGE Albanian
!insertmacro MUI_LANGUAGE Arabic
!insertmacro MUI_LANGUAGE Basque
!insertmacro MUI_LANGUAGE Belarusian
!insertmacro MUI_LANGUAGE Bosnian
!insertmacro MUI_LANGUAGE Breton
!insertmacro MUI_LANGUAGE Bulgarian
!insertmacro MUI_LANGUAGE Croatian
!insertmacro MUI_LANGUAGE Czech
!insertmacro MUI_LANGUAGE Danish
!insertmacro MUI_LANGUAGE Dutch
!insertmacro MUI_LANGUAGE Estonian
!insertmacro MUI_LANGUAGE Farsi
!insertmacro MUI_LANGUAGE Finnish
!insertmacro MUI_LANGUAGE French
!insertmacro MUI_LANGUAGE German
!insertmacro MUI_LANGUAGE Greek
!insertmacro MUI_LANGUAGE Hebrew
!insertmacro MUI_LANGUAGE Hungarian
!insertmacro MUI_LANGUAGE Icelandic
!insertmacro MUI_LANGUAGE Indonesian
!insertmacro MUI_LANGUAGE Irish
!insertmacro MUI_LANGUAGE Italian
!insertmacro MUI_LANGUAGE Japanese
!insertmacro MUI_LANGUAGE Korean
!insertmacro MUI_LANGUAGE Kurdish
!insertmacro MUI_LANGUAGE Latvian
!insertmacro MUI_LANGUAGE Lithuanian
!insertmacro MUI_LANGUAGE Luxembourgish
!insertmacro MUI_LANGUAGE Macedonian
!insertmacro MUI_LANGUAGE Malay
!insertmacro MUI_LANGUAGE Mongolian
!insertmacro MUI_LANGUAGE Norwegian
!insertmacro MUI_LANGUAGE NorwegianNynorsk
!insertmacro MUI_LANGUAGE Polish
!insertmacro MUI_LANGUAGE Portuguese
!insertmacro MUI_LANGUAGE PortugueseBR
!insertmacro MUI_LANGUAGE Romanian
!insertmacro MUI_LANGUAGE Russian
!insertmacro MUI_LANGUAGE Serbian
!insertmacro MUI_LANGUAGE SerbianLatin
!insertmacro MUI_LANGUAGE SimpChinese
!insertmacro MUI_LANGUAGE Slovak
!insertmacro MUI_LANGUAGE Spanish
!insertmacro MUI_LANGUAGE Swedish
!insertmacro MUI_LANGUAGE Thai
!insertmacro MUI_LANGUAGE TradChinese
!insertmacro MUI_LANGUAGE Turkish
!insertmacro MUI_LANGUAGE Ukrainian
!insertmacro MUI_LANGUAGE Welsh

# Installer attributes
OutFile @dist-base@/restlet-@edition@-@version-compact@.exe
InstallDir "$PROGRAMFILES\Restlet Framework\Edition @edition-medium-label@\@version-full@"
CRCCheck on
XPStyle on
ShowInstDetails hide
ShowUnInstDetails hide
VIProductVersion "@version-minor@.0.0"
VIAddVersionKey ProductName "Restlet Framework - Edition @edition-medium-label@"
VIAddVersionKey ProductVersion "${VERSION}"
VIAddVersionKey CompanyName "${COMPANY}"
VIAddVersionKey CompanyWebsite "${URL}"
VIAddVersionKey FileVersion ""
VIAddVersionKey FileDescription ""
VIAddVersionKey LegalCopyright ""
InstallDirRegKey HKLM "${REGKEY}" Path

# Installer sections
Section -Main SEC0000
    SetOutPath $INSTDIR
    SetOverwrite on
    File /r @dist@\*.*
    WriteRegStr HKLM "${REGKEY}\Components" Main 1
SectionEnd

Section -post SEC0001
    WriteRegStr HKLM "${BASEREGKEY}" Version "${VERSION}"
    WriteRegStr HKLM "${REGKEY}" Path $INSTDIR
    WriteUninstaller $INSTDIR\uninstall.exe
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    SetOutPath $SMPROGRAMS\$StartMenuGroup
    CreateDirectory "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@\${VERSION}"
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@\${VERSION}\Uninstall.lnk" $INSTDIR\uninstall.exe
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@\${VERSION}\Home page.lnk" "http://www.restlet.org"
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@\${VERSION}\Restlet API (javadocs).lnk" "$INSTDIR\docs\api\index.html"
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@\${VERSION}\Restlet Extensions (javadocs).lnk" "$INSTDIR\docs\ext\index.html"
    CreateShortcut "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@\${VERSION}\Restlet Engine (javadocs).lnk" "$INSTDIR\docs\engine\index.html"
    !insertmacro MUI_STARTMENU_WRITE_END
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Restlet Framework - @edition-medium-label@ ${VERSION}" DisplayName "Restlet Framework - @edition-medium-label@ - @version-full@"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Restlet Framework - @edition-medium-label@ ${VERSION}" DisplayVersion "${VERSION}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Restlet Framework - @edition-medium-label@ ${VERSION}" Publisher "${COMPANY}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Restlet Framework - @edition-medium-label@ ${VERSION}" URLInfoAbout "${URL}"
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Restlet Framework - @edition-medium-label@ ${VERSION}" DisplayIcon $INSTDIR\uninstall.exe
    WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Restlet Framework - @edition-medium-label@ ${VERSION}" UninstallString $INSTDIR\uninstall.exe
    WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Restlet Framework - @edition-medium-label@ ${VERSION}" NoModify 1
    WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Restlet Framework - @edition-medium-label@ ${VERSION}" NoRepair 1
SectionEnd

# Macro for selecting uninstaller sections
!macro SELECT_UNSECTION SECTION_NAME UNSECTION_ID
    Push $R0
    ReadRegStr $R0 HKLM "${REGKEY}\Components" "${SECTION_NAME}"
    StrCmp $R0 1 0 next${UNSECTION_ID}
    !insertmacro SelectSection "${UNSECTION_ID}"
    GoTo done${UNSECTION_ID}
next${UNSECTION_ID}:
    !insertmacro UnselectSection "${UNSECTION_ID}"
done${UNSECTION_ID}:
    Pop $R0
!macroend

# Uninstaller sections
Section /o un.Main UNSEC0000
    DeleteRegValue HKLM "${REGKEY}\Components" Main
SectionEnd

Section un.post UNSEC0001
    DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Restlet Framework - @edition-medium-label@ ${VERSION}"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@ ${VERSION}\Uninstall.lnk"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@ ${VERSION}\Home page.lnk"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@ ${VERSION}\Restlet API (javadocs).lnk"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@ ${VERSION}\Restlet Extensions (javadocs).lnk"
    Delete /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@ ${VERSION}\Restlet Engine (javadocs).lnk"
    RmDir  /REBOOTOK "$SMPROGRAMS\$StartMenuGroup\Restlet @edition-medium-label@ ${VERSION}"

    Delete /REBOOTOK $INSTDIR\uninstall.exe
    DeleteRegValue HKLM "${REGKEY}" StartMenuGroup
    DeleteRegValue HKLM "${REGKEY}" Path

    ReadRegStr $0 HKLM "${BASEREGKEY}" Version
    StrCmp $0 "${VERSION}" 0 +1
        DeleteRegValue HKLM "${BASEREGKEY}" Version

    DeleteRegKey /IfEmpty HKLM "${REGKEY}\Components"
    DeleteRegKey /IfEmpty HKLM "${REGKEY}"
    DeleteRegKey /IfEmpty HKLM "${BASEREGKEY}"
    DeleteRegKey /IfEmpty HKLM "${RESTLETREGKEY}"
    RmDir /REBOOTOK $SMPROGRAMS\$StartMenuGroup

    ; Remove files. If we don't have a log file skip
    ${If} ${FileExists} "$INSTDIR\uninstall.log"
        ; Copy the uninstall log file to a temporary file
        CopyFiles "$INSTDIR\uninstall.log" "$INSTDIR\uninstall.log.bak"

       ; Delete files
       ${un.LineFind} "$INSTDIR\uninstall.log.bak" "/NUL" "1:-1" "un.RemoveFilesCallback"

       ; Remove empty directories
       ${un.LineFind} "$INSTDIR\uninstall.log.bak" "/NUL" "1:-1" "un.RemoveDirsCallback"

       ; Delete the temporary uninstall log file
       ${DeleteFile} "$INSTDIR\uninstall.log.bak"

      ; Remove the installation directory if it is empty
       ${RemoveDir} "$INSTDIR"

       ;Remove the Noelios directory (if so) if it is empty
       StrCmp "$INSTDIR" "$PROGRAMFILES\Restlet Framework\Edition @edition-medium-label@ @version-full@" 0 +2
       ${RemoveDir} "$PROGRAMFILES\Restlet Framework"
       
    ${EndIf}
SectionEnd

# Installer functions
Function .onInit
    InitPluginsDir
    ;!insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

# Uninstaller functions
Function un.onInit
    ReadRegStr $INSTDIR HKLM "${REGKEY}" Path
    ReadRegStr $StartMenuGroup HKLM "${REGKEY}" StartMenuGroup
    !insertmacro SELECT_UNSECTION Main ${UNSEC0000}
FunctionEnd

################################################################################
# Helper Functions

Function un.RemoveFilesCallback
   ${un.TrimNewLines} "$R9" "$R9"
    StrCpy $R1 "$INSTDIR\$R9"
    ${deleteFile} "$R1"

   ClearErrors
   Push 0
FunctionEnd

; Using locate will leave file handles open to some of the directories which
; will prevent the deletion of these directories. This parses the uninstall.log
; and uses the file entries to find / remove empty directories.
Function un.RemoveDirsCallback
   ${un.TrimNewLines} "$R9" "$R9"
   StrCpy $R2 "$INSTDIR"
   StrCpy $R1 "$INSTDIR\$R9"
    loop:
      Push $R1
      ${GetParentDir}
      Pop $R0
      GetFullPathName $R1 "$R0"
      ; We only try to remove empty directories but the Desktop, StartMenu, and
      ; QuickLaunch directories can be empty so guard against removing them.
      ${If} "$R2" != "$INSTDIR"
          SetShellVarContext all
          ${If} $R1 == "$DESKTOP"
          ${OrIf} $R1 == "$STARTMENU"
              GoTo end
          ${EndIf}
          SetShellVarContext current
          ${If} $R1 == "$QUICKLAUNCH"
          ${OrIf} $R1 == "$DESKTOP"
          ${OrIf} $R1 == "$STARTMENU"
              GoTo end
          ${EndIf}
      ${ElseIf} "$R1" == "$INSTDIR"
          GoTo end
      ${EndIf}
      ${RemoveDir} "$R1"

      ${If} ${Errors}
      ${OrIf} "$R2" != "$INSTDIR"
          GoTo end
      ${EndIf}
      GoTo loop
   end:
   ClearErrors
    Push 0
FunctionEnd
