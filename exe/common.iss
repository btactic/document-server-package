; Uncomment the line below to be able to compile the script from within the IDE.
;#define COMPILE_FROM_IDE

#define sAppName            'ONLYOFFICE DocumentServer'
#define APP_PATH            'ONLYOFFICE\DocumentServer'
#define APP_REG_PATH        'Software\ONLYOFFICE\DocumentServer'

#define REG_LICENSE_PATH      'LicensePath'
#define REG_DB_HOST           'DbHost'
#define REG_DB_USER           'DbUser'
#define REG_DB_PWD            'DbPwd'
#define REG_DB_NAME           'DbName'
#define REG_RABBITMQ_HOST     'RabbitMqHost'
#define REG_RABBITMQ_USER     'RabbitMqUser'
#define REG_RABBITMQ_PWD      'RabbitMqPwd'
#define REG_REDIS_HOST        'RedisHost'
#define REG_DS_PORT           'DsPort'
#define REG_DOCSERVICE_PORT   'DocServicePort'
#define REG_SPELLCHECKER_PORT 'SpellCheckerPort'
#define REG_FONTS_PATH        'FontsPath'

#define iconsExe            'projicons.exe'

#ifndef COMPILE_FROM_IDE
#define sAppVersion         '{{PRODUCT_VERSION}}.{{BUILD_NUMBER}}'
#else
#define sAppVersion         '4.0.0.0'
#endif

#define sAppVerShort

#define NSSM                  '{app}\server\Winser\node_modules\winser\bin\nssm64.exe'
#define NODE_SRV_ENV          'NODE_ENV=production-windows NODE_CONFIG_DIR=""{app}\config"" NODE_DISABLE_COLORS=1'

#define LOCAL_SERVICE 'Local Service'

#define CONVERTER_SRV        'DsConverterSvc'
#define CONVERTER_SRV_DISPLAY  'ONLYOFFICE DocumentServer Converter'
#define CONVERTER_SRV_DESCR  'ONLYOFFICE DocumentServer Converter Service'
#define CONVERTER_SRV_DIR    '{app}\server\FileConverter\sources'
#define CONVERTER_SRV_LOG_DIR    '{app}\Log\converter'

#define DOCSERVICE_SRV        'DsDocServiceSvc'
#define DOCSERVICE_SRV_DISPLAY  'ONLYOFFICE DocumentServer DocService'
#define DOCSERVICE_SRV_DESCR  'ONLYOFFICE DocumentServer DocService Service'
#define DOCSERVICE_SRV_DIR    '{app}\server\docservice\sources'
#define DOCSERVICE_SRV_LOG_DIR    '{app}\Log\docservice'

#define GC_SRV        'DsGcSvc'
#define GC_SRV_DISPLAY  'ONLYOFFICE DocumentServer Gc'
#define GC_SRV_DESCR  'ONLYOFFICE DocumentServer Gc Service'
#define GC_SRV_DIR    '{app}\server\docservice\sources'
#define GC_SRV_LOG_DIR    '{app}\Log\gc'

#define SPELLCHECKER_SRV        'DsSpellcheckerSvc'
#define SPELLCHECKER_SRV_DISPLAY  'ONLYOFFICE DocumentServer Spellchecker'
#define SPELLCHECKER_SRV_DESCR  'ONLYOFFICE DocumentServer Spellchecker Service'
#define SPELLCHECKER_SRV_DIR    '{app}\server\SpellChecker\sources'
#define SPELLCHECKER_SRV_LOG_DIR    '{app}\Log\spellchecker'

#define PSQL '{app}\pgsql\bin\psql.exe'
#define POSTGRESQL_DATA_DIR '{userappdata}\postgresql'
#define REDISCLI '{pf64}\Redis\redis-cli.exe'
#define RABBITMQCTL '{pf64}\RabbitMQ Server\rabbitmq_server-3.6.5\sbin\rabbitmqctl.bat'

#define NODE_PATH '{pf32}\nodejs'
#define NPM '{pf32}\nodejs\npm'
#define JSON '{userappdata}\npm\json.cmd'

#define JSON_PARAMS '-I -q -f ""{app}\config\default.json""'
#define JSON_WIN_PARAMS '-I -q -f ""{app}\config\production-windows.json""'

#define REPLACE '{userappdata}\npm\replace.cmd'

#define NGINX_SRV  'DsProxySvc'
#define NGINX_SRV_DISPLAY  'ONLYOFFICE DocumentServer Proxy'
#define NGINX_SRV_DESCR  'ONLYOFFICE DocumentServer Proxy Service'
#define NGINX_SRV_DIR  '{app}\nginx-1.11.4'
#define NGINX_SRV_LOG_DIR    '{app}\Log\nginx'

#define LICENSE_PATH '{commonappdata}\ONLYOFFICE\Data'

[Setup]
AppName                   ={#sAppName}
AppVerName                ={#sAppName} {#sAppVerShort}
AppVersion                ={#sAppVersion}
VersionInfoVersion        ={#sAppVersion}
OutputBaseFilename        ={#sPackageName}-{#sAppVersion}

AppPublisher            =Ascensio System SIA.
AppPublisherURL         =http://www.onlyoffice.com/
AppSupportURL           =http://www.onlyoffice.com/support.aspx
AppCopyright            =Copyright (C) 2016 Ascensio System SIA.

ArchitecturesAllowed              =x64
ArchitecturesInstallIn64BitMode   =x64

DefaultGroupName        =ONLYOFFICE
;WizardImageFile         = data\dialogpicture.bmp
;WizardSmallImageFile    = data\dialogicon.bmp


UsePreviousAppDir         =no
DirExistsWarning          =no
DefaultDirName            ={pf}\{#APP_PATH}
DisableProgramGroupPage   = yes
DisableWelcomePage        = no
DEPCompatible             = no
ASLRCompatible            = no
DisableDirPage            = auto
AllowNoIcons              = yes
AlwaysShowDirOnReadyPage  = yes
UninstallDisplayIcon      = {uninstallexe}
OutputDir                 =.\
Compression               =zip
PrivilegesRequired        =admin
ChangesEnvironment        =yes
SetupMutex                =ASC
MinVersion                =6.1.7600
WizardImageFile           = data\dialogpicture.bmp
WizardSmallImageFile      = data\dialogicon.bmp
SetupIconFile             = data\icon.ico

#ifndef COMPILE_FROM_IDE
SignTool=byparam $p
#endif

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
;Name: "de"; MessagesFile: "compiler:Languages\German.isl"
;Name: "fr"; MessagesFile: "compiler:Languages\French.isl"
;Name: "it"; MessagesFile: "compiler:Languages\Italian.isl"
;Name: "nl"; MessagesFile: "compiler:Languages\Dutch.isl"
;Name: "pl"; MessagesFile: "compiler:Languages\Polish.isl"

[Files]
Source: ..\common\documentserver\home\*;            DestDir: {app}; Flags: ignoreversion recursesubdirs;
Source: ..\common\documentserver\config\*;          DestDir: {app}\config; Flags: ignoreversion recursesubdirs
Source: ..\common\documentserver\bin\*.bat;         DestDir: {app}\bin; Flags: ignoreversion recursesubdirs
Source: nginx\nginx.conf;                                    DestDir: {#NGINX_SRV_DIR}\conf; Flags: ignoreversion recursesubdirs
Source: ..\common\fonts\Asana-Math\*.tt*;           DestDir: {fonts}; Flags: ignoreversion recursesubdirs

[Dirs]
Name: "{app}\server\App_Data";        Permissions: users-full
Name: "{#CONVERTER_SRV_LOG_DIR}";     Permissions: users-full
Name: "{#DOCSERVICE_SRV_LOG_DIR}";    Permissions: users-full
Name: "{#GC_SRV_LOG_DIR}";            Permissions: users-full
Name: "{#SPELLCHECKER_SRV_LOG_DIR}";  Permissions: users-full
Name: "{#NGINX_SRV_DIR}";             Permissions: users-full
Name: "{#NGINX_SRV_LOG_DIR}";         Permissions: users-full
Name: "{#NGINX_SRV_DIR}\temp";        Permissions: users-full
Name: "{#NGINX_SRV_DIR}\logs";        Permissions: users-full
Name: "{#POSTGRESQL_DATA_DIR}";
Name: "{#LICENSE_PATH}";

[Icons]
Name: "{group}\Uninstall {#sAppName}"; Filename: "{uninstallexe}"

[Registry]
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_LICENSE_PATH}"; ValueData: "{code:GetLicensePath}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_DB_HOST}"; ValueData: "{code:GetDbHost}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_DB_USER}"; ValueData: "{code:GetDbUser}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_DB_PWD}"; ValueData: "{code:GetDbPwd}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_DB_NAME}"; ValueData: "{code:GetDbName}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_RABBITMQ_HOST}"; ValueData: "{code:GetRabbitMqHost}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_RABBITMQ_USER}"; ValueData: "{code:GetRabbitMqUser}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_RABBITMQ_PWD}"; ValueData: "{code:GetRabbitMqPwd}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_REDIS_HOST}"; ValueData: "{code:GetRedisHost}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_DS_PORT}"; ValueData: "{code:GetDefaultPort}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_DOCSERVICE_PORT}"; ValueData: "{code:GetDocServicePort}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_SPELLCHECKER_PORT}"; ValueData: "{code:GetSpellCheckerPort}";
Root: HKLM; Subkey: "{#APP_REG_PATH}"; ValueType: "string"; ValueName: "{#REG_FONTS_PATH}"; ValueData: "{code:GetFontsPath}";

[Run]
Filename: "{app}\bin\documentserver-generate-allfonts.bat"; Flags: runhidden

Filename: "{#NPM}"; Parameters: "install -g json"; Flags: runhidden shellexec waituntilterminated
Filename: "{#NPM}"; Parameters: "install -g replace"; Flags: runhidden shellexec waituntilterminated
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""this.services.CoAuthoring.sql.dbHost = '{code:GetDbHost}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""this.services.CoAuthoring.sql.dbUser = '{code:GetDbUser}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""this.services.CoAuthoring.sql.dbPass = '{code:GetDbPwd}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""this.services.CoAuthoring.sql.dbName = '{code:GetDbName}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""this.rabbitmq.url = 'amqp://{code:GetRabbitMqHost}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""this.rabbitmq.login = '{code:GetRabbitMqUser}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""this.rabbitmq.password = '{code:GetRabbitMqPwd}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""this.services.CoAuthoring.redis.host = '{code:GetRedisHost}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden

Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""this.services.CoAuthoring.server.port = '{code:GetDocServicePort}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden
Filename: "{#JSON}"; Parameters: "{#JSON_PARAMS} -e ""this.services.SpellChecker.server.port = '{code:GetSpellCheckerPort}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden
Filename: "{#JSON}"; Parameters: "{#JSON_WIN_PARAMS} -e ""this.license.license_file = '{code:GetLicensePath}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden
Filename: "{#JSON}"; Parameters: "{#JSON_WIN_PARAMS} -e ""this.services.CoAuthoring.utils.utils_common_fontdir = '{code:GetFontsPath}'"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden

Filename: "{#REPLACE}"; Parameters: "{{{{DS_PORT}} {code:GetDefaultPort} ""{#NGINX_SRV_DIR}\conf\nginx.conf"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden
Filename: "{#REPLACE}"; Parameters: "{{{{DOCSERVICE_PORT}} {code:GetDocServicePort} ""{#NGINX_SRV_DIR}\conf\nginx.conf"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden
Filename: "{#REPLACE}"; Parameters: "{{{{SPELLCHECKER_PORT}} {code:GetSpellCheckerPort} ""{#NGINX_SRV_DIR}\conf\nginx.conf"""; WorkingDir: "{#NODE_PATH}"; Flags: runhidden

Filename: "{#PSQL}"; Parameters: "-h {code:GetDbHost} -U {code:GetDbUser} -d {code:GetDbName} -w -q -f ""{app}\server\schema\postgresql\createdb.sql"""; Flags: runhidden; Check: CreateDbAuth; 

Filename: "{#NSSM}"; Parameters: "install {#CONVERTER_SRV} node convertermaster.js"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} DisplayName {#CONVERTER_SRV_DISPLAY}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} Description {#CONVERTER_SRV_DESCR}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} AppDirectory {#CONVERTER_SRV_DIR}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} AppEnvironmentExtra {#NODE_SRV_ENV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} AppStdout {#CONVERTER_SRV_LOG_DIR}\out.log"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} AppStderr {#CONVERTER_SRV_LOG_DIR}\error.log"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#CONVERTER_SRV} ObjectName ""{#LOCAL_SERVICE}"" """" "; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "start {#CONVERTER_SRV}"; Flags: runhidden

Filename: "{#NSSM}"; Parameters: "install {#DOCSERVICE_SRV} node server.js"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} DisplayName {#DOCSERVICE_SRV_DISPLAY}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} Description {#DOCSERVICE_SRV_DESCR}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} AppDirectory {#DOCSERVICE_SRV_DIR}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} AppEnvironmentExtra {#NODE_SRV_ENV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} AppStdout {#DOCSERVICE_SRV_LOG_DIR}\out.log"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} AppStderr {#DOCSERVICE_SRV_LOG_DIR}\error.log"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#DOCSERVICE_SRV} ObjectName ""{#LOCAL_SERVICE}"" """" "; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "start {#DOCSERVICE_SRV}"; Flags: runhidden

Filename: "{#NSSM}"; Parameters: "install {#GC_SRV} node gc.js"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#GC_SRV} DisplayName {#GC_SRV_DISPLAY}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#GC_SRV} Description {#GC_SRV_DESCR}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#GC_SRV} AppDirectory {#GC_SRV_DIR}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#GC_SRV} AppEnvironmentExtra {#NODE_SRV_ENV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#GC_SRV} AppStdout {#GC_SRV_LOG_DIR}\out.log"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#GC_SRV} AppStderr {#GC_SRV_LOG_DIR}\error.log"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#GC_SRV} ObjectName ""{#LOCAL_SERVICE}"" """" "; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "start {#GC_SRV}"; Flags: runhidden

Filename: "{#NSSM}"; Parameters: "install {#SPELLCHECKER_SRV} node server.js"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#SPELLCHECKER_SRV} DisplayName {#SPELLCHECKER_SRV_DISPLAY}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#SPELLCHECKER_SRV} Description {#SPELLCHECKER_SRV_DESCR}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#SPELLCHECKER_SRV} AppDirectory {#SPELLCHECKER_SRV_DIR}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#SPELLCHECKER_SRV} AppEnvironmentExtra {#NODE_SRV_ENV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#SPELLCHECKER_SRV} AppStdout {#SPELLCHECKER_SRV_LOG_DIR}\out.log"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#SPELLCHECKER_SRV} AppStderr {#SPELLCHECKER_SRV_LOG_DIR}\error.log"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#SPELLCHECKER_SRV} ObjectName ""{#LOCAL_SERVICE}"" """" "; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "start {#SPELLCHECKER_SRV}"; Flags: runhidden

Filename: "{#NSSM}"; Parameters: "install {#NGINX_SRV} ""{#NGINX_SRV_DIR}\nginx"""; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} DisplayName {#NGINX_SRV_DISPLAY}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} Description {#NGINX_SRV_DESCR}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} AppDirectory {#NGINX_SRV_DIR}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} AppStdout {#NGINX_SRV_LOG_DIR}\out.log"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} AppStderr {#NGINX_SRV_LOG_DIR}\error.log"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "set {#NGINX_SRV} ObjectName ""{#LOCAL_SERVICE}"" """" "; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "start {#NGINX_SRV}"; Flags: runhidden

Filename: "{sys}\netsh.exe"; Parameters: "firewall add allowedprogram ""{#NGINX_SRV_DIR}\nginx.exe"" ""{#NGINX_SRV_DESCR}"" ENABLE ALL"; Flags: runhidden

[UninstallRun]
Filename: "{#NSSM}"; Parameters: "stop {#NGINX_SRV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "remove {#NGINX_SRV} confirm"; Flags: runhidden

Filename: "{#NSSM}"; Parameters: "stop {#CONVERTER_SRV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "remove {#CONVERTER_SRV} confirm"; Flags: runhidden

Filename: "{#NSSM}"; Parameters: "stop {#DOCSERVICE_SRV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "remove {#DOCSERVICE_SRV} confirm"; Flags: runhidden

Filename: "{#NSSM}"; Parameters: "stop {#GC_SRV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "remove {#GC_SRV} confirm"; Flags: runhidden

Filename: "{#NSSM}"; Parameters: "stop {#SPELLCHECKER_SRV}"; Flags: runhidden
Filename: "{#NSSM}"; Parameters: "remove {#SPELLCHECKER_SRV} confirm"; Flags: runhidden

Filename: {sys}\netsh.exe; Parameters: "firewall delete allowedprogram program=""{#NGINX_SRV_DIR}\nginx.exe"""; Flags: runhidden

[UninstallDelete]
Type: filesandordirs; Name: "{app}\*"

; shared code for installing the products
#include "scripts\products.iss"
; helper functions
#include "scripts\products\stringversion.iss"
#include "scripts\products\winversion.iss"
#include "scripts\products\fileversion.iss"

#include "scripts\products\msiproduct.iss"
#include "scripts\products\vcredist2010sp1.iss"
#include "scripts\products\vcredist2013.iss"
#include "scripts\products\nodejs4x.iss"
#include "scripts\products\postgresql.iss"
#include "scripts\products\rabbitmq.iss"
#include "scripts\products\redis.iss"

#include "scripts\service.iss"

[Code]
procedure StopDsServices(); forward;

function InitializeSetup(): Boolean;
begin
  // initialize windows version
  initwinversion();

  StopDsServices();

  vcredist2010();
  vcredist2013();
  nodejs4x('4.0.0.0');
  //postgresql('9.5.4.0');
  //rabbitmq('3.6.5');
  //redis('3.2.100');

  Result := true;
end;

var
  DbPage: TInputQueryWizardPage;
  RabbitMqPage: TInputQueryWizardPage;
  RedisPage: TInputQueryWizardPage;

function GetDbHost(Param: String): String;
begin
  Result := DbPage.Values[0];
end;

function GetDbPort(Param: String): String;
begin
  Result := IntToStr(5432);
end;

function GetDbUser(Param: String): String;
begin
  Result := DbPage.Values[1];
end;

function GetDbPwd(Param: String): String;
begin
  Result := DbPage.Values[2];
end;

function GetDbName(Param: String): String;
begin
  Result := DbPage.Values[3];
end;

function GetRabbitMqHost(Param: String): String;
begin
  Result := RabbitMqPage.Values[0];
end;

function GetRabbitMqUser(Param: String): String;
begin
  Result := RabbitMqPage.Values[1];
end;

function GetRabbitMqPwd(Param: String): String;
begin
  Result := RabbitMqPage.Values[2];
end;

function GetRedisHost(Param: String): String;
begin
  Result := RedisPage.Values[0];
end;

function GetDefaultPort(Param: String): String;
begin
  Result := ExpandConstant('{param:DS_PORT|{reg:HKLM\{#APP_REG_PATH},{#REG_DS_PORT}|80}}');
end;

function GetDocServicePort(Param: String): String;
begin
  Result := ExpandConstant('{param:DOCSERVICE_PORT|{reg:HKLM\{#APP_REG_PATH},{#REG_DOCSERVICE_PORT}|8000}}');
end;

function GetSpellCheckerPort(Param: String): String;
begin
  Result := ExpandConstant('{param:SPELLCHECKER_PORT|{reg:HKLM\{#APP_REG_PATH},{#REG_SPELLCHECKER_PORT}|8080}}');
end;

function GetLicensePath(Param: String): String;
var
  LicensePath: String;
begin
  LicensePath := ExpandConstant('{param:LICENSE_PATH|{reg:HKLM\{#APP_REG_PATH},{#REG_LICENSE_PATH}|{#LICENSE_PATH}\license.lic}}');
  StringChangeEx(LicensePath, '\', '/', True);
  Result := LicensePath;
end;

function GetFontsPath(Param: String): String;
var
  FontPath: String;
begin
  FontPath := ExpandConstant('{param:FONTS_PATH|{reg:HKLM\{#APP_REG_PATH},{#REG_FONTS_PATH}|{fonts}}}');
  StringChangeEx(FontPath, '\', '/', True);
  Result := FontPath;
end;

procedure InitializeWizard;
begin
  DbPage := CreateInputQueryPage(wpPreparing,
    'PostgreSQL Database', 'Configure PostgreSQL Connection...',
    'Please specify your PostgreSQL connection, then click Next.');
  DbPage.Add('Host:', False);
  DbPage.Add('User:', False);
  DbPage.Add('Password:', True);
  DbPage.Add('Database:', False);

  DbPage.Values[0] := ExpandConstant('{param:DB_HOST|{reg:HKLM\{#APP_REG_PATH},{#REG_DB_HOST}|localhost}}');
  DbPage.Values[1] := ExpandConstant('{param:DB_USER|{reg:HKLM\{#APP_REG_PATH},{#REG_DB_USER}|onlyoffice}}');
  DbPage.Values[2] := ExpandConstant('{param:DB_PWD|{reg:HKLM\{#APP_REG_PATH},{#REG_DB_PWD}|onlyoffice}}');
  DbPage.Values[3] := ExpandConstant('{param:DB_NAME|{reg:HKLM\{#APP_REG_PATH},{#REG_DB_NAME}|onlyoffice}}');

  RabbitMqPage := CreateInputQueryPage(DbPage.ID,
    'RabbitMQ Messaging Broker', 'Configure RabbitMQ Connection...',
    'Please specify your RabbitMQ connection, then click Next.');
  RabbitMqPage.Add('Host:', False);
  RabbitMqPage.Add('User:', False);
  RabbitMqPage.Add('Password:', True);

  RabbitMqPage.Values[0] := ExpandConstant('{param:RABBITMQ_HOST|{reg:HKLM\{#APP_REG_PATH},{#REG_RABBITMQ_HOST}|localhost}}');
  RabbitMqPage.Values[1] := ExpandConstant('{param:RABBITMQ_USER|{reg:HKLM\{#APP_REG_PATH},{#REG_RABBITMQ_USER}|guest}}');
  RabbitMqPage.Values[2] := ExpandConstant('{param:RABBITMQ_PWD|{reg:HKLM\{#APP_REG_PATH},{#REG_RABBITMQ_PWD}|guest}}');

  RedisPage := CreateInputQueryPage(RabbitMqPage.ID,
    'Redis In-Memory Database', 'Configure Redis Connection...',
    'Please specify your Reids connection, then click Next.');
  RedisPage.Add('Host:', False);

  RedisPage.Values[0] := ExpandConstant('{param:REDIS_HOST|{reg:HKLM\{#APP_REG_PATH},{#REG_REDIS_HOST}|localhost}}');

end;

function CreateDbAuth(): Boolean;
var
  IsSuccess: Boolean;
begin
  Result := true;

  IsSuccess := SaveStringToFile(
    ExpandConstant('{#POSTGRESQL_DATA_DIR}\pgpass.conf'),
    GetDbHost('')+ ':' + GetDbPort('')+ ':' + GetDbName('') + ':' + GetDbUser('') + ':' + GetDbPwd(''),
    False);
end;

function CheckDbConnection(): Boolean;
var
  ResultCode: Integer;
begin
  Result := true;

  SaveStringToFile(
    ExpandConstant('{userappdata}\postgresql\pgpass.conf'),
    GetDbHost('')+ ':' + GetDbPort('')+ ':' + GetDbName('') + ':' + GetDbUser('') + ':' + GetDbPwd(''),
    False);

  Exec(
    ExpandConstant('{#PSQL}'),
    '-h ' + GetDbHost('') + ' -U ' + GetDbUser('') + ' -d ' + GetDbName('') + ' -w -c ";"',
    '', 
    SW_HIDE,
    ewWaitUntilTerminated,
    ResultCode);

  if ResultCode <> 0 then
  begin
    MsgBox('Connection to ' + GetDbHost('') + ' failed!' + #13#10 + 'PSQL return ' + IntToStr(ResultCode)+ ' code.' +  #13#10 + 'Check the connection settings and try again.', mbError, MB_OK);
    Result := false;
  end;
end;

function CheckRabbitMqConnection(): Boolean;
var
  ResultCode: Integer;
begin
  Result := true;
    Exec(
    ExpandConstant('{#RABBITMQCTL}'),
    '-q list_queues',
    '', 
    SW_HIDE,
    ewWaitUntilTerminated,
    ResultCode);

  if ResultCode <> 0 then
  begin
    MsgBox('Connection to ' + GetRedisHost('') + ' failed!' + #13#10 + 'rabbitmqctl return ' + IntToStr(ResultCode)+ ' code.' +  #13#10 + 'Check the connection settings and try again.', mbError, MB_OK);
    Result := false;
  end;
end;

function CheckRedisConnection(): Boolean;
var
  ResultCode: Integer;
begin
  Result := true;
    Exec(
    ExpandConstant('{#REDISCLI}'),
    '-h ' + GetRedisHost('') + ' --version',
    '', 
    SW_HIDE,
    ewWaitUntilTerminated,
    ResultCode);

  if ResultCode <> 0 then
  begin
    MsgBox('Connection to ' + GetRedisHost('') + ' failed!' + #13#10 + 'redis-cli return ' + IntToStr(ResultCode)+ ' code.' +  #13#10 + 'Check the connection settings and try again.', mbError, MB_OK);
    Result := false;
  end;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := true;
  if WizardSilent() = false then
  begin
    case CurPageID of
//      DbPage.ID: Result := CheckDbConnection();
//      RabbitMqPage.ID: Result := CheckRabbitMqConnection();
//      RedisPage.ID: Result := CheckRedisConnection();
      wpReady: Result := DownloadDependency();
    end;
  end;
end;                                                     
