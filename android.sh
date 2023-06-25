# Android related shortcuts

function logcat {
  pkg="$1"
  shift
  if [ -z "$pkg" ]; then
    >&2 echo 'Usage: logcat pkg ...'
    return 1
  fi

  uid="$(adb shell pm list package -U $pkg | sed 's/.*uid://')"
  if [ -z "$uid" ]; then
    >&2 echo "pkg '$pkg' not found"
    return 1
  fi

  adb logcat --uid="$uid" "$@"
}
