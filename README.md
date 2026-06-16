# My Personal Dotfiles

Here I save all my personal dotfiles.

# Usage

This repo was created to be used with [GNU stow][1].

## Installing stow

[Stow][1] is named equal in all the linux package managers:

Using **apt**:

```bash
sudo apt install stow
```

Using **dnf**:

```bash
sudo dnf install stow
```

Using **pacman**:

```bash
sudo pacman -S stow
```

## Stowing the dotfiles

With stow installed, you just need to run the following command to use the dotfiles:

```bash
stow -Sv --dotfiles <package-name>
```

⚠️ **To prevent accidents, it is hightly recommended to run the following command first:**

```bash
stow -Snv --dotfiles <package-name>
```
This will simulate the stowing before doing something in the disk.

[1]: https://www.gnu.org/s/stow
