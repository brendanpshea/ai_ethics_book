import subprocess

def run_pandoc_help():
    cmd = ["docker", "run", "--rm", "pandoc/core:3.5", "--help"]
    result = subprocess.run(cmd, capture_output=True, text=True)
    for line in result.stdout.split('\n'):
        if 'chunk' in line.lower() or 'split' in line.lower():
            print(line)

if __name__ == "__main__":
    run_pandoc_help()
