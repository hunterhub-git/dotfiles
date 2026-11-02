{ config, lib, pkgs, ...}: {

  config = lib.mkIf (config.myUser)

}
