echo $HOSTNAME.$_SANDBOX_ID.instruqt.io

[roachie@roach-molt ~]$ /home/roachie/jlab/bin/jupyter lab   --ServerApp.ip=0.0.0.0   --ServerApp.port=8888   --ServerApp.open_browser=False
[I 2025-08-29 00:25:40.433 ServerApp] jupyter_lsp | extension was successfully linked.
[I 2025-08-29 00:25:40.439 ServerApp] jupyter_server_terminals | extension was successfully linked.
[I 2025-08-29 00:25:40.443 ServerApp] jupyterlab | extension was successfully linked.
[I 2025-08-29 00:25:40.725 ServerApp] notebook_shim | extension was successfully linked.
[I 2025-08-29 00:25:40.748 ServerApp] notebook_shim | extension was successfully loaded.
[I 2025-08-29 00:25:40.750 ServerApp] jupyter_lsp | extension was successfully loaded.
[I 2025-08-29 00:25:40.751 ServerApp] jupyter_server_terminals | extension was successfully loaded.
[I 2025-08-29 00:25:40.754 LabApp] JupyterLab extension loaded from /home/roachie/jlab/lib64/python3.9/site-packages/jupyterlab
[I 2025-08-29 00:25:40.754 LabApp] JupyterLab application directory is /home/roachie/jlab/share/jupyter/lab
[I 2025-08-29 00:25:40.754 LabApp] Extension Manager is 'pypi'.
[I 2025-08-29 00:25:40.785 ServerApp] jupyterlab | extension was successfully loaded.
[I 2025-08-29 00:25:40.786 ServerApp] Serving notebooks from local directory: /home/roachie
[I 2025-08-29 00:25:40.786 ServerApp] Jupyter Server 2.17.0 is running at:
[I 2025-08-29 00:25:40.786 ServerApp] http://roach-molt:8888/lab?token=85ffc439b487bee0e9cbdd471485276b5ccb7e4ba860d8ac
[I 2025-08-29 00:25:40.786 ServerApp]     http://127.0.0.1:8888/lab?token=85ffc439b487bee0e9cbdd471485276b5ccb7e4ba860d8ac
[I 2025-08-29 00:25:40.786 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 2025-08-29 00:25:40.792 ServerApp] 
    
    To access the server, open this file in a browser:
        file:///home/roachie/.local/share/jupyter/runtime/jpserver-1957-open.html
    Or copy and paste one of these URLs:
        http://roach-molt:8888/lab?token=85ffc439b487bee0e9cbdd471485276b5ccb7e4ba860d8ac
        http://127.0.0.1:8888/lab?token=85ffc439b487bee0e9cbdd471485276b5ccb7e4ba860d8ac
[I 2025-08-29 00:25:40.809 ServerApp] Skipped non-installed server(s): bash-language-server, dockerfile-language-server-nodejs, javascript-typescript-langserver, jedi-language-server, julia-language-server, pyright, python-language-server, python-lsp-server, r-languageserver, sql-language-server, texlab, typescript-language-server, unified-language-server, vscode-css-languageserver-bin, vscode-html-languageserver-bin, vscode-json-languageserver-bin, yaml-language-server
[W 2025-08-29 00:25:41.717 LabApp] 405 HEAD /lab?reset (@10.56.14.13) 20.15ms referer=https://roach-molt-8888-xtodg6ba8eef.env.play.instruqt.com/lab?reset
[I 2025-08-29 00:25:41.805 LabApp] 302 GET /lab?reset (@10.56.14.142) 0.99ms
