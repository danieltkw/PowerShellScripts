




# Daniel T. K. W. (github.com/danieltkw, danielkopolo95@gmail.com)
# Clear the terminal initially
Clear-Host

# PS script to install the requirements of a image analysis code 

$packages = @(
    'tensorflow', 'keras', 'python-telegram-bot', 'absl-py', 'aiohttp', 'aiosignal', 'albumentations',
    'async-timeout', 'asynctest', 'attrs', 'backcall', 'cachetools', 'certifi', 'charset-normalizer',
    'colorama', 'cycler', 'debugpy', 'decorator', 'docopt', 'efficientnet-pytorch', 'entrypoints',
    'filelock', 'fonttools', 'frozenlist', 'fsspec', 'gitdb', 'GitPython', 'grad-cam', 'grpcio',
    'httplib2', 'huggingface-hub', 'idna', 'imageio', 'imgaug', 'importlib-metadata', 'ipykernel',
    'ipympl', 'ipython', 'ipython-genutils', 'ipywidgets', 'jedi', 'joblib', 'jsonpickle', 'jupyter_client',
    'jupyter_core', 'jupyterlab-widgets', 'kiwisolver', 'lightning-utilities', 'Markdown', 'MarkupSafe',
    'matplotlib', 'matplotlib-inline', 'multidict', 'munch', 'nest-asyncio', 'networkx', 'nose', 'numpy',
    'nvidia-cublas-cu11', 'nvidia-cuda-nvrtc-cu11', 'nvidia-cuda-runtime-cu11', 'nvidia-cudnn-cu11',
    'oauth2client', 'oauthlib', 'opencv-python', 'opencv-python-headless', 'packaging', 'pandas', 'parso',
    'pexpect', 'pickleshare', 'Pillow', 'pretrainedmodels', 'prompt-toolkit', 'protobuf', 'psutil',
    'ptyprocess', 'py-cpuinfo', 'pyasn1', 'pyasn1-modules', 'PyDrive', 'Pygments', 'pyparsing',
    'python-dateutil', 'pytorch-lightning', 'pytz', 'PyWavelets', 'PyYAML', 'pyzmq', 'qudida', 'requests',
    'requests-oauthlib', 'resnest', 'rsa', 'sacred', 'scikit-image', 'scikit-learn', 'scipy', 'shapely',
    'six', 'smmap', 'tensorboard', 'tensorboard-data-server', 'tensorboard-plugin-wit', 'tensorboardX',
    'threadpoolctl', 'tifffile', 'timm', 'torch', 'torch-tb-profiler', 'torchinfo', 'torchmetrics',
    'torchvision', 'tornado', 'tqdm', 'traitlets', 'ttach', 'typing_extensions', 'uritemplate', 'urllib3',
    'wcwidth', 'Werkzeug', 'widgetsnbextension', 'wrapt', 'yarl', 'zipp'
)

# Function to install or upgrade using pip
function Install-OrUpgrade-Pip {
    param (
        [string]$package
    )
    try {
        Write-Output "Installing or upgrading $package with pip"
        python -m pip install $package --upgrade
    } catch {
        Write-Error "Failed to install or upgrade $package with pip: $_"
    }
}

# Function to install or upgrade using conda
function Install-OrUpgrade-Conda {
    param (
        [string]$package
    )
    try {
        Write-Output "Installing or upgrading $package with conda"
        conda install $package --yes --update-deps
    } catch {
        Write-Error "Failed to install or upgrade $package with conda: $_"
    }
}

foreach ($package in $packages) {
    Install-OrUpgrade-Pip -package $package
    Install-OrUpgrade-Conda -package $package
}
