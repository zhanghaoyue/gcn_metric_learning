FROM nvcr.io/nvidia/pytorch:19.01-py3

# run this before copying requirements for cache efficiency
RUN pip install --upgrade pip

# working directory
WORKDIR /gcn_metric_learning

# install in temp directory
RUN mkdir /dependencies

COPY requirements.txt /dependencies/requirements.txt
RUN cd /dependencies && pip3 install -r requirements.txt

# copy code itself from context to image
COPY . /gcn_metric_learning

# copy generated dependencies
RUN cp -r /dependencies/* /gcn_metric_learning/
