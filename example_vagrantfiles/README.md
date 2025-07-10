# Example Vagrantfiles

Install prerequisites

- vagrant

    ```text
    brew install --cask vagrant
    ```

- UTM

    ```text
    brew install --cask utm
    ```

Install the [vagrant_utm](https://naveenrajm7.github.io/vagrant_utm/) vagrant plugin

```text
vagrant plugin install vagrant_utm
```

Add `utmctl` to your `PATH`

```text
sudo ln -sf /Applications/UTM.app/Contents/MacOS/utmctl /usr/local/bin/utmctl
```

Bring up the vagrant UTM VM

```text
vagrant up
```
