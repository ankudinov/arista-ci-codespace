# arista-ci-codespace

This repository can be used to support [Arista CI Workshop](https://aristanetworks.github.io/avd-workshops/cicd-basics/).  
It differs from the original [CI repository](https://github.com/aristanetworks/ci-workshops-avd) in the following aspects:

- The inventory is simplified and covering `site 1` only. The rest is redundant for CI demo and is removed to keep the repository slim and efficient.
- The entire demo can be run on a Github Codespace instance. That simplifies the workflow significantly, as there is not need to do some extra actions in ATD environment after forking.

> **IMPORTANT:** You still need an ATD lab instance to get CVP and the switches.

For the workflow to work, Github secret `CVP_PASSWORD` must be set to ATD password.  
`inventory.yml` must be updated with:

```
---
SITE1:
  children:
    CVP:
      hosts:
        cvp:
          ansible_host: <atd-cvp-url>
```

Uncomment all steps in `.github\workflows\prod.yml` to start using the workflow.
