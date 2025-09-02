# Problems Repository

This repository contains all the problems from the [sttrace.com](https://sttrace.com/problemset) problemset.

## How to create a new problem?

Boilerplate files for new problems can be created using the `pcli.sh` script.

```bash
./pcli.sh init
```

This will create a new problem in the `./problems/` directory, containing the following files:
- `data.json` - The metadata of the problem
- `description.md` - Markdown description of the problem, should include problem statement, notes, and acceptance criteria
- `init_task` - Shell script to initialize the problem state inside the runner
- `task_submit` - Shell script to evaluate the submission
- `entrypoint.sh` - Initial script run when the problem container starts

Once you've updated the boilerplate code to add a new problem scenario, you can synthesize the problem image for local testing.

```bash
./pcli.sh synth <problem_name>
```

This will move all the files from `./problems/<problem-name>` to the `./synth/<problem-name>` directory. It will also add 2 new files:
- `Dockerfile` - Dockerfile to generate the problem image. Based on your `base_image` and `runner_type` in `data.json`, `pcli.sh` will pick the appropriate file template required for the problem image
- `setup.sh` - Contains important setup tasks like starting `sshd` and triggering the user-created `entrypoint.sh`

Once you have synthesized the problem files, you can build the docker image.

```bash
./pcli.sh build <problem_name>
```

This will create a new image `<problem_name>:latest`. Make sure your docker daemon is running before executing this command.

## What does a good problem look like?

- Should reflect a scenario faced by developers in real-world jobs
- Should have multiple ways to solve the main issue
- May require the developer to fill in minor gaps in the problem statement

## How to test your problem?

Once you've started your problem container with the `./pcli.sh run <problem-name>` command, you can SSH into it.

```bash
ssh admin@localhost
```

Since the run command does not pass new passwords via environment variables, you can use the base password `ubuntu` for both the `ubuntu` and `admin` users.

You can solve the problem by SSHing with the `ubuntu` user and check the results by running the `/home/admin/task_submit` script with the `admin` user.

## Code of conduct

- DSA/Algorithm problems are not allowed
- Don't be an asshole in PRs

## Need help?

- Create an issue
- Email me at gaurang.pawar@sttrace.com