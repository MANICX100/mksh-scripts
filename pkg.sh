function instsearch {
  if test $# -eq 0; then
    echo "Please provide a package name."
    return 1
  fi

  pkg_name=$1

  echo "Searching for package '$pkg_name'"

  # Search in dpkg
  if type dpkg >/dev/null 2>&1; then
    echo "=== DEB ==="
    dpkg -l | rg -i "$pkg_name"
  fi

  # Search in flatpak
  if type flatpak >/dev/null 2>&1; then
    echo "=== FLATPAK ==="
    flatpak list | rg -i "$pkg_name"
  fi

  # Search in snap
  if type snap >/dev/null 2>&1; then
    echo "=== SNAP ==="
    snap list | rg -i "$pkg_name"
  fi

  # Search in am
  if type am >/dev/null 2>&1; then
    echo "=== APPIMAGES ==="
    am -f | rg -i "$pkg_name"
  fi

  # Search in dnf
  if type dnf >/dev/null 2>&1; then
    echo "=== RPM ==="
    dnf list installed | rg -i "$pkg_name"
  fi

  # Search in zypper
  if type zypper >/dev/null 2>&1; then
    echo "=== RPM ==="
    zypper se -i | rg -i "$pkg_name"
  fi

  # Search in paru
  if type paru >/dev/null 2>&1; then
    echo "=== AUR ==="
    paru -Q | rg -i "$pkg_name"
  fi

  # Search in brew
  if type brew >/dev/null 2>&1; then
    echo "=== BREW ==="
    brew list | rg -i "$pkg_name"
  fi

  # Search in mas
  if type mas >/dev/null 2>&1; then
    echo "=== APPSTORE ==="
    mas list | rg -i "$pkg_name"
  fi
}

function pkgsearch {
  if test $# -eq 0; then
    echo "Please provide a package name."
    return 1
  fi

  pkg_name=$1

  echo "Searching for package '$pkg_name'"

  if type -q dpkg; then
    # Search in apt
    echo "=== DEB ==="
    apt-cache search "$pkg_name" | rg -i "$pkg_name"
  fi

  if type -q dnf; then
    # Search in dnf
    echo "=== RPM ==="
    dnf search "$pkg_name"
  fi

  if type -q zypper; then
    # Search in zypper
    echo "=== RPM ==="
    zypper se "$pkg_name"
  fi

  if type -q paru; then
    # Search in paru
    echo "=== AUR ==="
    paru -Ss "$pkg_name"
  fi

  if type -q brew; then
    # Search in brew
    echo "=== BREW ==="
    brew search "$pkg_name"
  fi

  # Search in flatpak
  if type -q flatpak; then
    echo "=== FLATPAK ==="
    flatpak remote-ls flathub | rg -i "$pkg_name"
  fi

  # Search in snap
  if type -q snap; then
    echo "=== SNAP ==="
    snap find "$pkg_name"
  fi

  # Search in am
  if type -q am; then
    echo "=== APPIMAGES ==="
    am -q "$pkg_name"
  fi

  if type -q mas; then
    # Search in mas
    echo "=== APPSTORE ==="
    mas search "$pkg_name"
  fi
}
