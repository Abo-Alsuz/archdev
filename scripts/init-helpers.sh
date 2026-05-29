#!/bin/bash
# init-helpers.sh - abstraction layer for multiple init systems
# Supported: systemd, openrc, runit, s6

detect_init_system() {
  if [ -d /run/systemd/system ]; then
    echo "systemd"
  elif command -v rc-service &>/dev/null; then
    echo "openrc"
  elif command -v sv &>/dev/null; then
    echo "runit"
  elif command -v s6-svc &>/dev/null; then
    echo "s6"
  else
    echo "unknown"
  fi
}

enable_service() {
  local service="$1"
  case "$INIT_SYSTEM" in
    systemd)
      sudo systemctl enable --now "$service"
      ;;
    openrc)
      sudo rc-service "$service" start
      sudo rc-update add "$service" default
      ;;
    runit)
      if [ -d "/etc/sv/$service" ]; then
        sudo ln -sf "/etc/sv/$service" "/var/service/$service"
      fi
      ;;
    s6)
      # s6 support: user must manage supervision bundles manually for now
      echo "Warning: s6 service management not yet implemented; please add $service to your supervision tree manually."
      ;;
    *)
      echo "Error: Unknown init system '$INIT_SYSTEM'"
      return 1
      ;;
  esac
}

check_service() {
  local service="$1"
  case "$INIT_SYSTEM" in
    systemd)
      systemctl is-active --quiet "$service"
      return $?
      ;;
    openrc)
      rc-service "$service" status >/dev/null 2>&1
      return $?
      ;;
    runit)
      if [ -L "/var/service/$service" ]; then
        sv status "$service" >/dev/null 2>&1
        return $?
      fi
      return 1
      ;;
    s6)
      if [ -d "/run/service/$service" ]; then
        svstat "/run/service/$service" >/dev/null 2>&1
        return $?
      fi
      return 1
      ;;
    *)
      return 1
      ;;
  esac
}

enable_user_service() {
  local service="$1"
  case "$INIT_SYSTEM" in
    systemd)
      systemctl --user enable --now "$service"
      ;;
    openrc|runit|s6)
      # Non-systemd systems don't have user services; this is a no-op
      # The service will run system-wide instead
      return 0
      ;;
    *)
      echo "Error: Unknown init system '$INIT_SYSTEM'"
      return 1
      ;;
  esac
}

check_user_service() {
  local service="$1"
  case "$INIT_SYSTEM" in
    systemd)
      systemctl --user is-active --quiet "$service"
      return $?
      ;;
    openrc|runit|s6)
      # Non-systemd systems: check system-wide service instead
      check_service "$service"
      return $?
      ;;
    *)
      return 1
      ;;
  esac
}

# Export init system variable if not already set
if [ -z "$INIT_SYSTEM" ]; then
  export INIT_SYSTEM="$(detect_init_system)"
fi
