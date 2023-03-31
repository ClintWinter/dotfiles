# Dotfiles

### Most recent change:

**FINALLY** fixed the lsp/cmp issues.

It was a stupid issue on my part... lsp-zero and cmp were colliding with each other.

Both were trying to manage cmp. This lead to issues with the typescript lsp crashing.

It likely also caused my original copilot setup to fail continually.

I ended up rolling copilot into the cmp directly via a different method.

Also tried to switch to lazyvim unsuccessfully. It was really inconsistent. The errors were different every time I opened nvim.
