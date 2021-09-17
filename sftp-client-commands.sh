usertest () {
  secret_key="id_ed25519"
  user=test-user
  host=testhost
  tmpfile=/tmp/sftptest.$$

  sftp -b - -o StrictHostKeyChecking=yes -i ${secret_key} ${user}@${host} <<EOF
    pwd
    dir
    put testfile1.txt
    get testfile1.txt testfile2.txt
    lsadf
    dir
    exit
EOF
  exit_code=$?
  if [[ $exit_code != 0 ]]; then
      echo "sftp error" >&2
      exit 1
  fi
}
