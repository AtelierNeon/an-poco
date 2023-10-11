##
## Built-in config
##
$InformationPreference = 'Continue'
#$VerbosePreference = 'Continue'

##
## Global config
##
$CmakeCli = 'cmake'
$CmakeToolsetToGeneratorMap = @{
        'v120' = 'Visual Studio 12 2013'
        'v140' = 'Visual Studio 14 2015'
        'v141' = 'Visual Studio 15 2017'
        'v142' = 'Visual Studio 16 2019'
        'v143' = 'Visual Studio 17 2022'
}
$ProjectFolder = Join-Path -Path $PSScriptRoot -ChildPath '..'
$SourceFolder = $ProjectFolder
$TempRootFolder = Join-Path -Path $ProjectFolder -ChildPath 'build'
$TempBuildFolder = Join-Path -Path $TempRootFolder -ChildPath 't'
$TempInstallFolder = Join-Path -Path $TempRootFolder -ChildPath 'i'

##
## Project config
##
####
#### Project level config
####
$ProjectRevision = if ($Env:BUILD_NUMBER) {$Env:BUILD_NUMBER} else {'9999'}
$ProjectShouldDisableCleanBuild = if ($Env:MY_PROJECT_SHOULD_DISABLE_CLEAN_BUILD) {$Env:MY_PROJECT_SHOULD_DISABLE_CLEAN_BUILD} else {'OFF'}
$ProjectShouldDisable32BitBuild = if ($Env:MY_PROJECT_SHOULD_DISABLE_32BIT_BUILD) {$Env:MY_PROJECT_SHOULD_DISABLE_32BIT_BUILD} else {'OFF'}
$ProjectShouldDisable64BitBuild = if ($Env:MY_PROJECT_SHOULD_DISABLE_64BIT_BUILD) {$Env:MY_PROJECT_SHOULD_DISABLE_64BIT_BUILD} else {'OFF'}
$ProjectShouldDisableArmBuild = if ($Env:MY_PROJECT_SHOULD_DISABLE_ARM_BUILD) {$Env:MY_PROJECT_SHOULD_DISABLE_ARM_BUILD} else {'OFF'}
$ProjectShouldDisableArm64ecBuild = if ($Env:MY_PROJECT_SHOULD_DISABLE_ARM64EC_BUILD) {$Env:MY_PROJECT_SHOULD_DISABLE_ARM64EC_BUILD} else {'OFF'}
$ProjectShouldDisableX86Build = if ($Env:MY_PROJECT_SHOULD_DISABLE_X86_BUILD) {$Env:MY_PROJECT_SHOULD_DISABLE_X86_BUILD} else {'OFF'}
$ProjectToolset = if ($Env:MY_PROJECT_CMAKE_TOOLSET) {$Env:MY_PROJECT_CMAKE_TOOLSET} else {'v142'}
$ProjectReleaseType = if ($Env:MY_PROJECT_RELEASE_TYPE) {$Env:MY_PROJECT_RELEASE_TYPE} else {'Debug'}
$ProjectWithOpenSSL111Preferred = if ($Env:MY_PROJECT_WITH_OPENSSL_1_1_1_PREFERRED) {$Env:MY_PROJECT_WITH_OPENSSL_1_1_1_PREFERRED} else {'OFF'}
$ProjectWithOpenSSL30Preferred = if ($Env:MY_PROJECT_WITH_OPENSSL_3_0_PREFERRED) {$Env:MY_PROJECT_WITH_OPENSSL_3_0_PREFERRED} else {'OFF'}
$ProjectWithSharedVcrt = if ($Env:MY_PROJECT_WITH_SHARED_VCRT) {$Env:MY_PROJECT_WITH_SHARED_VCRT} else {'OFF'}
$ProjectWithStaticVcrt = if ($Env:MY_PROJECT_WITH_STATIC_VCRT) {$Env:MY_PROJECT_WITH_STATIC_VCRT} else {'ON'}
$ProjectWithWorkaroundArm64rt = if ($Env:MY_PROJECT_WITH_WORKAROUND_ARM64RT) {$Env:MY_PROJECT_WITH_WORKAROUND_ARM64RT} else {'OFF'}
$ProjectWithWorkaroundOptGy = if ($Env:MY_PROJECT_WITH_WORKAROUND_OPT_GY) {$Env:MY_PROJECT_WITH_WORKAROUND_OPT_GY} else {'OFF'}
$ProjectWithWorkaroundSpectre = if ($Env:MY_PROJECT_WITH_WORKAROUND_SPECTRE) {$Env:MY_PROJECT_WITH_WORKAROUND_SPECTRE} else {'OFF'}
####
#### Project component level config
####
$ProjectExpatWithSharedLibraries = if ($Env:MY_PROJECT_EXPAT_WITH_SHARED_LIBRARIES) {$Env:MY_PROJECT_EXPAT_WITH_SHARED_LIBRARIES} else {'OFF'}
$ProjectExpatWithoutApps = if ($Env:MY_PROJECT_EXPAT_WITHOUT_APPS) {$Env:MY_PROJECT_EXPAT_WITHOUT_APPS} else {'OFF'}
$ProjectExpatWithoutTestApps = if ($Env:MY_PROJECT_EXPAT_WITHOUT_TEST_APPS) {$Env:MY_PROJECT_EXPAT_WITHOUT_TEST_APPS} else {'OFF'}
$ProjectOpenSslWithDeprecatedCiphers = if ($Env:MY_PROJECT_OPENSSL_WITH_DEPRECATED_CIPHERS) {$Env:MY_PROJECT_OPENSSL_WITH_DEPRECATED_CIPHERS} else {'OFF'}
$ProjectOpenSslWithSharedLibraries = if ($Env:MY_PROJECT_OPENSSL_WITH_SHARED_LIBRARIES) {$Env:MY_PROJECT_OPENSSL_WITH_SHARED_LIBRARIES} else {'OFF'}
$ProjectOpenSslWithSharedZlib = if ($Env:MY_PROJECT_OPENSSL_WITH_SHARED_ZLIB) {$Env:MY_PROJECT_OPENSSL_WITH_SHARED_ZLIB} else {'OFF'}
$ProjectOpenSslWithZlib = if ($Env:MY_PROJECT_OPENSSL_WITH_ZLIB) {$Env:MY_PROJECT_OPENSSL_WITH_ZLIB} else {'OFF'}
$ProjectOpenSslWithoutApps = if ($Env:MY_PROJECT_OPENSSL_WITHOUT_APPS) {$Env:MY_PROJECT_OPENSSL_WITHOUT_APPS} else {'OFF'}
$ProjectPcreWithSharedLibraries = if ($Env:MY_PROJECT_PCRE_WITH_SHARED_LIBRARIES) {$Env:MY_PROJECT_PCRE_WITH_SHARED_LIBRARIES} else {'OFF'}
$ProjectPcreWithoutApps = if ($Env:MY_PROJECT_PCRE_WITHOUT_APPS) {$Env:MY_PROJECT_PCRE_WITHOUT_APPS} else {'OFF'}
$ProjectPcreWithoutTestApps = if ($Env:MY_PROJECT_PCRE_WITHOUT_TEST_APPS) {$Env:MY_PROJECT_PCRE_WITHOUT_TEST_APPS} else {'OFF'}
$ProjectPocoWithSharedLibraries = if ($Env:MY_PROJECT_POCO_WITH_SHARED_LIBRARIES) {$Env:MY_PROJECT_POCO_WITH_SHARED_LIBRARIES} else {'OFF'}
$ProjectPocoWithSharedZlib = if ($Env:MY_PROJECT_POCO_WITH_SHARED_ZLIB) {$Env:MY_PROJECT_POCO_WITH_SHARED_ZLIB} else {'OFF'}
$ProjectPocoWithoutApps = if ($Env:MY_PROJECT_POCO_WITHOUT_APPS) {$Env:MY_PROJECT_POCO_WITHOUT_APPS} else {'OFF'}
$ProjectSqliteWithSharedLibraries = if ($Env:MY_PROJECT_SQLITE_WITH_SHARED_LIBRARIES) {$Env:MY_PROJECT_SQLITE_WITH_SHARED_LIBRARIES} else {'OFF'}
$ProjectSqliteWithoutApps = if ($Env:MY_PROJECT_SQLITE_WITHOUT_APPS) {$Env:MY_PROJECT_SQLITE_WITHOUT_APPS} else {'OFF'}
$ProjectZlibWithoutTestApps = if ($Env:MY_PROJECT_ZLIB_WITHOUT_TEST_APPS) {$Env:MY_PROJECT_ZLIB_WITHOUT_TEST_APPS} else {'OFF'}

##
## My variables
##
$MyCmakeCommonArgumentList = @(
        "-S $SourceFolder",
        "-T $ProjectToolset",
        "-DMY_REVISION=$ProjectRevision"
)
if ('ON'.Equals($ProjectExpatWithSharedLibraries)) {
    $MyCmakeCommonArgumentList += "-DEXPAT_WITH_SHARED_LIBRARIES=$ProjectExpatWithSharedLibraries"
}
if ('ON'.Equals($ProjectExpatWithoutApps)) {
    $MyCmakeCommonArgumentList += "-DEXPAT_WITHOUT_APPS=$ProjectExpatWithoutApps"
}
if ('ON'.Equals($ProjectExpatWithoutTestApps)) {
    $MyCmakeCommonArgumentList += "-DEXPAT_WITHOUT_TEST_APPS=$ProjectExpatWithoutTestApps"
}
if ('ON'.Equals($ProjectOpenSslWithDeprecatedCiphers)) {
    $MyCmakeCommonArgumentList += "-DOPENSSL_WITH_DEPRECATED_CIPHERS=$ProjectOpenSslWithDeprecatedCiphers"
}
if ('ON'.Equals($ProjectOpenSslWithSharedLibraries)) {
    $MyCmakeCommonArgumentList += "-DOPENSSL_WITH_SHARED_LIBRARIES=$ProjectOpenSslWithSharedLibraries"
}
if ('ON'.Equals($ProjectOpenSslWithSharedZlib)) {
    $MyCmakeCommonArgumentList += "-DOPENSSL_WITH_SHARED_ZLIB=$ProjectOpenSslWithSharedZlib"
}
if ('ON'.Equals($ProjectOpenSslWithZlib)) {
    $MyCmakeCommonArgumentList += "-DOPENSSL_WITH_ZLIB=$ProjectOpenSslWithZlib"
}
if ('ON'.Equals($ProjectOpenSslWithoutApps)) {
    $MyCmakeCommonArgumentList += "-DOPENSSL_WITHOUT_APPS=$ProjectOpenSslWithoutApps"
}
if ('ON'.Equals($ProjectPcreWithSharedLibraries)) {
    $MyCmakeCommonArgumentList += "-DPCRE_WITH_SHARED_LIBRARIES=$ProjectPcreWithSharedLibraries"
}
if ('ON'.Equals($ProjectPcreWithoutApps)) {
    $MyCmakeCommonArgumentList += "-DPCRE_WITHOUT_APPS=$ProjectPcreWithoutApps"
}
if ('ON'.Equals($ProjectPcreWithoutTestApps)) {
    $MyCmakeCommonArgumentList += "-DPCRE_WITHOUT_TEST_APPS=$ProjectPcreWithoutTestApps"
}
if ('ON'.Equals($ProjectPocoWithSharedLibraries)) {
    $MyCmakeCommonArgumentList += "-DPOCO_WITH_SHARED_LIBRARIES=$ProjectPocoWithSharedLibraries"
}
if ('ON'.Equals($ProjectPocoWithSharedZlib)) {
    $MyCmakeCommonArgumentList += "-DPOCO_WITH_SHARED_ZLIB=$ProjectPocoWithSharedZlib"
}
if ('ON'.Equals($ProjectPocoWithoutApps)) {
    $MyCmakeCommonArgumentList += "-DPOCO_WITHOUT_APPS=$ProjectPocoWithoutApps"
}
if ('ON'.Equals($ProjectSqliteWithSharedLibraries)) {
    $MyCmakeCommonArgumentList += "-DSQLITE_WITH_SHARED_LIBRARIES=$ProjectSqliteWithSharedLibraries"
}
if ('ON'.Equals($ProjectSqliteWithoutApps)) {
    $MyCmakeCommonArgumentList += "-DSQLITE_WITHOUT_APPS=$ProjectSqliteWithoutApps"
}
if ('ON'.Equals($ProjectZlibWithoutTestApps)) {
    $MyCmakeCommonArgumentList += "-DZLIB_WITHOUT_TEST_APPS=$ProjectZlibWithoutTestApps"
}
if ('ON'.Equals($ProjectWithOpenSSL111Preferred)) {
    $MyCmakeCommonArgumentList += "-DBUILD_WITH_OPENSSL_1_1_1_PREFERRED=$ProjectWithOpenSSL111Preferred"
}
if ('ON'.Equals($ProjectWithOpenSSL30Preferred)) {
    $MyCmakeCommonArgumentList += "-DBUILD_WITH_OPENSSL_3_0_PREFERRED=$ProjectWithOpenSSL30Preferred"
}
if ('ON'.Equals($ProjectWithSharedVcrt)) {
    $MyCmakeCommonArgumentList += "-DBUILD_WITH_SHARED_VCRT=$ProjectWithSharedVcrt"
}
if ('ON'.Equals($ProjectWithStaticVcrt)) {
    $MyCmakeCommonArgumentList += "-DBUILD_WITH_STATIC_VCRT=$ProjectWithStaticVcrt"
}
if ('ON'.Equals($ProjectWithWorkaroundSpectre)) {
    $MyCmakeCommonArgumentList += "-DBUILD_WITH_WORKAROUND_SPECTRE=$ProjectWithWorkaroundSpectre"
}
$MyCmakeGenerator = $CmakeToolsetToGeneratorMap[$ProjectToolset]
$MyCmakeCommonArgumentList += "-G `"$MyCmakeGenerator`""
$MyCmakePlatformToBuildToggleMap = @{
        'ARM' = 'ON'
        'ARM64' = 'ON'
        'ARM64EC' = 'ON'
        'Win32' = 'ON'
        'x64' = 'ON'
}
if ('ON'.Equals($ProjectShouldDisable32BitBuild)) {
    $MyCmakePlatformToBuildToggleMap['ARM'] = 'OFF'
    $MyCmakePlatformToBuildToggleMap['Win32'] = 'OFF'
}
if ('ON'.Equals($ProjectShouldDisable64BitBuild)) {
    $MyCmakePlatformToBuildToggleMap['ARM64'] = 'OFF'
    $MyCmakePlatformToBuildToggleMap['ARM64EC'] = 'OFF'
    $MyCmakePlatformToBuildToggleMap['x64'] = 'OFF'
}
if ('ON'.Equals($ProjectShouldDisableArmBuild)) {
    $MyCmakePlatformToBuildToggleMap['ARM'] = 'OFF'
    $MyCmakePlatformToBuildToggleMap['ARM64'] = 'OFF'
    $MyCmakePlatformToBuildToggleMap['ARM64EC'] = 'OFF'
}
if ('ON'.Equals($ProjectShouldDisableArm64ecBuild)) {
    $MyCmakePlatformToBuildToggleMap['ARM64EC'] = 'OFF'
}
if ('ON'.Equals($ProjectShouldDisableX86Build)) {
    $MyCmakePlatformToBuildToggleMap['Win32'] = 'OFF'
    $MyCmakePlatformToBuildToggleMap['x64'] = 'OFF'
}
if ('v120'.Equals($ProjectToolset)) {
    $MyCmakePlatformToBuildToggleMap['ARM'] = 'OFF'
    $MyCmakePlatformToBuildToggleMap['ARM64'] = 'OFF'
    $MyCmakePlatformToBuildToggleMap['ARM64EC'] = 'OFF'
}
if ('v140'.Equals($ProjectToolset)) {
    $MyCmakePlatformToBuildToggleMap['ARM64'] = 'OFF'
    $MyCmakePlatformToBuildToggleMap['ARM64EC'] = 'OFF'
}
if ('v141'.Equals($ProjectToolset)) {
    $MyCmakePlatformToBuildToggleMap['ARM64EC'] = 'OFF'
}
$MyCmakePlatformToBuildList = @()
foreach ($Platform in $MyCmakePlatformToBuildToggleMap.Keys) {
    if ('ON'.Equals($MyCmakePlatformToBuildToggleMap[$Platform])) {
        $MyCmakePlatformToBuildList += $Platform
    }
}
$MyCmakePlatformToBuildListString = $MyCmakePlatformToBuildList -join ", "



## Print build information
Write-Information "[PowerShell] Project information: revision: `"$ProjectRevision`""
Write-Information "[PowerShell] Project information: release type: `"$ProjectReleaseType`""
Write-Information "[PowerShell] Project information: Disable clean build: $ProjectShouldDisableCleanBuild"
Write-Information "[PowerShell] Project information: CMake generator: `"$MyCmakeGenerator`""
Write-Information "[PowerShell] Project information: CMake toolset: `"$ProjectToolset`""
Write-Information "[PowerShell] Project information: CMake platform to build: $MyCmakePlatformToBuildListString"
Write-Information "[PowerShell] Project information: Preferred to use OpenSSL 1.1.1: $ProjectWithOpenSSL111Preferred"
Write-Information "[PowerShell] Project information: Preferred to use OpenSSL 3.0: $ProjectWithOpenSSL30Preferred"
Write-Information "[PowerShell] Component information: expat with shared libraries: $ProjectExpatWithSharedLibraries"
Write-Information "[PowerShell] Component information: expat without apps: $ProjectExpatWithoutApps"
Write-Information "[PowerShell] Component information: expat without test apps: $ProjectExpatWithoutTestApps"
Write-Information "[PowerShell] Component information: OpenSSL with deprecated ciphers: $ProjectOpenSslWithDeprecatedCiphers"
Write-Information "[PowerShell] Component information: OpenSSL with shared libraries: $ProjectOpenSslWithSharedLibraries"
Write-Information "[PowerShell] Component information: OpenSSL with shared Zlib: $ProjectOpenSslWithSharedZlib"
Write-Information "[PowerShell] Component information: OpenSSL with Zlib: $ProjectOpenSslWithZlib"
Write-Information "[PowerShell] Component information: OpenSSL without apps: $ProjectOpenSslWithoutApps"
Write-Information "[PowerShell] Component information: PCRE with shared libraries: $ProjectPcreWithSharedLibraries"
Write-Information "[PowerShell] Component information: PCRE without apps: $ProjectPcreWithoutApps"
Write-Information "[PowerShell] Component information: PCRE without test apps: $ProjectPcreWithoutTestApps"
Write-Information "[PowerShell] Component information: POCO with shared libraries: $ProjectPocoWithSharedLibraries"
Write-Information "[PowerShell] Component information: POCO with shared Zlib: $ProjectPocoWithSharedZlib"
Write-Information "[PowerShell] Component information: POCO without apps: $ProjectPocoWithoutApps"
Write-Information "[PowerShell] Component information: SQLite with shared libraries: $ProjectSqliteWithSharedLibraries"
Write-Information "[PowerShell] Component information: SQLite without apps: $ProjectSqliteWithoutApps"
Write-Information "[PowerShell] Component information: Zlib without test apps: $ProjectZlibWithoutTestApps"



## Detect source folder
Write-Information "[PowerShell] Detecting $SourceFolder folder ..."
if (-not (Test-Path -Path $SourceFolder)) {
    Write-Error "[PowerShell] Detecting $SourceFolder folder ... NOT FOUND"
    Exit 1
}
Write-Information "[PowerShell] Detecting $SourceFolder folder ... FOUND"



## Create or clean temp folder
if (-not ('ON'.Equals($ProjectShouldDisableCleanBuild))) {
    $MyIoError = $null
    Write-Information "[PowerShell] Cleaning $TempRootFolder folder ..."
    if (Test-Path -Path $TempRootFolder) {
        Write-Verbose "[PowerShell] Removing $TempRootFolder folder ..."
        Remove-Item -Recurse -Force $TempRootFolder -ErrorVariable MyIoError
        if ($MyIoError) {
            Write-Error "[PowerShell] Remove $TempRootFolder folder ... FAILED"
            Exit 1
        }
    }
    Write-Information "[PowerShell] Cleaning $TempRootFolder folder ... DONE"
}
if (-not (Test-Path -Path $TempBuildFolder)) {
    $MyIoError = $null
    Write-Verbose "[PowerShell] Creating $TempBuildFolder folder ..."
    New-Item -ItemType Directory -Path $TempBuildFolder -ErrorVariable MyIoError | Out-Null
    if ($MyIoError) {
        Write-Error "[PowerShell] Creating $TempBuildFolder folder ... FAILED"
        Exit 1
    }
    Write-Verbose "[PowerShell] Creating $TempBuildFolder folder ... DONE"
}
if (-not (Test-Path -Path $TempInstallFolder)) {
    $MyIoError = $null
    Write-Verbose "[PowerShell] Creating $TempInstallFolder folder ..."
    New-Item -ItemType Directory -Path $TempInstallFolder -ErrorVariable MyIoError | Out-Null
    if ($MyIoError) {
        Write-Error "[PowerShell] Creating $TempInstallFolder folder ... FAILED"
        Exit 1
    }
    Write-Verbose "[PowerShell] Creating $TempInstallFolder folder ... DONE"
}



## Detect CMake
$MyCmakeProcess = $null
$MyCmakeProcessHandle = $null
Write-Information "[PowerShell] Detecting CMake ..."
try {
    $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -WindowStyle Hidden -PassThru `
            -ArgumentList "--help"
    $MyCmakeProcessHandle = $MyCmakeProcess.Handle
    $MyCmakeProcess.WaitForExit()
    $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
    if ($MyCmakeProcessExitCode -ne 0) {
        Write-Error "[PowerShell] Detecting CMake ... INCORRECT (ExitCode: $MyCmakeProcessExitCode)"
        Exit 1
    }
} catch {
    Write-Error "[PowerShell] Detecting CMake ... NOT FOUND"
    Exit 1
} finally {
    if ($null -ne $MyCmakeProcessHandle) {
        $MyCmakeProcessHandle = $null
    }
    if ($null -ne $MyCmakeProcess) {
        $MyCmakeProcess.Dispose()
        $MyCmakeProcess = $null
    }
}
Write-Information "[PowerShell] Detecting CMake ... FOUND"



## Build project for platform Win32
$MyCmakePlatform = 'Win32'
Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ..."
if (-not ('ON'.Equals($MyCmakePlatformToBuildToggleMap[$MyCmakePlatform]))) {
    Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ... SKIPPED"
} else {
    $MyTempBuildFolder = Join-Path -Path $TempBuildFolder -ChildPath $ProjectReleaseType
    $MyTempBuildFolder = Join-Path -Path $MyTempBuildFolder -ChildPath $MyCmakePlatform
    $MyTempInstallFolderAbs = Resolve-Path $TempInstallFolder
    $MyTempInstallFolderAbs = Join-Path -Path $MyTempInstallFolderAbs -ChildPath $ProjectReleaseType
    $MyTempInstallFolderAbs = Join-Path -Path $MyTempInstallFolderAbs -ChildPath $MyCmakePlatform

    ## Build project for platform $MyCmakePlatform - Generate project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ..."
    try {
        $MyCmakeArgumentList = $MyCmakeCommonArgumentList + @(
                "-B $MyTempBuildFolder",
                "-A $MyCmakePlatform",
                "--install-prefix `"$MyTempInstallFolderAbs`""
        )
        $MyCmakeArgumentListString = $MyCmakeArgumentList -join " "
        Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... argument list: $MyCmakeArgumentListString"
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList $MyCmakeArgumentListString
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... DONE"

    ## Build project for platform $MyCmakePlatform - Compile project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ..."
    try {
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList "--build $MyTempBuildFolder --config $ProjectReleaseType"
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... DONE"

    ## Build project for platform $MyCmakePlatform - Install project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ..."
    try {
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList "--install $MyTempBuildFolder --config $ProjectReleaseType"
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... DONE"
    Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ... DONE"
}



## Build project for platform ARM
$MyCmakePlatform = 'ARM'
Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ..."
if (-not ('ON'.Equals($MyCmakePlatformToBuildToggleMap[$MyCmakePlatform]))) {
    Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ... SKIPPED"
} else {
    $MyTempBuildFolder = Join-Path -Path $TempBuildFolder -ChildPath $ProjectReleaseType
    $MyTempBuildFolder = Join-Path -Path $MyTempBuildFolder -ChildPath $MyCmakePlatform
    $MyTempInstallFolderAbs = Resolve-Path $TempInstallFolder
    $MyTempInstallFolderAbs = Join-Path -Path $MyTempInstallFolderAbs -ChildPath $ProjectReleaseType
    $MyTempInstallFolderAbs = Join-Path -Path $MyTempInstallFolderAbs -ChildPath $MyCmakePlatform

    ## Build project for platform $MyCmakePlatform - Generate project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ..."
    try {
        $MyCmakeArgumentList = $MyCmakeCommonArgumentList + @(
                "-B $MyTempBuildFolder",
                "-A $MyCmakePlatform",
                "--install-prefix `"$MyTempInstallFolderAbs`""
        )
        if ('ON'.Equals($ProjectWithWorkaroundOptGy)) {
            $MyCmakeArgumentList += "-DBUILD_WITH_WORKAROUND_OPT_GY=$ProjectWithWorkaroundOptGy"
        }
        $MyCmakeArgumentListString = $MyCmakeArgumentList -join " "
        Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... argument list: $MyCmakeArgumentListString"
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList $MyCmakeArgumentListString
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... DONE"

    ## Build project for platform $MyCmakePlatform - Compile project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ..."
    try {
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList "--build $MyTempBuildFolder --config $ProjectReleaseType"
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... DONE"

    ## Build project for platform $MyCmakePlatform - Install project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ..."
    try {
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList "--install $MyTempBuildFolder --config $ProjectReleaseType"
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... DONE"
    Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ... DONE"
}



## Build project for platform x64
$MyCmakePlatform = 'x64'
Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ..."
if (-not ('ON'.Equals($MyCmakePlatformToBuildToggleMap[$MyCmakePlatform]))) {
    Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ... SKIPPED"
} else {
    $MyTempBuildFolder = Join-Path -Path $TempBuildFolder -ChildPath $ProjectReleaseType
    $MyTempBuildFolder = Join-Path -Path $MyTempBuildFolder -ChildPath $MyCmakePlatform
    $MyTempInstallFolderAbs = Resolve-Path $TempInstallFolder
    $MyTempInstallFolderAbs = Join-Path -Path $MyTempInstallFolderAbs -ChildPath $ProjectReleaseType
    $MyTempInstallFolderAbs = Join-Path -Path $MyTempInstallFolderAbs -ChildPath $MyCmakePlatform

    ## Build project for platform $MyCmakePlatform - Generate project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ..."
    try {
        $MyCmakeArgumentList = $MyCmakeCommonArgumentList + @(
                "-B $MyTempBuildFolder",
                "-A $MyCmakePlatform",
                "--install-prefix `"$MyTempInstallFolderAbs`""
        )
        $MyCmakeArgumentListString = $MyCmakeArgumentList -join " "
        Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... argument list: $MyCmakeArgumentListString"
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList $MyCmakeArgumentListString
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... DONE"

    ## Build project for platform $MyCmakePlatform - Compile project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ..."
    try {
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList "--build $MyTempBuildFolder --config $ProjectReleaseType"
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... DONE"

    ## Build project for platform $MyCmakePlatform - Install project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ..."
    try {
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList "--install $MyTempBuildFolder --config $ProjectReleaseType"
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... DONE"
    Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ... DONE"
}



## Build project for platform ARM64
$MyCmakePlatform = 'ARM64'
Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ..."
if (-not ('ON'.Equals($MyCmakePlatformToBuildToggleMap[$MyCmakePlatform]))) {
    Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ... SKIPPED"
} else {
    $MyTempBuildFolder = Join-Path -Path $TempBuildFolder -ChildPath $ProjectReleaseType
    $MyTempBuildFolder = Join-Path -Path $MyTempBuildFolder -ChildPath $MyCmakePlatform
    $MyTempInstallFolderAbs = Resolve-Path $TempInstallFolder
    $MyTempInstallFolderAbs = Join-Path -Path $MyTempInstallFolderAbs -ChildPath $ProjectReleaseType
    $MyTempInstallFolderAbs = Join-Path -Path $MyTempInstallFolderAbs -ChildPath $MyCmakePlatform

    ## Build project for platform $MyCmakePlatform - Generate project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ..."
    try {
        $MyCmakeArgumentList = $MyCmakeCommonArgumentList + @(
                "-B $MyTempBuildFolder",
                "-A $MyCmakePlatform",
                "--install-prefix `"$MyTempInstallFolderAbs`""
        )
        if ('ON'.Equals($ProjectWithWorkaroundArm64rt)) {
            $MyCmakeArgumentList += "-DBUILD_WITH_WORKAROUND_ARM64RT=$ProjectWithWorkaroundArm64rt"
        }
        $MyCmakeArgumentListString = $MyCmakeArgumentList -join " "
        Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... argument list: $MyCmakeArgumentListString"
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList $MyCmakeArgumentListString
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... DONE"

    ## Build project for platform $MyCmakePlatform - Compile project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ..."
    try {
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList "--build $MyTempBuildFolder --config $ProjectReleaseType"
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... DONE"

    ## Build project for platform $MyCmakePlatform - Install project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ..."
    try {
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList "--install $MyTempBuildFolder --config $ProjectReleaseType"
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... DONE"
    Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ... DONE"
}



## Build project for platform ARM64EC
$MyCmakePlatform = 'ARM64EC'
Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ..."
if (-not ('ON'.Equals($MyCmakePlatformToBuildToggleMap[$MyCmakePlatform]))) {
    Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ... SKIPPED"
} else {
    $MyTempBuildFolder = Join-Path -Path $TempBuildFolder -ChildPath $ProjectReleaseType
    $MyTempBuildFolder = Join-Path -Path $MyTempBuildFolder -ChildPath $MyCmakePlatform
    $MyTempInstallFolderAbs = Resolve-Path $TempInstallFolder
    $MyTempInstallFolderAbs = Join-Path -Path $MyTempInstallFolderAbs -ChildPath $ProjectReleaseType
    $MyTempInstallFolderAbs = Join-Path -Path $MyTempInstallFolderAbs -ChildPath $MyCmakePlatform

    ## Build project for platform $MyCmakePlatform - Generate project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ..."
    try {
        $MyCmakeArgumentList = $MyCmakeCommonArgumentList + @(
                "-B $MyTempBuildFolder",
                "-A $MyCmakePlatform",
                "--install-prefix `"$MyTempInstallFolderAbs`""
        )
        $MyCmakeArgumentListString = $MyCmakeArgumentList -join " "
        Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... argument list: $MyCmakeArgumentListString"
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList $MyCmakeArgumentListString
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Generating project ... DONE"

    ## Build project for platform $MyCmakePlatform - Compile project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ..."
    try {
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList "--build $MyTempBuildFolder --config $ProjectReleaseType"
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Compiling project ... DONE"

    ## Build project for platform $MyCmakePlatform - Install project
    $MyCmakeProcess = $null
    $MyCmakeProcessHandle = $null
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ..."
    try {
        $MyCmakeProcess = Start-Process -FilePath "$CmakeCli" -NoNewWindow -PassThru `
                -ArgumentList "--install $MyTempBuildFolder --config $ProjectReleaseType"
        $MyCmakeProcessHandle = $MyCmakeProcess.Handle
        $MyCmakeProcess.WaitForExit()
        $MyCmakeProcessExitCode = $MyCmakeProcess.ExitCode
        if ($MyCmakeProcessExitCode -ne 0) {
            Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... FAILED (ExitCode: $MyCmakeProcessExitCode)"
            Exit 1
        }
    } catch {
        Write-Error "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... FAILED (CMake is missing)"
        Exit 1
    } finally {
        if ($null -ne $MyCmakeProcessHandle) {
            $MyCmakeProcessHandle = $null
        }
        if ($null -ne $MyCmakeProcess) {
            $MyCmakeProcess.Dispose()
            $MyCmakeProcess = $null
        }
    }
    Write-Verbose "[PowerShell] Building project for platform $MyCmakePlatform ... Installing project ... DONE"
    Write-Information "[PowerShell] Building project for platform $MyCmakePlatform ... DONE"
}
