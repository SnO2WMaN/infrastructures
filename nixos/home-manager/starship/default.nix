{...}: {
  programs.starship = {
    enable = true;
    settings = {
      directory = {
        truncation_length = 2;
        truncate_to_repo = true;
      };
      time = {
        disabled = false;
        utc_time_offset = "+9";
      };
    };
  };
}
