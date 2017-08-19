set dir=%~dp0
@set cfg=Debug

@echo -------------------------------------------------------------------
@echo myget.org build: npoi
@echo -------------------------------------------------------------------

dotnet restore main\npoi.csproj
dotnet build
dotnet pack main\npoi.csproj -o ..

:after
@if not ("%errorlevel%"=="0") (
   @goto failure
)

@echo -------------------------------------------------------------------
@echo Build success
@echo Test
@echo -------------------------------------------------------------------

@REM call test.cmd

:failure