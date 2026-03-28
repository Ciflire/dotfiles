{
  lib,
  callPackage,
  fetchFromGitHub,
  fftw,
  glib,
  gtk4-layer-shell,
  libpulseaudio,
  libxkbcommon,
  pkg-config,
  rustPlatform,
  udev,
  wrapGAppsHook4,

  # update script
  jq,
  nix-prefetch-github,
  nix-update,
  writeShellApplication,
}:
let
  libcava = callPackage ./libcava.nix { };
in
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wayle";
  version = "0-unstable-2026-03-25";

  src = fetchFromGitHub {
    owner = "wayle-rs";
    repo = "wayle";
    rev = "7069fa7e44e657b11acc7c0d41600b3a79e4febd";
    hash = "sha256-TA0Eu//dSdRtEFPBK7qG1svrAXqBKKkeoBMMr5lV00k=";
  };
  patches = [ ./double-check-using-vendored-cava.patch ];
  postPatch = ''
    substituteInPlace Cargo.toml \
      --replace-fail ', features = ["vendored"]' ""
  '';
  depsExtraArgs = {
    inherit (finalAttrs) patches postPatch;
  };

  cargoHash = "sha256-8uwZXMr3Sm9di3mC1nSmuM+WfCjcA2nl72drc94RxO4=";
  RUSTC_BOOTSTRAP = true;

  nativeBuildInputs = [
    glib
    wrapGAppsHook4
    pkg-config
    rustPlatform.bindgenHook
  ];
  buildInputs = [
    libxkbcommon.dev
    gtk4-layer-shell.dev
    udev

    # for generating libcava bindings
    libcava
    fftw.dev
    libpulseaudio
  ];

  cargoBuildFlags = [
    "--package=wayle"
    "--package=wayle-shell"
  ];

  preCheck = ''
    export HOME=$(mktemp -d)
  '';
  checkFlags = [
    # GTK4 failed to initialize (requires GUI?)
    "--skip=tests::css_loads_into_gtk4"
  ];

  preInstall = ''
    mkdir -p "$out/share/icons"
    cp -r resources/icons "$out/share"
  '';

  passthru = {
    inherit libcava;
    updateScript = writeShellApplication {
      name = "wayle-update";
      runtimeInputs = [
        nix-update
        jq
        nix-prefetch-github
      ];
      text = builtins.readFile ./update.sh;
    };
  };

  meta = {
    description = "Wayland Elements - A compositor agnostic shell with extensive customization";
    homepage = "https://github.com/wayle-rs/wayle/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ PerchunPak ];
    mainProgram = "wayle";
    platforms = lib.platforms.linux;
  };
})
