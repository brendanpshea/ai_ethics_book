import subprocess
import os

print("Testing chunked HTML build with Pandoc 3.5...")

# Read the chapters from chapter-order.txt
with open("pandoc/chapter-order.txt", "r") as f:
    chapters = [line.strip() for line in f if line.strip() and not line.strip().startswith("#")]

# Run pandoc chunkedhtml with valid options for 3.5
cmd = [
    "docker", "run", "--rm",
    "-v", f"{os.getcwd()}:/data",
    "-w", "/data",
    "pandoc/core:3.5",
    "--defaults", "pandoc/html.yaml"
] + chapters + [
    "-o", "dist/",
    "--split-level=1"
]

print("Executing:")
print(" ".join(cmd))

result = subprocess.run(cmd, capture_output=True, text=True)

if result.returncode == 0:
    print("Success. DIST CONTENTS:")
    for item in os.listdir("dist"):
        print(item)
else:
    print("FAILED")
    print(result.stderr)

