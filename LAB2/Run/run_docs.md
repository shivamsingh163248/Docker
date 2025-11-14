# Run Folder Documentation

This folder contains helper scripts to build, run, stop and clean up the LAB2 Docker images and containers.

Location: `D:\Docker\LAB2\Run`

Subfolders:
- `batch` - Windows Batch (`.bat`) scripts (basic)
- `powershell` - PowerShell scripts (`.ps1`) (advanced)
- `shellscript` - POSIX shell scripts (`.sh`) for WSL/macOS/Linux
- `python` - Python helper scripts (`.py`) (cross-platform)

---

## Extensions and Power Levels

| Script Type | Platform | Extension | Power Level |
|-------------|----------|-----------|-------------|
| Batch | Windows | `.bat`, `.cmd` | Basic |
| PowerShell | Windows / Linux / Mac | `.ps1` | Advanced |
| Shell Script | Linux / Mac / WSL | `.sh` | Advanced |
| Python | Cross-platform | `.py` | Very Advanced |

---

## How the scripts are organized

Each subfolder contains a consistent set of scripts:
- `build` — builds all Docker images from the `LAB2` root
- `run` — starts all containers and maps them to ports 8081–8085
- `stop` — stops the running containers
- `cleanup` — stops and removes containers and removes images

All scripts change directory to the `LAB2` root before running Docker commands. This keeps paths consistent and avoids accidental execution from the wrong folder.

---

## Usage examples

### Batch (Windows)
Open PowerShell or Command Prompt and run:

```powershell
cd D:\Docker\LAB2\Run\batch
build.bat        # builds all images
run.bat          # runs all containers
stop.bat         # stops containers
cleanup.bat      # removes containers and images
```

### PowerShell
Open PowerShell and run (may require execution policy change):

```powershell
cd D:\Docker\LAB2\Run\powershell
.\build.ps1
.\run.ps1
.\stop.ps1
.\cleanup.ps1
```

If you get an execution policy error, you can run:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

### Shell Scripts (WSL / Linux / macOS)
Make scripts executable and run:

```bash
cd /mnt/d/Docker/LAB2/Run/shellscript
chmod +x *.sh
./build.sh
./run.sh
./stop.sh
./cleanup.sh
```

### Python (Cross-platform)
Run with Python 3:

```bash
cd D:\Docker\LAB2\Run\python
python build.py
python run.py
python stop.py
python cleanup.py
```

---

## Best Practices & Safety

- Always review scripts before running them.
- These scripts will run Docker commands that can modify or remove images/containers — use the `cleanup` script only when you are sure you want to delete images.
- For Windows PowerShell scripts, be careful with execution policy; use process-scoped bypass when testing.
- Run `docker ps` and `docker images` to verify state before using cleanup scripts.

---

## Example: What `build` does
- Changes to `D:\Docker\LAB2`
- Runs `docker build -f Dockerfile.alpine -t my-app-alpine .` and the other OS-specific builds
- Prints resulting images matching `my-app*`

## Example: What `run` does
- Runs 5 containers:
  - Alpine ⇒ http://localhost:8081
  - Ubuntu ⇒ http://localhost:8082
  - Debian ⇒ http://localhost:8083
  - CentOS ⇒ http://localhost:8084
  - Amazon Linux ⇒ http://localhost:8085

---

## Troubleshooting

- If a build fails, run the failing `docker build` manually from `D:\Docker\LAB2` to see verbose errors.
- If a container fails to start, inspect logs with `docker logs <container>`.
- If ports are in use, modify the `-p` flags in the scripts or stop the conflicting service.

---

## Contact / Next Steps
If you want, I can:
- Run the build script and report results (I can prepare commands for you to run locally),
- Add more safety (prompts before cleanup),
- Add individual scripts to build or run a single OS variant.

---

*End of Run folder documentation.*