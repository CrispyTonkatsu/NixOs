{ stdenv }:
stdenv.mkDerivation {
  pname = "hyprland_gpu_symlink";
  version = "1";

  # TODO: Change the naming so that it makes sense
  installPhase = ''
    SYMLINK_NAME="amd-igpu"
    RULE_PATH="/lib/udev/rules.d/amd-igpu-dev-path.rules"
    AMD_IGPU_ID=$(lspci -d ::03xx | grep 'AMD' | cut -f1 -d' ')
    UDEV_RULE="$(cat <<EOF
    KERNEL=="card*", \
    KERNELS=="0000:$AMD_IGPU_ID", \
    SUBSYSTEM=="drm", \
    SUBSYSTEMS=="pci", \
    SYMLINK+="dri/$SYMLINK_NAME"
    EOF
    )"

    echo "$UDEV_RULE" | sudo tee "$RULE_PATH"
  '';

  meta = with stdenv.lib; {
    description = "Generate the sym-links that hyprland recommends for multi-gpu setups";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}
