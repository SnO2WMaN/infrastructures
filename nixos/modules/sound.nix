{...}: {
  sound.enable = false;

  hardware.pulseaudio = {
    enable = false;
    support32Bit = true;
  };

  services.pipewire = {
    enable = true;

    # alsa.enable = true;
    # alsa.support32Bit = true;

    pulse.enable = true;
  };
}
