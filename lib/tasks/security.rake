desc "Run security check and show results in browser"
task :sec do
  `brakeman -o tmp/brakeman.html && open tmp/brakeman.html`
end
