{ pkgs, ... }: {
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
    extraUpFlags = ["--ssh"];
  };
  services.openssh.enable = true;
}
