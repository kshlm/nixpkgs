{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:
buildGoModule rec {
  pname = "ctrld";
  version = "1.3.11";

  src = fetchFromGitHub {
    owner = "Control-D-Inc";
    repo = "ctrld";
    tag = "v${version}";
    hash = "sha256-McUQghJc8ecS3Le7CGkUCkhkcIO9+h9IJicrBMW2yJk=";
  };
  vendorHash = "sha256-QPq75h8NaG8Aoxf7fuNkqRSZRK4DQsP41aPhD9nZ7ks=";
  subPackages = [ "cmd/ctrld" ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "A highly configurable, multi-protocol DNS forwarding proxy";
    homepage = "https://github.com/Control-D-Inc/ctrld";
    changelog = "https://github.com/Control-D-Inc/ctrld/releases/tag/v${version}";
    license = lib.licenses.mit;
    mainProgram = "ctrld";
    maintainers = with lib.maintainers; [ kshlm ];
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
  };
}
