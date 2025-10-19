# certinfo

`certinfo` — a tiny, no-friction Bash utility to fetch and display an SSL/TLS certificate for a domain using `openssl`.

> Simple, dependable, and scriptable — great for quick checks and batch runs.

---

## Features

- Retrieves the remote certificate via `openssl s_client`
- Prints the parsed certificate (subject, issuer, validity, extensions, etc.)
- Prints a human-friendly serial number line and the public-key section
- Preserves SNI (`-servername`) so it works with virtual-hosted TLS

---

## Prerequisites

- `bash` (4+ recommended)
- `openssl` (command-line)
- Network access to the target domain on port `443`

Install on Debian/Ubuntu:
```bash
sudo apt update
sudo apt install -y openssl bash
```

---

## Installation

from parent directory:

- git clone https://github.com/<your-username>/<repo>.git certinfo
- cd certinfo

 if the script is tools/ssl/getcertinfo.sh or getcertinfo.sh in repo root:
- chmod +x getcertinfo.sh

or, to install globally:

- sudo mv getcertinfo.sh /usr/local/bin/getcertinfo
- sudo chmod +x /usr/local/bin/getcertinfo


## Usage


run from repo:

- ./getcertinfo.sh example.com

or if installed in PATH:

- getcertinfo example.com


## Batch mode (simple loop)

``` 
while IFS= read -r domain; do
  ./getcertinfo.sh "$domain"
done < domains.txt
```
