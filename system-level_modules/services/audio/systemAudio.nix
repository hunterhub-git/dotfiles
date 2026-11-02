{ config, lib, pkgs, ... }:

{

  config = lib.mkMerge [
    (lib.mkIf (config.mySystemControlPanel.systemAudio == "pipewire") {
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };
    })

    (lib.mkIf (config.mySystemControlPanel.systemAudio == "pulse") {
      services.pipewire.enable = false;
      services.pulseaudio.enable = true;
    })

    (lib.mkIf (config.mySystemControlPanel.systemAudio == "none") {
      services.pipewire.enable = false;
      services.pulseaudio.enable = false;
    })
  ];
}
