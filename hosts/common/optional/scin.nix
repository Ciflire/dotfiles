{
  review,
  pkgs,
  ...
}:
{
  environment.sessionVariables = {
    LM_LICENSE_FILE = "/home/ciflire/Downloads/LR-214469_License.dat";
  };
  environment.systemPackages = [
    pkgs.quartus-prime-lite
    pkgs.tclPackages.tk
    pkgs.vhdl-ls
    pkgs.ghdl-llvm
  ];

  services.udev.extraRules = ''
    # USB-Blaster
    SUBSYSTEM=="usb", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6001", MODE="0666"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6002", MODE="0666"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6003", MODE="0666"
    # USB-Blaster II
    SUBSYSTEM=="usb", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6010", MODE="0666"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="09fb", ATTRS{idProduct}=="6810", MODE="0666"

  '';
}
