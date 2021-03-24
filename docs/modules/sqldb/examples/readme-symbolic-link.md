Windows:
a symbolic link was create here using this command

go into C:\Windows\System32\cmd.exe

check, before creating

```
dir ..\..\..\..\db_DataHandwerk
```

then create

```
mklink /d db_DataHandwerk ..\..\..\..\db_DataHandwerk
```

normally admin rights are required.

But you can enable windows developer mode (Entwicklerfunktionen) to use mklink without admin rights

It looks like this symbolic link can't be commited using tortoisegit, you get some message about dirty submodule

On the other hand, when installing git for windows there is an option:

"Enable symbolic links"

You can also set this option later in the config file for git for windows. By default, this is located at C:\ProgramData\Git\config.

Find the [core] section and add `symlinks = true` to turn it on. 

But maybe this needs to be before first cloning the repo. I don't know. It doesn't work.
