FROM denoland/deno:ubuntu-2.0.0

# This is the app that runs on port (env PORT)
COPY app/ /home/app
# This is the proxy that
# runs the app in the background
# AND lisens to (env SOCK) and forwards to localhost:(env PORT)
COPY proxy.ts /home/proxy.ts

RUN mkdir -p /var/run/proxy

ENV PORT=80
ENV SOCK="/var/run/proxy/app.sock"

ENTRYPOINT [ "deno", "run", "-A", "--unstable-worker-options", "./home/proxy.ts" ]