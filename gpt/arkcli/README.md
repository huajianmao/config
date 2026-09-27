1. Build the image:

```bash
docker build -t arkcli:local .
```

1. Login ark account with docker

```bash
ARK_ID=ark_id
docker run -it --rm --host -v ~/.arkcli/$ARK_ID:/root  arkcli:local auth login volc-sso
```

1. Use with docker

```bash
arkcli() {
  : "${ARK_ID:=ark_id}"
  docker run -it --rm \
    --network host \
    -v "$HOME/.arkcli/$ARK_ID:/root" \
    arkcli:local "$@"
}
```
