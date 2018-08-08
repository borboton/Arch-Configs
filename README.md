Section 7.1: Return to a previous commit
To jump back to a previous commit, first find the commit's hash using git log.
To temporarily jump back to that commit, detach your head with:
```git checkout 789abcd```

This places you at commit 789abcd. You can now make new commits on top of this old commit without affecting the
branch your head is on. Any changes can be made into a proper branch using either branch or checkout -b.
To roll back to a previous commit while keeping the changes:
```git reset --soft 789abcd```

To roll back the last commit:
```git reset --soft HEAD~```

To permanently discard any changes made after a specific commit, use:
```git reset --hard 789abcd```

To permanently discard any changes made after the last commit:
```git reset --hard HEAD~```

Beware: While you can recover the discarded commits using reflog and reset, uncommitted changes cannot be
recovered. Use git stash; git reset instead of git reset --hard to be safe.
Section 7.2: Undoing changes
Undo changes to a file or directory in the working copy.
```git checkout -- file.txt```

Used over all file paths, recursively from the current directory, it will undo all changes in the working copy.
```git checkout -- .```

To only undo parts of the changes use --patch. You will be asked, for each change, if it should be undone or not.
```git checkout --patch -- dir```

To undo changes added to the index.
```git reset --hard```

Without the --hard flag this will do a soft reset.
With local commits that you have yet to push to a remote you can also do a soft reset. You can thus rework the files

unset SSH_ASKPASS
git push https://borboton@github.com/borboton/Arch-Configs.git 

CREATE

Clone an existing repository
`````$ git clone ssh://user@domain.com/repo.git `````

Create a new local repository
```$ git init ```

LOCAL CHANGES

Changed files in your working directory
```$ git status ```

Changes to tracked files
```$ git diff ```

Add all current changes to the next commit
```$ git add . ```

Add some changes in <file> to the next commit
```$ git add -p <file> ```

Commit all local changes in tracked files
```$ git commit -a ```

Commit previously staged changes
```$ git commit ```

Change the last commit
Don‘t amend published commits!
```$ git commit --amend ```

COMMIT HISTORY

Show all commits, starting with newest
```$ git log ```

Show changes over time for a specific file
```$ git log -p <file> ```

Who changed what and when in <file>
```$ git blame <file> ```


README UPDATE V1

DLNX0092 (10.11.34.185) is alive en blanco. 
DLNX0093 (10.11.34.186) is alive en blanco. 
DLNX0094 (10.11.34.187) is alive pass incorrecto. 
PLNX0164 (10.73.100.143) is alive pass incorrecto. 


-----------------------------------------------------------------------------------------


find . -name "php.ini"  -type f | xargs -I {} grep "no-debug-non-zts" {}
php -m ldap y oci8 cargados. 
/usr/bin/pfiles 26112

-----------------------------------------------------------------------------------------

