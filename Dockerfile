
# Here you choose the base Docker image for the act. Apify provides the following images:
#  apify/actor-node-basic
#  apify/actor-node-chrome
#  apify/actor-node-chrome-xvfb
# However, you can use any other image from Docker Hub.
# For more information, see https://www.apify.com/docs/actor#base-images
FROM apify/actor-node-basic

# Copy all files and directories from the directory to the Docker image
COPY . ./

# Install NPM packages, skip optional and development dependencies to keep the image small,
# avoid logging to much and show log the dependency tree
RUN npm install --quiet --only=prod --no-optional \
 && npm list

# By default, the Apify's Docker images start Node.js and let it run the "main.js" file.
# You don't need to override this, unless you want to start the image some other way.
# In that case you can override the start command using the CMD instruction:
# CMD [ "npm", "start" ]
