on open dropped_files
  set the_file to item 1 of dropped_files
  set the_path to POSIX path of the_file
  set project_dir to "/Users/davidhuckleberry/Documents/Claude/davidhuckleberry.com"
  try
    do shell script "export PATH=/usr/bin:/bin:/usr/local/bin && cd " & quoted form of project_dir & " && /bin/bash ./update-bg.sh " & quoted form of the_path
    display notification "Site will update in ~1 minute" with title "davidhuckleberry.com updated ✓"
  on error err_msg
    display alert "Update failed" message err_msg
  end try
end open
