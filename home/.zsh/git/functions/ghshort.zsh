function ${CMDLEADER}ghshort () {
        curl -si https://git.io -F "url=$1" | grep Location | cut -d' ' -f 2
}
