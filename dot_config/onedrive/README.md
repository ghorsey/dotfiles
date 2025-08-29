# Setup Onedrive multiprofile

- `sudo cp ~/.config/onedrive/personal/onedrive-personal.service /lib/systemd/user/onedrive-personal.service`
- `sudo cp ~/.config/onedrive/c3/onedrive-c3.service /lib/systemd/user/onedrive-c3.service`

`journalctl --user-unit onedrive-personal -f`
`journalctl --user-unit onedrive-c3 -f`

