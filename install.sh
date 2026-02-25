#!/bin/bash

set -e

echo "Aggiornamento lista pacchetti..."
sudo apt-get update

echo "Installazione di tmux..."
sudo apt-get install -y tmux

SOURCE_CONF="./.tmux.conf"
DEST_CONF="$HOME/.tmux.conf"

if [ ! -f "$SOURCE_CONF" ]; then
    echo "Errore: file $SOURCE_CONF non trovato!"
    exit 1
fi

echo "Copio il file di configurazione in $DEST_CONF..."

cp -f "$SOURCE_CONF" "$DEST_CONF"

echo "Installazione completata con successo!"
