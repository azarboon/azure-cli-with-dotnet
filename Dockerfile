FROM microsoft/dotnet:2.2-sdk-alpine

# installs dependencies
RUN apt-get update && apt-get install apt-transport-https lsb-release software-properties-common dirmngr -y 

# modify source list
RUN AZ_REPO=$(lsb_release -cs) && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
     tee /etc/apt/sources.list.d/azure-cli.list


# Get the Microsoft signing key

RUN apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv \
     --keyserver packages.microsoft.com \
     --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF

# Install cli
RUN apt-get install azure-cli
