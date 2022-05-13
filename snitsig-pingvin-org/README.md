# snitsig-pingvin-org
Org pieces for the snitsig-pingvin

## Script 
Herein is a bash script, `org-setup.sh` which can be used to get the org setup before
you actually deploy all the other bits.

## What's missing
You'll need to know what ip range to set for a given hosting region.
Consider this page

https://pantheon.corp.google.com/networking/networks/list?_ga=2.75113874.1069137575.1652386313-483955657.1652386313&project=dynolab-153020

Ther us-central1 is listed as: `10.128.0.0/20`. This means that an appropriate range for this peering setup is: `10.128.16.0/28`
