if [[ -x =keychain ]] ; then
  eval $(keychain --eval --quiet id_rsa)
fi
