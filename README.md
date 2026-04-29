# vms

Vagrant-based VM definitions. One directory per VM, shared provisioning scripts in `provision/`.

## Structure

```
vms/
├── provision/
│   └── base.sh       # runs on every VM
└── <vm-name>/
    └── Vagrantfile
```

To add a new VM, copy the `example/` directory and edit the `Vagrantfile`.

## Prerequisites

### Linux

```bash
sudo dnf install vagrant libvirt libvirt-daemon-qemu qemu-kvm
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $USER
newgrp libvirt
vagrant plugin install vagrant-libvirt
```

### macOS (VMware Fusion — free for commercial use since May 2024)

1. Download and install [VMware Fusion](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion)
2. Install Vagrant: `brew install vagrant`
3. Install the VMware plugin:
   ```bash
   vagrant plugin install vagrant-vmware-desktop
   ```

On Apple Silicon (M1 and later), use an ARM box — see the note in each Vagrantfile.

## Usage

```bash
cd <vm-name>/
vagrant up        # create VM and run provisioner (first time only)
vagrant ssh       # open a shell inside the VM
vagrant halt      # shut down — disk persists
vagrant up        # boot existing VM (provisioner skipped)
vagrant provision # re-run provisioner on a running VM
vagrant destroy   # delete the VM and its disk entirely
```

## Provider selection

On Linux, `libvirt` is used by default.
On macOS, set the provider explicitly:

```bash
VAGRANT_DEFAULT_PROVIDER=vmware_desktop vagrant up
```
