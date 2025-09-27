{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = [ pkgs.virtiofsd ];
  };
  programs.virt-manager.enable = true;
  environment.systemPackages = [pkgs.qemu];
}
