# The 11 Rules of GitLab Flow
1. Use feature branches, no direct commits on master.
2. Test all commits, not only ones on master.
3. Run all the tests on all commits (if your tests run longer than 5 minutes have them run in parallel).
4. Perform code reviews before merges into master, not afterwards.
5. Deployments are automatic, based on branches or tags.
6. Tags are set by the user, not by CI.
7. Releases are based on tags.
8. Pushed commits are never rebased.
9. Everyone starts from master, and targets master.
10. Fix bugs in master first and release branches second.
11. Commit messages reflect intent.

Source: https://about.gitlab.com/2016/07/27/the-11-rules-of-gitlab-flow/