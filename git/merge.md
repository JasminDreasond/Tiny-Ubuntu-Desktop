Add the upstream repository as a remote using the following command:

    git remote add upstream https://github.com/derpibooru/philomena.git

Fetch the latest changes from the upstream repository using the following command:

    git fetch upstream

Merge the changes into your local repository using the following command:

    git merge upstream/master

Resolve the merge conflicts.

    git push origin master