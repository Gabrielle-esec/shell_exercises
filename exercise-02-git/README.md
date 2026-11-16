# Exercise 02 — Git Basics

## Objective

Learn the fundamentals of Git, including repositories, commits, branches, merging, and GitHub.

## Part 1 — Setup and Configuration

Check the Git version:

```bash
git --version
```

Configure the Git username and email:

```bash
git config --global user.name "Your Name"
git config --global user.email "your-github-noreply-email"
```

## Part 2 — Create Your First Repository

```bash
mkdir my-first-repo
cd my-first-repo
git init
touch readme.txt
ls
```

## Part 3 — Your First Commit

```bash
git status
git add readme.txt
git commit -m "Add readme file"
git log
```

## Part 4 — Make Changes

I added a new line to my file using:

```bash
echo "I hope I'm doing well." >> readme.txt
```

`git status` showed that `readme.txt` was modified but not staged, meaning the changes would not be included in the next commit until I staged them.

I committed my changes using:

```bash
git add readme.txt
git commit -m "Update readme"
```

At this point, I had **2 commits**.

## Part 5 — Exploration

**`git diff`**

Displays changes in tracked files that have not been staged yet. It showed nothing when I tried it because I had already committed my changes.

**`git log --oneline`**

Displays a compact commit history with abbreviated commit IDs and commit messages.

## Part 6 — Working with Branches

```bash
git branch
git branch feature-script
git switch feature-script
git switch -c dev
git switch feature-script
git branch --show-current
```

## Part 7 — Create a Bash Script on a Branch

On the `feature-script` branch, I created an executable Bash script called `install.sh`.

```bash
touch install.sh
chmod +x install.sh
git add install.sh
git commit -m "Add install script"
git log --oneline
```

The installation script is included in this exercise folder.

## Part 8 — Merge Branches

```bash
git switch master
ls
git merge feature-script
ls
git log --oneline
git branch -d feature-script
```

Before merging, `install.sh` was not present on the main development branch because it had been created and committed on `feature-script`.

After merging, both `readme.txt` and `install.sh` were present.

My history contained three commits: the initial README commit, the README update, and the installation script commit.

*Note: My original repository used `master` as its default branch.*

## Part 9 — Push to GitHub

I created a GitHub repository without initializing it with a README.

Then I connected my local repository to GitHub:

```bash
git remote add origin https://github.com/Gabrielle-esec/my-first-repo.git
git push -u origin master
```

After pushing, I could see the repository, its files, and its commit history on GitHub.

## Part 10 — Delete and Clone

```bash
cd ..
rm -rf my-first-repo
git clone https://github.com/Gabrielle-esec/my-first-repo.git
cd my-first-repo
ls
```

I successfully cloned the repository and recovered both files.

**Note:** The deletion command is destructive and should only be used after verifying that the project is backed up remotely.

## Reflection Questions

**1. Why is version control useful?**

Version control keeps track of changes in a project and allows us to return to an older version if something goes wrong.

**2. What is the difference between staging and committing?**

Staging means selecting the changes that will be included in the next commit, while committing saves those changes in Git history.

**3. When should you make a commit?**

You should make commits regularly, ideally after completing a meaningful and working part of a project.

**4. What is the difference between `git init` and `git clone`?**

`git init` creates a new local Git repository. `git clone` copies an existing repository, including its history, from another location.

**5. Why should you write good commit messages?**

Good commit messages help developers understand what was changed or added, both individually and when collaborating.

**6. What is the purpose of using branches?**

Branches allow developers to work on new features or changes without directly modifying the main development branch.

**7. When would you create a new branch instead of working on main?**

I would create a new branch when adding a feature, fixing a bug, or testing something without affecting the main branch.
