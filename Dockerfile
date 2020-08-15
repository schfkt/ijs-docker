FROM jupyter/minimal-notebook:d4cbf2f80a2a

USER root
RUN apt-get update && apt-get install -y gcc g++ make python

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/conda/bin"

USER jovyan
RUN npm install -g ijavascript-await
RUN ijsinstall

USER root
RUN apt-get autoremove -y python

ENV PATH="/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

ENV NODE_PATH="/opt/conda/lib/node_modules/"
USER jovyan

# Additional packages go here
# You'll be able to require it in your notebooks
RUN npm install -g lodash axios dstools
