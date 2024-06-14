
# Global Just File

[Justfile](https://github.com/casey/just) with recipes available system wide.

Useful for running regular commands.

## Installing

> __**Note**__<br>
> ```just``` must be installed.

```bash
curl -o ~/.config/just/justfile https://raw.githubusercontent.com/Franco-from-Owlish/global-justfile/main/justfile
```

## Global recipe alias

```bash
for recipe in `just -g --summary`; do
  if [ $recipe != "default" ]; then
    alias $recipe="just -g --working-directory . $recipe";
  if
done
```
