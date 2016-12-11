Stompbox
=======

My personal, ready-to-go development box with Vagrant; comes with .vimrc, .bashrc, and any other config files

## Known issues
If you are running this on a Windows host, you will not be able to use Terraform
(easily) from inside the VM; if you use `terrform get`, you will get "protocol error"
messages due to Terraform trying to create symlinks in a shared directory (you can
apparently solve this by running Vagrant in Administrator mode, but that will
require setting up your ssh client and whatnot in Admin mode).

If you need to keep your Terraform codebase in a shared folder, the recommended
solution is to use the Windows Terraform binary from the host - I do this because I want
to use my editor from the Windows desktop, run (most) of my code inside the VM, and
keep all my codebases in the same place. Just download it and move it to somewhere
on your path where PowerShell can see it.

Alternatively, you can just move your Terraform codebase outside of the shared
folder and run Terraform inside the VM.
