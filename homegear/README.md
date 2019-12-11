# Homegear as a Hassio add-on

This is a add-on to install and use [homgear](https://homegear.eu/) on Hassio.


## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to Hass.io -> Add-On Store
2. Add the repository as [described here](https://home-assistant.io/hassio/installing_third_party_addons/)
3. Find and install "Homegear" add-on

Don't get nervous after you've hit **Install**. Depending on your hardware and network, it may take up to half an hour before Homegear is installed. Once it appears in the list of installed add-ons, you'll have to **open** and **start** it. I wan't to improve the installation speed soon.

## How it works

A folder named `homegear/` will be added to the `/config` directory of your Hassio installation. `/config` is where all your other Home Assistant config files live as well. You can [access it via Samba](https://home-assistant.io/addons/samba/) for example. `/config/homegear` corresponds to `/etc/homegear` in Homegear. You will need to add your configuration according to the [Homegear docs](https://doc.homegear.eu/data/homegear/configuration.html).

Homegear usually stores its database and other variable data in `/var/lib/homegear`. This directory will be mapped to `/share/homegear/lib` in Hassio. **It is advisable to perform backups of this folder!**

Homegear logs will be in `/share/homegear/log`.

More informations in the [Wiki](https://github.com/kreativmonkey/hassio-addons/wiki) (soon).

## Limitations

Works for me™, but your mileage may vary. I've tested Homematic/MAX! with an Raspberry Pi 3b+, Raspberry Pi 2b and the Hass.io container and an MAX! Cube with [CUL Firmware](https://community.home-assistant.io/t/converting-a-max-cube-to-cul-cun-to-use-with-home-assistant/74218).


# Contribution

You are welcome to open new issues for feature requests ore problems. Also pull requests are *very* welcome, especially to make this add-on work on other platforms.

## Debug

```
docker exec -it <mycontainer> bash
```

## License

Copyright (c) 2019 Sebastian (@kreativmonkey on GitHub).
Copyright (c) 2017 Jan (@yeah on GitHub).

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
