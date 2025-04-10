#Git Cheat Sheet
### Show what file each config comes from
    git config --list --show-origin

### Names of files that changed
    git diff --name-only

### Create an orphan branch
    git checkout --orphan <name>

### Clone just the tip of the tree
    git clone --depth 1 -b branch_name <url>
