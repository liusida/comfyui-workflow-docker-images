# Usage
You can put the workflows in the `./workflows/` folder.

To run the workflow:

```sh
python run.py --service=<comfyui_version_name> --workflow=<workflow_path> --port=8188
```

You can choose one `<comfyui_version_name>` to bring up:

    - comfyui

    - comfyui_ipadapter_plus

`<workflow_path>` can be such as: `./workflows/ipadapter_portrait.json`

The program will download all necessary models on the first run, and will store them in `./models`.

After you see messages like:

```
To see the GUI go to: http://0.0.0.0:8188
```

Open your browser and navigate to `http://localhost:8188/`.

If you don't see your workflow rightaway, click `Load Default`.

And you are good to go.

`./input`, `./output`, `./models`, and `./workflows` will be mounted to ComfyUI, so you can use the images inside them.

# To Build From Scratch

To build image:
```
python build.py ./ComfyUI
```

It'll create an image `liusida:comfyui` locally.

# To Be Done

The image was created as it was. It might need to be updated.