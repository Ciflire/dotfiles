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
  ];
}
