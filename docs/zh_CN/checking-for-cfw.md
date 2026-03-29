# 检查自制固件

## Required Reading

这是一个用于检查你的主机是否已安装最新的自制固件的附加章节。

如果你的主机已经可以运行基于 arm9loaderhax 或 boot9strap 的自制固件了，则你将需要根据后续的步骤来将升级到最新的固件。

::: info

If your console has a menuhax-based CFW setup, you should [clear HOME Menu's extdata](troubleshooting-post-install), then follow all instructions on your SysNAND. 且拔出内存卡后开机进入系统设置，可以看到系统版本为 9.2.0-20。

:::

## Instructions

1. 将主机关机
2. 按住 “Select” 键
3. Power on your console while still holding the (Select) button
4. 现在主机应该会显示某种东西的配置菜单。

## What to do next

::: tip

如果主机只是进入到了主菜单，那么返回[新手入门](get-started)章节，按照提供的方法进行安装自制固件。

:::

::: tip

如果你看到 Luma3DS 为 7.0.5 或更低的版本，则你需要 [A9LH 升级 B9S](a9lh-to-b9s)

:::

::: tip

如果你看到 Luma3DS 版本为 7.1，继续至 [升级 B9S](updating-b9s)

:::

::: tip

如果你看到 Luma3DS 的版本为 8.0 或更高版本，则请继续至[更新/恢复自制固件](restoring-updating-cfw)

:::

::: warning

If you see GodMode9, Decrypt9WIP, Hourglass9, or Luma3DS chainloader, you held (Start) by accident and should try these instructions again with (Select)

:::

::: danger

If you see something not described by the above options, join [Nintendo Homebrew on Discord](https://discord.gg/MWxPgEp) and ask, in English, for help.

:::
