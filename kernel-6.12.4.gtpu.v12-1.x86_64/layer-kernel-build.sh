#!/bin/bash

# Exit on any error
set -e

# Check if the right number of arguments are provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <path-to-pull-secret.json> <OCP_VERSION (e.g., 4.16.37)> <KERNEL_NAME>"
  exit 1
fi

# Input parameters
PULL_SECRET="$1"
OCP_VERSION="$2"
KERNEL_NAME="$3"

# Get current username
USERNAME=$(whoami)

# Set docker config path
DOCKER_DIR="/home/${USERNAME}/.docker"
DOCKER_CONFIG="${DOCKER_DIR}/config.json"

# Step 1: Create .docker directory if it doesn't exist
if [ ! -d "$DOCKER_DIR" ]; then
  mkdir -p "$DOCKER_DIR"
  echo "Created directory: $DOCKER_DIR"
fi

# Step 2: Copy the pull secret to the docker config
cp "$PULL_SECRET" "$DOCKER_CONFIG"
echo "Copied pull secret to $DOCKER_CONFIG"

# Step 3: Export the OCP version
export OCP_VERSION

# Step 4: Get the RHCOS release variable
VARIABLE_NAME=$(curl -s "https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_VERSION}/release.txt" \
  | grep -m1 'rhel-coreos' \
  | awk '{print $2}')

if [ -z "$VARIABLE_NAME" ]; then
  echo "Failed to retrieve rhel-coreos release from OpenShift mirror for version $OCP_VERSION"
  exit 2
fi

echo "RHCOS release variable: $VARIABLE_NAME"

# Step 5: Build the image using podman
podman build -t "${KERNEL_NAME}:${OCP_VERSION}" \
  --no-cache \
  --build-arg "rhel_coreos_release=${VARIABLE_NAME}" .

echo "Build completed successfully: ${KERNEL_NAME}:${OCP_VERSION}"
