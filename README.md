# iOS-SHSH-Fetcher
A utility script for saving blobs from apple servers on almost all types of iDevices (32 or 64 bit iDevices).

**_[Notice : Trying an unsigned version of iOS would not get blobs as the 'shsh' folder would be completely empty inside release directory itself. Also does not work for OTA's. Only works for signed iOS versions]_**

# Requirements
**1.** Homebrew Missing Package Manager must be installed from https://brew.sh. Or Macports from https://www.macports.org/ (BUT, Homebrew is recommended for this).
**2.** Compile and install all of these dependencies packages using homebrew or Macports:-

* **Buildsystem:**

autoconf

autoconf-archive

autogen

automake

libtool

m4

make

pkg-config

* **Tihmstar's libs:**

libgeneral

libfragmentzip

* **External libs:**

libcurl

libirecovery

liplist

libzip

openssl

zlib

* **Submodules:**

jssy

* **Bundled libs, (not required to be installed manually):**

tss

# Usage
**1)** Open a terminal window on the directory that you just downloaded from the release using **"cd"** .

**2)** Then type _chmod +x ./iosshshfetcher.sh_ and press enter.

**3)** At last, type _./iosshshfetcher.sh_ and hit enter.

**4)** Type your iDevice model, ECID and iOS version {that you want SHSH blobs for} when it asks.

**_Enjoy!_**
# Huge Thanks To
**Tihmstar** _for creating the **TssChecker**_. Otherwise, this project would not be possible as is!
