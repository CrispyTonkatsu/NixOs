{
  gpuVendorName,
  stdenv,
  udevCheckHook,
  pkgs,
  ...
}:
stdenv.mkDerivation {
  pname = "gpu-udev-finder";
  version = "1";

  phases = [ "installPhase" ];

  nativeBuildInputs = with pkgs; [
    udevCheckHook
    pciutils
  ];

  installPhase = ''
    SYMLINK_NAME=${gpuVendorName}-gpu
    mkdir -p "$out/lib/udev/rules.d/"

    RULE_PATH="$out/lib/udev/rules.d/$SYMLINK_NAME-dev-path.rules"
    GPU_ID=$(lspci -d ::03xx | grep -i ${gpuVendorName} | cut -f1 -d ' ')

    UDEV_RULE=$(cat << EOF
    KERNEL=="card*", \
    KERNELS=="0000:$GPU_ID", \
    SUBSYSTEM=="drm", \
    SUBSYSTEMS=="pci", \
    SYMLINK+="dri/$SYMLINK_NAME"
    EOF
    )'''

    echo "$UDEV_RULE" >> "$RULE_PATH"
  '';
}
